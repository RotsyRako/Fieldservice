import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/presentation/controller/home.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:arkup_edoo/presentation/widgets/expandableCard.widget.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/presentation/widgets/filterBottomSheet.widget.dart';

// Providers
final activeFiltersProvider = StateProvider<List<Map<String, dynamic>>>(
  (ref) => [],
);
final filterByProvider = StateProvider<String>((ref) => 'Date');
final orderByProvider = StateProvider<String>(
  (ref) => 'Du plus récent au plus ancien',
);
final interventionSearchProvider = StateProvider<String>((ref) => '');
final _hasFetchedProvider = StateProvider<bool>((ref) => false);

/// Provider pour le TextEditingController
final searchControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  ConsumerState<BaseScreen> createState() => _HomeScreenState();

  void _showFilter(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => FilterBottomSheet(
            onApply: (filterBy, orderBy) {
              ref.read(filterByProvider.notifier).state = filterBy;
              ref.read(orderByProvider.notifier).state = orderBy;

              final newFilter = {
                'filterBy': filterBy,
                'orderBy': orderBy,
                'id': DateTime.now().millisecondsSinceEpoch,
              };
              ref.read(activeFiltersProvider.notifier).state = [newFilter];
            },
          ),
    );
  }

  List<InterventionDTO> _applyFilters(
    List<InterventionDTO> interventions,
    String filterBy,
    String orderBy,
  ) {
    final filtered = List<InterventionDTO>.from(interventions);

    filtered.sort((a, b) {
      switch (filterBy) {
        case "Date":
          final dateAStr = a.dateStart ?? "";
          final dateBStr = b.dateStart ?? "";

          DateTime parseDateFr(String dateStr) {
            final parts = dateStr.split('/');
            if (parts.length != 3) return DateTime(1900);

            final day = int.tryParse(parts[0]);
            final month = int.tryParse(parts[1]);
            final year = int.tryParse(parts[2]);

            if (day == null || month == null || year == null)
              return DateTime(1900);
            return DateTime(year, month, day);
          }

          try {
            final dateA = parseDateFr(dateAStr);
            final dateB = parseDateFr(dateBStr);

            if (orderBy == "Du plus récent au plus ancien") {
              return dateB.compareTo(dateA);
            } else {
              return dateA.compareTo(dateB);
            }
          } catch (e) {
            return 0;
          }

        case "Priorité":
          final priorityA = a.priority ?? "0";
          final priorityB = b.priority ?? "0";

          // Définir l'ordre des priorités
          const priorityOrder = {"1": 2, "0": 1};

          final priorityValueA = priorityOrder[priorityA] ?? 1;
          final priorityValueB = priorityOrder[priorityB] ?? 1;

          if (orderBy == "Du plus prioritaire au moins prioritaire") {
            return priorityValueB.compareTo(priorityValueA);
          } else {
            return priorityValueA.compareTo(priorityValueB);
          }

        case "Distance":
          final distanceA = a.distance ?? 0.0;
          final distanceB = b.distance ?? 0.0;

          if (orderBy == "Du plus proche au plus éloigné") {
            return distanceA.compareTo(distanceB);
          } else {
            return distanceB.compareTo(distanceA);
          }

        default:
          return 0;
      }
    });

    return filtered;
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    final searchController = ref.read(searchControllerProvider);
    final searchText = ref.watch(interventionSearchProvider).toLowerCase();
    final activeFilters = ref.watch(activeFiltersProvider);
    final filterBy = ref.watch(filterByProvider);
    final orderBy = ref.watch(orderByProvider);

    // Chargement initial
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!ref.read(_hasFetchedProvider)) {
        // await controller.getAllInterventionOdoo();
        await controller.fetchInterventions();
        ref.read(_hasFetchedProvider.notifier).state = true;
      }
    });

    ref.listen<AsyncValue<bool>>(connectionStatusProvider, (previous, next) async {
      final isConnected = next.maybeWhen(
        data: (value) => value,
        orElse: () => false,
      );

      if (isConnected) {
        print("Connected =========== ");

        controller.setLoading(show: true, message: "Synchronisation");
        await controller.synchro();
        await controller.fetchInterventions();
        controller.setLoading(show: false, message: "");
        
      }else{
        print("no internet =========== ");
      }
    });

    // Mise à jour de la recherche
    searchController.addListener(() {
      ref.read(interventionSearchProvider.notifier).state =
          searchController.text;
    });

    return BaseScreen.baseScaffoldView(
      ref: ref,
      context: context,
      withHeader: true,
      headerTitle: "Mes interventions",
      useSafeArea: true,
      onRefresh: () async {
        await controller.refetchList();
      },
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Barre de recherche + bouton filtre
            Row(
              children: [
                Expanded(
                  child: Input.textFormField(
                    controller: searchController,
                    label: "Rechercher une intervention",
                    withLabel: false,
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => _showFilter(context, ref),
                  child: Icon(Icons.filter_list, color: ThemeColors.violet),
                ),
              ],
            ),
            const SizedBox(height: 10),
      
            // Badges des filtres actifs
            if (activeFilters.isNotEmpty)
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 8,
                  spacing: 8,
                  children:
                      activeFilters.map((filter) {
                        return Chip(
                          label: Text(
                            filter['orderBy'],
                            style: TextStyle(color: ThemeColors.violet),
                          ),
                          backgroundColor: ThemeColors.violet.withAlpha(50),
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 16,
                            color: ThemeColors.violet,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                              color: ThemeColors.violet.withAlpha(50),
                            ),
                          ),
                          onDeleted: () {
                            ref.read(activeFiltersProvider.notifier).state = [];
                            ref.read(filterByProvider.notifier).state = 'Date';
                            ref.read(orderByProvider.notifier).state =
                                'Du plus récent au plus ancien';
                          },
                        );
                      }).toList(),
                ),
              ),
      
            // Affichage des interventions
            if (state.hasValue) ...[
              ExpandableCard.buildCard(
                context: context,
                title: "En cours",
                items: _applyFilters(
                  state.value!
                      .where(
                        (e) =>
                            e.status == InterventionStatus.inProgress.id &&
                            (e.title?.toLowerCase().contains(searchText) ??
                                false),
                      )
                      .toList(),
                  filterBy,
                  orderBy,
                ),
              ),
              const SizedBox(height: 5),
              ExpandableCard.buildCard(
                context: context,
                title: "Planifiée",
                items: _applyFilters(
                  state.value!
                      .where(
                        (e) =>
                            e.status == InterventionStatus.planned.id &&
                            (e.title?.toLowerCase().contains(searchText) ??
                                false),
                      )
                      .toList(),
                  filterBy,
                  orderBy,
                ),
              ),
              const SizedBox(height: 5),
              ExpandableCard.buildCard(
                context: context,
                title: "Terminées",
                items: _applyFilters(
                  state.value!
                      .where(
                        (e) =>
                            e.status == InterventionStatus.completed.id &&
                            (e.title?.toLowerCase().contains(searchText) ??
                                false),
                      )
                      .toList(),
                  filterBy,
                  orderBy,
                ),
              ),
              const SizedBox(height: 30),
            ],
            if (state.isLoading) const CircularProgressIndicator(),
            if (state.hasError) Text("Erreur : ${state.error}"),
          ],
        ),
      ),
    );
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool hasFetched = false;

  @override
  void initState() {
    super.initState();
    _fetchDataOnce();
  }

  Future<void> _fetchDataOnce() async {
    if (!hasFetched) {
      final controller = ref.read(homeControllerProvider.notifier);
      await controller.getAllInterventionOdoo();
      await controller.fetchInterventions();
      hasFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildBody(context, ref);
  }
}
