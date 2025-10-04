
import 'package:arkup_edoo/models/do/user/user.do.dart';
import 'package:arkup_edoo/models/dto/user/user.dto.dart';
import 'package:arkup_edoo/models/factory/user/user.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/repository/local/user_local.repo.dart';
import 'package:arkup_edoo/service/applying/local/base_local.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userLocalSAProvider = Provider<UserLocalSA>((ref) {
  return UserLocalSA(ref);
});

class UserLocalSA extends BaseLocalSA<
  UserDO,           // Table
  UserDOData,       // Classe générée par Drift
  UserDTO,          // DTO (Freezed)
  UserDOCompanion,    // Companion Drift
  UserFactory,      // Factory
  UserLocalRepo     // Repository
> {
  UserLocalSA(Ref ref) {
    initialize(
      factory: UserFactory(),
      repository: UserLocalRepo(ref), // <- passage du ref
    );
  }

   Future<UserDTO?> findByEmail(String email) async {
    final result = await repository.getOneByEmail(email);
    return result != null ? factory.toDataTransfertObject(result) : null;
  }
}
