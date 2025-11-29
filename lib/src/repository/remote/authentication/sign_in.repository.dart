import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/constants/urls.dart';
import 'package:field_service/src/models/dto/auth/sign_in/sign_in.dto.dart';
import 'package:field_service/src/models/dto/auth/sign_in/sign_in_response.dto.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in.repository.g.dart';

/// Repository pour la connexion (sign in)
/// 
/// Gère les appels API liés à l'authentification des utilisateurs
class SignInRepository {
  final BaseRemoteRepository baseRemoteRepository;

  SignInRepository({
    required this.baseRemoteRepository,
  });

  /// Effectue la connexion d'un utilisateur
  /// 
  /// [email] : Email de l'utilisateur
  /// [password] : Mot de passe de l'utilisateur
  /// 
  /// Retourne un Map contenant les informations de l'utilisateur et le token d'accès
  /// 
  /// Lance une [RemoteException] en cas d'erreur
  Future<SignInResponseDto> signIn(SignInDto signInDto) async {
      final response = await baseRemoteRepository.post(
        Urls.urls.login,
        body: signInDto.toJson(),
        tokenRequired: false, 
      );

      return SignInResponseDto.fromJson(response);
  }

}

/// Provider pour SignInRepository
@Riverpod(keepAlive: true)
SignInRepository signInRepository(Ref ref) {
  final baseRemoteRepo = ref.watch(baseRemoteRepositoryProvider);
  return SignInRepository(
    baseRemoteRepository: baseRemoteRepo,
  );
}

