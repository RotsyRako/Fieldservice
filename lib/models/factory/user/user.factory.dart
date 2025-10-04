import 'package:arkup_edoo/models/dto/user/user.dto.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:drift/drift.dart';

class UserFactory extends BaseFactory<UserDOData, UserDTO, UserDOCompanion> {
  static final UserFactory _instance = UserFactory._internal();

  factory UserFactory() => _instance;
  UserFactory._internal();
  static UserFactory get instance => _instance;

  @override
  UserDOData toDomainObject(UserDTO dto) => UserDOData(
        id: dto.id,
        localId: dto.localId!,
        email: dto.email,
        password: dto.password,
        token: dto.token,
        name: dto.name
      );

  @override
  UserDTO toDataTransfertObject(UserDOData data) => UserDTO(
        id: data.id,
        localId: data.localId,
        email: data.email,
        password: data.password,
        token: data.token,
        name: data.name
      );

  @override
  UserDOCompanion toCompanion(UserDTO dto, {bool includeId = false}) {
    return UserDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: includeId && dto.id != null ? Value(dto.id!) : const Value.absent(),
      email: Value(dto.email),
      password: Value(dto.password),
      token: Value(dto.token),
    );
  }
}