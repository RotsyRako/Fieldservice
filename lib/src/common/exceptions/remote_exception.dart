/// Exception pour les erreurs liées aux appels API distants
class RemoteException implements Exception {
  const RemoteException({
    required this.remoteMessage,
    this.code,
  });

  final String remoteMessage;
  final int? code;

  @override
  String toString() => remoteMessage;
}

