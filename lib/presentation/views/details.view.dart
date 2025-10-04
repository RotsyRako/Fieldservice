import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/models/constant/priority_enum.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/presentation/controller/details.controller.dart';
import 'package:arkup_edoo/presentation/controller/suivi_travail.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:arkup_edoo/presentation/views/suivi_travail.view.dart';
import 'package:arkup_edoo/presentation/widgets/interventionDetailsCard.widget.dart';
import 'package:arkup_edoo/presentation/views/detail_tab.view.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:arkup_edoo/common/icons/custom_icon_icons.dart';
import 'package:arkup_edoo/presentation/controller/home.controller.dart';

class DetailsScreen extends BaseScreen {
  const DetailsScreen({
    super.key,
    required this.listIntervention,
    required this.currentIndex,
  });

  final List<InterventionDTO> listIntervention;
  final int currentIndex;

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return _DetailsScreenBody(
      listIntervention: listIntervention,
      currentIndex: currentIndex,
    );
  }
}

class _DetailsScreenBody extends ConsumerStatefulWidget {
  final List<InterventionDTO> listIntervention;
  final int currentIndex;

  const _DetailsScreenBody({
    required this.listIntervention,
    required this.currentIndex,
  });

  @override
  ConsumerState<_DetailsScreenBody> createState() => _DetailsScreenBodyState();
}

class _DetailsScreenBodyState extends ConsumerState<_DetailsScreenBody> {
  late List<InterventionDTO> _interventions;
  late int _index;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _interventions = widget.listIntervention;
    _index = widget.currentIndex;
    _pageController = PageController(initialPage: _index);
  }



  void next() {
    if (_index < _interventions.length - 1) {
      setState(() {
        _index++;
        _pageController.jumpToPage(_index);
      });
    }
  }

  void previous() {
    if (_index > 0) {
      setState(() {
        _index--;
        _pageController.jumpToPage(_index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeControllerProvider, (previous, next) {
      // Réagit uniquement si la liste a changé
      setState(() {});
    });

    
    return BaseScreen.baseScaffoldView(
      ref: ref,
      context: context,
      withHeader: true,
      useSafeArea: false,
      canSwitch: true,
      canGoBack: true,
      onSwitchLeft: previous,
      onSwitchRight: next,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _interventions.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, i) {
          final intervention = ref
              .read(homeControllerProvider.notifier)
              .getInterventionById(_interventions[i].localId!);

          if (intervention == null) return const SizedBox();

          void confirmTimer(String description, String duration) async {
            final formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

            try {
              final nouveauTemps = TempsInterventionDTO(
                date: formattedDate,
                temps: duration,
                description: description,
                idIntervention: intervention.localId!,
              );

              await ref.read(detailsControllerProvider.notifier).saveTimer(nouveauTemps, intervention);
              await ref.read(detailsControllerProvider.notifier).synchro();
              ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
            } catch (e) {
              ref.read(detailsControllerProvider.notifier).showSnackbar("Temps d'intervention non ajouté");
            }
          }

          return KeyedSubtree(
            child: DefaultTabController(
              key: ValueKey(intervention.status),
              length: 2,
              child: Builder(
                builder: (context) {
                  final tabController = DefaultTabController.of(context);
                  return Column(
                    children: [
                      Expanded(
                        child: NestedScrollView(
                          headerSliverBuilder: (context, innerBoxIsScrolled) {
                            return [
                              SliverToBoxAdapter(
                                child: Column(
                                  children: [
                                    InterventionDetailsCard(
                                      interventionId: intervention.localId!,
                                      onConfirm: confirmTimer,
                                    ),
                                    const SizedBox(height: 10),
                                    _buildTabBar(intervention.status, tabController!),
                                  ],
                                ),
                              ),
                            ];
                          },
                          body: Container(
                            decoration: BoxDecoration(
                              color: ThemeColors.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                DetailTab(
                                  priority: intervention.priority.toPriority().displayName,
                                  clientName: intervention.customer,
                                  location: intervention.address,
                                  interventionDescription: intervention.description,
                                  latitude: intervention.lat,
                                  longitude: intervention.long,
                                  clientModalName: intervention.customer,
                                  clientModalPhone: intervention.telephone.toString(),
                                  clientModalAddress: intervention.address,
                                  interventionId: intervention.localId!,
                                ),
                                SuiviTravailScreen(
                                  key: ValueKey(intervention.localId),
                                  intervention: intervention,
                                ),
                              ],
                            ),
                          )
                        ),
                      ),
                      SafeArea(
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            color: Colors.grey.shade200,
                            child: intervention.isSync!
                                ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(CustomIcon.link, color: ThemeColors.violet),
                                    SizedBox(width: 10),
                                    Text(
                                      "Informations synchronisées",
                                      style: TextStyle(fontSize: 18, color: ThemeColors.violet),
                                    ),
                                  ],
                                )
                                : InkWell(
                                  onTap: () {
                                    ref.read(detailsControllerProvider.notifier).synchronisation(context, intervention);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CustomIcon.link, color: ThemeColors.red),
                                      SizedBox(width: 10),
                                      Text(
                                        "Modifications non synchronisées",
                                        style: TextStyle(fontSize: 18, color: ThemeColors.red),
                                      ),
                                    ],
                                  ),
                            )
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBar(int interventionStatus, TabController tabController) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: false,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.purple,
        indicator: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(153, 99, 173, 1), Color.fromRGBO(63, 41, 71, 1)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        onTap: (index) {
          if (interventionStatus == InterventionStatus.planned.id && index == 1) {
            // 🚫 Bloquer accès à "Suivi du travail"
            Future.delayed(const Duration(milliseconds: 100), () {
              tabController.animateTo(0);
              // Afficher message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Le suivi du travail n'est pas encore disponible pour une intervention planifiée."), backgroundColor: Colors.red,),
              );
            });
          }
        },
        tabs: const [
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [Icon(CustomIcon.clipboard_text, size: 14), SizedBox(width: 5), Text("Détail")],
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [Icon(CustomIcon.chats_teardrop, size: 14), SizedBox(width: 5), Text("Suivi du travail")],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
