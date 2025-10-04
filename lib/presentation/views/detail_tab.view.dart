import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/constant/strings.dart';
import 'package:arkup_edoo/presentation/widgets/client_details_modal.widget.dart';
import 'package:arkup_edoo/service/applying/local/intervention/material_local.sa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';

import '../../service/applying/local/intervention/material_required_local.sa.dart';

class DetailTab extends ConsumerWidget {
  final String priority;
  final String clientName;
  final String location;
  final String interventionDescription;
  final String clientModalName;
  final String clientModalPhone;
  final String clientModalAddress;
  final double latitude;
  final double longitude;
  final int interventionId;

  DetailTab({
    super.key,
    required this.priority,
    required this.clientName,
    required this.location,
    required this.interventionDescription,
    required this.clientModalName,
    required this.clientModalPhone,
    required this.clientModalAddress,
    required this.latitude,
    required this.longitude,
    required this.interventionId,
  });

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
  Widget build(BuildContext context, WidgetRef ref) {
    final materialRequireds = ref.watch(
      materialRequiredsForInterventionProvider(interventionId),
    );

    final connectionStatus = ref.watch(connectionStatusProvider);
    final isConnected = connectionStatus.maybeWhen(
      data: (value) => value,
      orElse: () => true,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: ThemeColors.violet,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            Strings.details.priority,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          priority,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: ThemeColors.violet,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            Strings.details.client,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder:
                                (context) => ClientDetailsModal(
                                  clientName: clientModalName,
                                  clientPhone: clientModalPhone,
                                  clientAddress: clientModalAddress,
                                  latitude: latitude,
                                  longitude: longitude,
                                ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              clientName,
                              style: TextStyle(
                                color: ThemeColors.violet,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.open_in_new,
                              color: ThemeColors.violet,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ThemeColors.violet,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      Strings.details.location,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: isConnected ? () => _launchUrl(latitude, longitude) : null,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          location,
                          style: TextStyle(
                            color: ThemeColors.violet,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      if (location.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        Icon(
                          Icons.open_in_new,
                          color: ThemeColors.violet,
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  Strings.details.interventionDescription,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        interventionDescription,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  Strings.details.requiredMaterial,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: materialRequireds.when(
                      data:
                          (data) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                data
                                    .map((item) => _buildMaterialRow(item.name))
                                    .toList(),
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text('Error: $err'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }
}
