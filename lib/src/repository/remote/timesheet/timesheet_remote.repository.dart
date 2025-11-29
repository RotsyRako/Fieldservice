import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/constants/urls.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_list_response.dto.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timesheet_remote.repository.g.dart';

/// Repository pour la récupération distante des feuilles de temps.
class TimesheetRemoteRepository {
  TimesheetRemoteRepository({
    required this.baseRemoteRepository,
  });

  final BaseRemoteRepository baseRemoteRepository;

  /// Récupère la liste des feuilles de temps pour une intervention.
  ///
  /// [idIntervention] : ID de l'intervention pour laquelle récupérer les feuilles de temps.
  Future<TimesheetListResponseDto> fetchTimesheetsByIntervention({
    required String idIntervention,
  }) async {
    final response = await baseRemoteRepository.get(
      Urls.urls.timesheetsByIntervention(idIntervention),
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de récupérer les feuilles de temps',
        );
      }

      return TimesheetListResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la récupération des feuilles de temps',
    );
  }
}

@Riverpod(keepAlive: true)
TimesheetRemoteRepository timesheetRemoteRepository(Ref ref) {
  final baseRemoteRepo = ref.watch(baseRemoteRepositoryProvider);
  return TimesheetRemoteRepository(
    baseRemoteRepository: baseRemoteRepo,
  );
}

