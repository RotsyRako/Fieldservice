import 'package:drift/drift.dart';

abstract class BaseFactory<Do extends DataClass, Dto, Companion extends Insertable<Do>> {
  Do toDomainObject(Dto dto);
  Dto toDataTransfertObject(Do dom);
  Companion toCompanion(Dto dto, {bool includeId = false});

  List<Do> toDomainObjects(List<Dto> list) => list.map(toDomainObject).toList();
  List<Dto> toDataTransfertObjects(List<Do> list) => list.map(toDataTransfertObject).toList();
}
