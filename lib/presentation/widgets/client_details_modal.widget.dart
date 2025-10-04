import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/clientDetailsCard.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:arkup_edoo/common/icons/custom_icon_icons.dart';

class ClientDetailsModal extends ConsumerWidget {
  final String clientName;
  final String clientPhone;
  final String clientAddress;
  final double latitude;
  final double longitude;

  const ClientDetailsModal({
    super.key,
    required this.clientName,
    required this.clientPhone,
    required this.clientAddress,
    required this.latitude,
    required this.longitude,
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

  void _makePhoneCall(String phoneNumber) async {
    final uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionStatus = ref.watch(connectionStatusProvider);
    final isConnected = connectionStatus.maybeWhen(
      data: (value) => value,
      orElse: () => true,
    );
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Text(
                'Vinci',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ClientDetailsCard(
                  icon: Icons.person_outline,
                  title: 'Client',
                  value: clientName,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClientDetailsCard(
                  icon: Icons.phone_outlined,
                  title: 'Téléphone',
                  value: clientPhone,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClientDetailsCard(
            icon: Icons.location_on_outlined,
            title: 'Adresse',
            value: clientAddress,
          ),
          const SizedBox(height: 30),
          Button.elevated(
            onPressed: () => _makePhoneCall(clientPhone),
            buttonTitle: 'Appeler',
            icon: const Icon(Icons.call_outlined, color: Colors.white),
            isGradient: true,
          ),
          const SizedBox(height: 10),
          Button.elevated(
            onPressed: isConnected ? () => _launchUrl(latitude, longitude) : null,
            buttonTitle: 'Trouver un itinéraire',
            icon: const Icon(CustomIcon.path, color: ThemeColors.white),
            isGradient: false,
            color: ThemeColors.green,
            textStyle: const TextStyle(
              color: ThemeColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
