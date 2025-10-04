import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';
import 'package:arkup_edoo/presentation/controller/timer.controller.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/dataRangeDisplay.widget.dart';
import 'package:arkup_edoo/presentation/widgets/running_timer.widget.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/constant/timer_status.enum.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/presentation/controller/details.controller.dart';
import 'package:arkup_edoo/presentation/controller/suivi_travail.controller.dart';
import 'package:arkup_edoo/presentation/controller/home.controller.dart';
import 'badge_status_and_distance.widget.dart';
import 'package:arkup_edoo/common/icons/custom_icon_icons.dart';

class InterventionDetailsCard extends ConsumerStatefulWidget {
  final int interventionId;
  final void Function(String, String) onConfirm;

  const InterventionDetailsCard({
    super.key,
    required this.interventionId,
    required this.onConfirm,
  });

  @override
  ConsumerState<InterventionDetailsCard> createState() =>
      _InterventionDetailsCardState();
}

class _InterventionDetailsCardState extends ConsumerState<InterventionDetailsCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(timerNotifierProvider.notifier)
          .loadTimer(widget.interventionId.toString());
    });
  }

  void _launchUrl(double latitude, double longitude) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {


    final intervention = ref.watch(homeControllerProvider).whenOrNull(data: (items) {
      final index = items.indexWhere((i) => i.localId == widget.interventionId);
      return index != -1 ? items[index] : null;
    });

    if (intervention == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final timerState = ref.watch(timerNotifierProvider);

    final tempsInterventions = ref.watch(
      suiviTravailControllerProvider(
        intervention.localId!,
      ).select((data) => data.value?.tempsIntervention ?? []),
    );

    final connectionStatus = ref.watch(connectionStatusProvider);
    final isConnected = connectionStatus.maybeWhen(
      data: (value) => value,
      orElse: () => true,
    );
    final controller = ref.read(detailsControllerProvider.notifier);
    Future<void> onUpdateStatus() async {
      await controller.updateStatusIntervention(intervention);
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BadgeStatusAndDistance(
            status: intervention.status,
            latitude: intervention.lat,
            longitude: intervention.long,
          ),
          const SizedBox(height: 16),
          Text(
            intervention.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          DateRangeDisplay(
            startDate: intervention.dateStart ?? "",
            endDate: intervention.dateEnd ?? "",
          ),
          const SizedBox(height: 24),
          if (intervention.status != InterventionStatus.completed.id)
            if (intervention.status == InterventionStatus.planned.id)
              Column(
                children: [
                  Button.elevated(
                    onPressed: onUpdateStatus,
                    buttonTitle: 'Je suis sur place',
                    height: 50,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    color: ThemeColors.violet,
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Button.elevated(
                    onPressed:
                        isConnected
                            ? () =>
                                _launchUrl(intervention.lat, intervention.long)
                            : null,
                    buttonTitle: 'Trouver un itinéraire',
                    height: 50,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    color: ThemeColors.green,
                    icon: const Icon(
                      CustomIcon.path,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  if (timerState.status != TimerStatus.initial &&
                      timerState.interventionId ==
                          intervention.localId.toString())
                    RunningTimerWidget(onConfirm: widget.onConfirm)
                  else
                    Button.elevated(
                      onPressed: () {
                        ref.read(timerNotifierProvider.notifier).startTimer(
                            intervention.localId.toString());
                      },
                      buttonTitle: "Démarrer l'intervention",
                      height: 50,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      color: ThemeColors.violet,
                      icon: const Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  const SizedBox(height: 12),
                  Button.elevated(
                    onPressed:
                        tempsInterventions.isNotEmpty
                            ? () {
                              ref.read(timerNotifierProvider.notifier).stopTimer();
                              context.push(
                                Routes.signature,
                                extra: intervention,
                              );
                            }
                            : null,
                    buttonTitle: 'Valider et faire signer',
                    height: 50,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    color: ThemeColors.green,
                    icon: const Icon(
                      CustomIcon.signature,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
