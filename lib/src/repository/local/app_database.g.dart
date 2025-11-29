// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $InterventionsTable extends Interventions
    with TableInfo<$InterventionsTable, Intervention> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterventionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titreMeta = const VerificationMeta('titre');
  @override
  late final GeneratedColumn<String> titre = GeneratedColumn<String>(
    'titre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateStartMeta = const VerificationMeta(
    'dateStart',
  );
  @override
  late final GeneratedColumn<String> dateStart = GeneratedColumn<String>(
    'date_start',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateEndMeta = const VerificationMeta(
    'dateEnd',
  );
  @override
  late final GeneratedColumn<String> dateEnd = GeneratedColumn<String>(
    'date_end',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerMeta = const VerificationMeta(
    'customer',
  );
  @override
  late final GeneratedColumn<String> customer = GeneratedColumn<String>(
    'customer',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<double> long = GeneratedColumn<double>(
    'long',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    titre,
    dateStart,
    dateEnd,
    status,
    priority,
    customer,
    long,
    lat,
    distance,
    description,
    createdAt,
    updatedAt,
    userId,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interventions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Intervention> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('titre')) {
      context.handle(
        _titreMeta,
        titre.isAcceptableOrUnknown(data['titre']!, _titreMeta),
      );
    } else if (isInserting) {
      context.missing(_titreMeta);
    }
    if (data.containsKey('date_start')) {
      context.handle(
        _dateStartMeta,
        dateStart.isAcceptableOrUnknown(data['date_start']!, _dateStartMeta),
      );
    } else if (isInserting) {
      context.missing(_dateStartMeta);
    }
    if (data.containsKey('date_end')) {
      context.handle(
        _dateEndMeta,
        dateEnd.isAcceptableOrUnknown(data['date_end']!, _dateEndMeta),
      );
    } else if (isInserting) {
      context.missing(_dateEndMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('customer')) {
      context.handle(
        _customerMeta,
        customer.isAcceptableOrUnknown(data['customer']!, _customerMeta),
      );
    } else if (isInserting) {
      context.missing(_customerMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
        _longMeta,
        long.isAcceptableOrUnknown(data['long']!, _longMeta),
      );
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Intervention map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Intervention(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      titre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titre'],
      )!,
      dateStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_start'],
      )!,
      dateEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_end'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      customer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer'],
      )!,
      long: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}long'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      )!,
    );
  }

  @override
  $InterventionsTable createAlias(String alias) {
    return $InterventionsTable(attachedDatabase, alias);
  }
}

class Intervention extends DataClass implements Insertable<Intervention> {
  /// Clé primaire locale (auto-incrément)
  final int localId;

  /// ID du serveur (nullable si pas encore synchronisé)
  final String? id;

  /// Titre de l'intervention
  final String titre;

  /// Date de début au format ISO-8601
  final String dateStart;

  /// Date de fin au format ISO-8601
  final String dateEnd;

  /// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
  final int status;

  /// Priorité (haute, moyenne, basse)
  final String priority;

  /// Nom du client
  final String customer;

  /// Longitude
  final double long;

  /// Latitude
  final double lat;

  /// Distance en km
  final double distance;

  /// Description de l'intervention
  final String description;

  /// Date de création
  final DateTime? createdAt;

  /// Date de mise à jour
  final DateTime? updatedAt;

  /// ID de l'utilisateur
  final String userId;

  /// Indique si l'intervention est synchronisée avec le serveur
  final bool isSync;
  const Intervention({
    required this.localId,
    this.id,
    required this.titre,
    required this.dateStart,
    required this.dateEnd,
    required this.status,
    required this.priority,
    required this.customer,
    required this.long,
    required this.lat,
    required this.distance,
    required this.description,
    this.createdAt,
    this.updatedAt,
    required this.userId,
    required this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['titre'] = Variable<String>(titre);
    map['date_start'] = Variable<String>(dateStart);
    map['date_end'] = Variable<String>(dateEnd);
    map['status'] = Variable<int>(status);
    map['priority'] = Variable<String>(priority);
    map['customer'] = Variable<String>(customer);
    map['long'] = Variable<double>(long);
    map['lat'] = Variable<double>(lat);
    map['distance'] = Variable<double>(distance);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['user_id'] = Variable<String>(userId);
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  InterventionsCompanion toCompanion(bool nullToAbsent) {
    return InterventionsCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      titre: Value(titre),
      dateStart: Value(dateStart),
      dateEnd: Value(dateEnd),
      status: Value(status),
      priority: Value(priority),
      customer: Value(customer),
      long: Value(long),
      lat: Value(lat),
      distance: Value(distance),
      description: Value(description),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      userId: Value(userId),
      isSync: Value(isSync),
    );
  }

  factory Intervention.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Intervention(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String?>(json['id']),
      titre: serializer.fromJson<String>(json['titre']),
      dateStart: serializer.fromJson<String>(json['dateStart']),
      dateEnd: serializer.fromJson<String>(json['dateEnd']),
      status: serializer.fromJson<int>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      customer: serializer.fromJson<String>(json['customer']),
      long: serializer.fromJson<double>(json['long']),
      lat: serializer.fromJson<double>(json['lat']),
      distance: serializer.fromJson<double>(json['distance']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      userId: serializer.fromJson<String>(json['userId']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String?>(id),
      'titre': serializer.toJson<String>(titre),
      'dateStart': serializer.toJson<String>(dateStart),
      'dateEnd': serializer.toJson<String>(dateEnd),
      'status': serializer.toJson<int>(status),
      'priority': serializer.toJson<String>(priority),
      'customer': serializer.toJson<String>(customer),
      'long': serializer.toJson<double>(long),
      'lat': serializer.toJson<double>(lat),
      'distance': serializer.toJson<double>(distance),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'userId': serializer.toJson<String>(userId),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  Intervention copyWith({
    int? localId,
    Value<String?> id = const Value.absent(),
    String? titre,
    String? dateStart,
    String? dateEnd,
    int? status,
    String? priority,
    String? customer,
    double? long,
    double? lat,
    double? distance,
    String? description,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? userId,
    bool? isSync,
  }) => Intervention(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    titre: titre ?? this.titre,
    dateStart: dateStart ?? this.dateStart,
    dateEnd: dateEnd ?? this.dateEnd,
    status: status ?? this.status,
    priority: priority ?? this.priority,
    customer: customer ?? this.customer,
    long: long ?? this.long,
    lat: lat ?? this.lat,
    distance: distance ?? this.distance,
    description: description ?? this.description,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    userId: userId ?? this.userId,
    isSync: isSync ?? this.isSync,
  );
  Intervention copyWithCompanion(InterventionsCompanion data) {
    return Intervention(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      titre: data.titre.present ? data.titre.value : this.titre,
      dateStart: data.dateStart.present ? data.dateStart.value : this.dateStart,
      dateEnd: data.dateEnd.present ? data.dateEnd.value : this.dateEnd,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      customer: data.customer.present ? data.customer.value : this.customer,
      long: data.long.present ? data.long.value : this.long,
      lat: data.lat.present ? data.lat.value : this.lat,
      distance: data.distance.present ? data.distance.value : this.distance,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      userId: data.userId.present ? data.userId.value : this.userId,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Intervention(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('titre: $titre, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('customer: $customer, ')
          ..write('long: $long, ')
          ..write('lat: $lat, ')
          ..write('distance: $distance, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userId: $userId, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    titre,
    dateStart,
    dateEnd,
    status,
    priority,
    customer,
    long,
    lat,
    distance,
    description,
    createdAt,
    updatedAt,
    userId,
    isSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Intervention &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.titre == this.titre &&
          other.dateStart == this.dateStart &&
          other.dateEnd == this.dateEnd &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.customer == this.customer &&
          other.long == this.long &&
          other.lat == this.lat &&
          other.distance == this.distance &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.userId == this.userId &&
          other.isSync == this.isSync);
}

class InterventionsCompanion extends UpdateCompanion<Intervention> {
  final Value<int> localId;
  final Value<String?> id;
  final Value<String> titre;
  final Value<String> dateStart;
  final Value<String> dateEnd;
  final Value<int> status;
  final Value<String> priority;
  final Value<String> customer;
  final Value<double> long;
  final Value<double> lat;
  final Value<double> distance;
  final Value<String> description;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> userId;
  final Value<bool> isSync;
  const InterventionsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.titre = const Value.absent(),
    this.dateStart = const Value.absent(),
    this.dateEnd = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.customer = const Value.absent(),
    this.long = const Value.absent(),
    this.lat = const Value.absent(),
    this.distance = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.userId = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  InterventionsCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String titre,
    required String dateStart,
    required String dateEnd,
    required int status,
    required String priority,
    required String customer,
    required double long,
    required double lat,
    required double distance,
    required String description,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String userId,
    this.isSync = const Value.absent(),
  }) : titre = Value(titre),
       dateStart = Value(dateStart),
       dateEnd = Value(dateEnd),
       status = Value(status),
       priority = Value(priority),
       customer = Value(customer),
       long = Value(long),
       lat = Value(lat),
       distance = Value(distance),
       description = Value(description),
       userId = Value(userId);
  static Insertable<Intervention> custom({
    Expression<int>? localId,
    Expression<String>? id,
    Expression<String>? titre,
    Expression<String>? dateStart,
    Expression<String>? dateEnd,
    Expression<int>? status,
    Expression<String>? priority,
    Expression<String>? customer,
    Expression<double>? long,
    Expression<double>? lat,
    Expression<double>? distance,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? userId,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (titre != null) 'titre': titre,
      if (dateStart != null) 'date_start': dateStart,
      if (dateEnd != null) 'date_end': dateEnd,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (customer != null) 'customer': customer,
      if (long != null) 'long': long,
      if (lat != null) 'lat': lat,
      if (distance != null) 'distance': distance,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (userId != null) 'user_id': userId,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  InterventionsCompanion copyWith({
    Value<int>? localId,
    Value<String?>? id,
    Value<String>? titre,
    Value<String>? dateStart,
    Value<String>? dateEnd,
    Value<int>? status,
    Value<String>? priority,
    Value<String>? customer,
    Value<double>? long,
    Value<double>? lat,
    Value<double>? distance,
    Value<String>? description,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? userId,
    Value<bool>? isSync,
  }) {
    return InterventionsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      titre: titre ?? this.titre,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      customer: customer ?? this.customer,
      long: long ?? this.long,
      lat: lat ?? this.lat,
      distance: distance ?? this.distance,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (titre.present) {
      map['titre'] = Variable<String>(titre.value);
    }
    if (dateStart.present) {
      map['date_start'] = Variable<String>(dateStart.value);
    }
    if (dateEnd.present) {
      map['date_end'] = Variable<String>(dateEnd.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (customer.present) {
      map['customer'] = Variable<String>(customer.value);
    }
    if (long.present) {
      map['long'] = Variable<double>(long.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterventionsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('titre: $titre, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('customer: $customer, ')
          ..write('long: $long, ')
          ..write('lat: $lat, ')
          ..write('distance: $distance, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userId: $userId, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $CommentsTable extends Comments with TableInfo<$CommentsTable, Comment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attachmentDataMeta = const VerificationMeta(
    'attachmentData',
  );
  @override
  late final GeneratedColumn<String> attachmentData = GeneratedColumn<String>(
    'attachment_data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attachmentFilenameMeta =
      const VerificationMeta('attachmentFilename');
  @override
  late final GeneratedColumn<String> attachmentFilename =
      GeneratedColumn<String>(
        'attachment_filename',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<String> idIntervention = GeneratedColumn<String>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    message,
    attachmentData,
    attachmentFilename,
    idIntervention,
    createdAt,
    updatedAt,
    date,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Comment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('attachment_data')) {
      context.handle(
        _attachmentDataMeta,
        attachmentData.isAcceptableOrUnknown(
          data['attachment_data']!,
          _attachmentDataMeta,
        ),
      );
    }
    if (data.containsKey('attachment_filename')) {
      context.handle(
        _attachmentFilenameMeta,
        attachmentFilename.isAcceptableOrUnknown(
          data['attachment_filename']!,
          _attachmentFilenameMeta,
        ),
      );
    }
    if (data.containsKey('id_intervention')) {
      context.handle(
        _idInterventionMeta,
        idIntervention.isAcceptableOrUnknown(
          data['id_intervention']!,
          _idInterventionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idInterventionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Comment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Comment(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      attachmentData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachment_data'],
      ),
      attachmentFilename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachment_filename'],
      ),
      idIntervention: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_intervention'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      )!,
    );
  }

  @override
  $CommentsTable createAlias(String alias) {
    return $CommentsTable(attachedDatabase, alias);
  }
}

class Comment extends DataClass implements Insertable<Comment> {
  /// Clé primaire locale (auto-incrément)
  final int localId;

  /// ID du serveur (nullable si pas encore synchronisé)
  final String? id;

  /// Message du commentaire
  final String message;

  /// Données de la pièce jointe encodées en base64
  final String? attachmentData;

  /// Nom du fichier de la pièce jointe
  final String? attachmentFilename;

  /// ID de l'intervention associée
  final String idIntervention;

  /// Date de création
  final DateTime? createdAt;

  /// Date de mise à jour
  final DateTime? updatedAt;

  /// Date du commentaire
  final String date;

  /// Indique si le commentaire est synchronisé avec le serveur
  final bool isSync;
  const Comment({
    required this.localId,
    this.id,
    required this.message,
    this.attachmentData,
    this.attachmentFilename,
    required this.idIntervention,
    this.createdAt,
    this.updatedAt,
    required this.date,
    required this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || attachmentData != null) {
      map['attachment_data'] = Variable<String>(attachmentData);
    }
    if (!nullToAbsent || attachmentFilename != null) {
      map['attachment_filename'] = Variable<String>(attachmentFilename);
    }
    map['id_intervention'] = Variable<String>(idIntervention);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['date'] = Variable<String>(date);
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  CommentsCompanion toCompanion(bool nullToAbsent) {
    return CommentsCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      message: Value(message),
      attachmentData: attachmentData == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentData),
      attachmentFilename: attachmentFilename == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentFilename),
      idIntervention: Value(idIntervention),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      date: Value(date),
      isSync: Value(isSync),
    );
  }

  factory Comment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Comment(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String?>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      attachmentData: serializer.fromJson<String?>(json['attachmentData']),
      attachmentFilename: serializer.fromJson<String?>(
        json['attachmentFilename'],
      ),
      idIntervention: serializer.fromJson<String>(json['idIntervention']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      date: serializer.fromJson<String>(json['date']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String?>(id),
      'message': serializer.toJson<String>(message),
      'attachmentData': serializer.toJson<String?>(attachmentData),
      'attachmentFilename': serializer.toJson<String?>(attachmentFilename),
      'idIntervention': serializer.toJson<String>(idIntervention),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'date': serializer.toJson<String>(date),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  Comment copyWith({
    int? localId,
    Value<String?> id = const Value.absent(),
    String? message,
    Value<String?> attachmentData = const Value.absent(),
    Value<String?> attachmentFilename = const Value.absent(),
    String? idIntervention,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? date,
    bool? isSync,
  }) => Comment(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    message: message ?? this.message,
    attachmentData: attachmentData.present
        ? attachmentData.value
        : this.attachmentData,
    attachmentFilename: attachmentFilename.present
        ? attachmentFilename.value
        : this.attachmentFilename,
    idIntervention: idIntervention ?? this.idIntervention,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    date: date ?? this.date,
    isSync: isSync ?? this.isSync,
  );
  Comment copyWithCompanion(CommentsCompanion data) {
    return Comment(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      message: data.message.present ? data.message.value : this.message,
      attachmentData: data.attachmentData.present
          ? data.attachmentData.value
          : this.attachmentData,
      attachmentFilename: data.attachmentFilename.present
          ? data.attachmentFilename.value
          : this.attachmentFilename,
      idIntervention: data.idIntervention.present
          ? data.idIntervention.value
          : this.idIntervention,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      date: data.date.present ? data.date.value : this.date,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Comment(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('attachmentData: $attachmentData, ')
          ..write('attachmentFilename: $attachmentFilename, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    message,
    attachmentData,
    attachmentFilename,
    idIntervention,
    createdAt,
    updatedAt,
    date,
    isSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.message == this.message &&
          other.attachmentData == this.attachmentData &&
          other.attachmentFilename == this.attachmentFilename &&
          other.idIntervention == this.idIntervention &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.date == this.date &&
          other.isSync == this.isSync);
}

class CommentsCompanion extends UpdateCompanion<Comment> {
  final Value<int> localId;
  final Value<String?> id;
  final Value<String> message;
  final Value<String?> attachmentData;
  final Value<String?> attachmentFilename;
  final Value<String> idIntervention;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> date;
  final Value<bool> isSync;
  const CommentsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.attachmentData = const Value.absent(),
    this.attachmentFilename = const Value.absent(),
    this.idIntervention = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.date = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  CommentsCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String message,
    this.attachmentData = const Value.absent(),
    this.attachmentFilename = const Value.absent(),
    required String idIntervention,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String date,
    this.isSync = const Value.absent(),
  }) : message = Value(message),
       idIntervention = Value(idIntervention),
       date = Value(date);
  static Insertable<Comment> custom({
    Expression<int>? localId,
    Expression<String>? id,
    Expression<String>? message,
    Expression<String>? attachmentData,
    Expression<String>? attachmentFilename,
    Expression<String>? idIntervention,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? date,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (attachmentData != null) 'attachment_data': attachmentData,
      if (attachmentFilename != null) 'attachment_filename': attachmentFilename,
      if (idIntervention != null) 'id_intervention': idIntervention,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (date != null) 'date': date,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  CommentsCompanion copyWith({
    Value<int>? localId,
    Value<String?>? id,
    Value<String>? message,
    Value<String?>? attachmentData,
    Value<String?>? attachmentFilename,
    Value<String>? idIntervention,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? date,
    Value<bool>? isSync,
  }) {
    return CommentsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      message: message ?? this.message,
      attachmentData: attachmentData ?? this.attachmentData,
      attachmentFilename: attachmentFilename ?? this.attachmentFilename,
      idIntervention: idIntervention ?? this.idIntervention,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      date: date ?? this.date,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (attachmentData.present) {
      map['attachment_data'] = Variable<String>(attachmentData.value);
    }
    if (attachmentFilename.present) {
      map['attachment_filename'] = Variable<String>(attachmentFilename.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<String>(idIntervention.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('attachmentData: $attachmentData, ')
          ..write('attachmentFilename: $attachmentFilename, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<String> idIntervention = GeneratedColumn<String>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    filename,
    data,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<Document> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('id_intervention')) {
      context.handle(
        _idInterventionMeta,
        idIntervention.isAcceptableOrUnknown(
          data['id_intervention']!,
          _idInterventionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idInterventionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      idIntervention: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_intervention'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      )!,
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  /// Clé primaire locale (auto-incrément)
  final int localId;

  /// ID du serveur (nullable si pas encore synchronisé)
  final String? id;

  /// Nom du fichier
  final String filename;

  /// Données du document encodées en base64
  final String data;

  /// ID de l'intervention associée
  final String idIntervention;

  /// Date de création
  final DateTime? createdAt;

  /// Date de mise à jour
  final DateTime? updatedAt;

  /// Indique si le document est synchronisé avec le serveur
  final bool isSync;
  const Document({
    required this.localId,
    this.id,
    required this.filename,
    required this.data,
    required this.idIntervention,
    this.createdAt,
    this.updatedAt,
    required this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['filename'] = Variable<String>(filename);
    map['data'] = Variable<String>(data);
    map['id_intervention'] = Variable<String>(idIntervention);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      filename: Value(filename),
      data: Value(data),
      idIntervention: Value(idIntervention),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSync: Value(isSync),
    );
  }

  factory Document.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String?>(json['id']),
      filename: serializer.fromJson<String>(json['filename']),
      data: serializer.fromJson<String>(json['data']),
      idIntervention: serializer.fromJson<String>(json['idIntervention']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String?>(id),
      'filename': serializer.toJson<String>(filename),
      'data': serializer.toJson<String>(data),
      'idIntervention': serializer.toJson<String>(idIntervention),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  Document copyWith({
    int? localId,
    Value<String?> id = const Value.absent(),
    String? filename,
    String? data,
    String? idIntervention,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSync,
  }) => Document(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    filename: filename ?? this.filename,
    data: data ?? this.data,
    idIntervention: idIntervention ?? this.idIntervention,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSync: isSync ?? this.isSync,
  );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      filename: data.filename.present ? data.filename.value : this.filename,
      data: data.data.present ? data.data.value : this.data,
      idIntervention: data.idIntervention.present
          ? data.idIntervention.value
          : this.idIntervention,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('data: $data, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    filename,
    data,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.filename == this.filename &&
          other.data == this.data &&
          other.idIntervention == this.idIntervention &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSync == this.isSync);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> localId;
  final Value<String?> id;
  final Value<String> filename;
  final Value<String> data;
  final Value<String> idIntervention;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSync;
  const DocumentsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.filename = const Value.absent(),
    this.data = const Value.absent(),
    this.idIntervention = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String filename,
    required String data,
    required String idIntervention,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  }) : filename = Value(filename),
       data = Value(data),
       idIntervention = Value(idIntervention);
  static Insertable<Document> custom({
    Expression<int>? localId,
    Expression<String>? id,
    Expression<String>? filename,
    Expression<String>? data,
    Expression<String>? idIntervention,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (filename != null) 'filename': filename,
      if (data != null) 'data': data,
      if (idIntervention != null) 'id_intervention': idIntervention,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  DocumentsCompanion copyWith({
    Value<int>? localId,
    Value<String?>? id,
    Value<String>? filename,
    Value<String>? data,
    Value<String>? idIntervention,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSync,
  }) {
    return DocumentsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      filename: filename ?? this.filename,
      data: data ?? this.data,
      idIntervention: idIntervention ?? this.idIntervention,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<String>(idIntervention.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('data: $data, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, Image> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<String> idIntervention = GeneratedColumn<String>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    filename,
    data,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'images';
  @override
  VerificationContext validateIntegrity(
    Insertable<Image> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('id_intervention')) {
      context.handle(
        _idInterventionMeta,
        idIntervention.isAcceptableOrUnknown(
          data['id_intervention']!,
          _idInterventionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idInterventionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Image map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Image(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      idIntervention: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_intervention'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      )!,
    );
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(attachedDatabase, alias);
  }
}

class Image extends DataClass implements Insertable<Image> {
  /// Clé primaire locale (auto-incrément)
  final int localId;

  /// ID du serveur (nullable si pas encore synchronisé)
  final String? id;

  /// Nom du fichier
  final String filename;

  /// Données de l'image encodées en base64
  final String data;

  /// ID de l'intervention associée
  final String idIntervention;

  /// Date de création
  final DateTime? createdAt;

  /// Date de mise à jour
  final DateTime? updatedAt;

  /// Indique si l'image est synchronisée avec le serveur
  final bool isSync;
  const Image({
    required this.localId,
    this.id,
    required this.filename,
    required this.data,
    required this.idIntervention,
    this.createdAt,
    this.updatedAt,
    required this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['filename'] = Variable<String>(filename);
    map['data'] = Variable<String>(data);
    map['id_intervention'] = Variable<String>(idIntervention);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      filename: Value(filename),
      data: Value(data),
      idIntervention: Value(idIntervention),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSync: Value(isSync),
    );
  }

  factory Image.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Image(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String?>(json['id']),
      filename: serializer.fromJson<String>(json['filename']),
      data: serializer.fromJson<String>(json['data']),
      idIntervention: serializer.fromJson<String>(json['idIntervention']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String?>(id),
      'filename': serializer.toJson<String>(filename),
      'data': serializer.toJson<String>(data),
      'idIntervention': serializer.toJson<String>(idIntervention),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  Image copyWith({
    int? localId,
    Value<String?> id = const Value.absent(),
    String? filename,
    String? data,
    String? idIntervention,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSync,
  }) => Image(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    filename: filename ?? this.filename,
    data: data ?? this.data,
    idIntervention: idIntervention ?? this.idIntervention,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSync: isSync ?? this.isSync,
  );
  Image copyWithCompanion(ImagesCompanion data) {
    return Image(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      filename: data.filename.present ? data.filename.value : this.filename,
      data: data.data.present ? data.data.value : this.data,
      idIntervention: data.idIntervention.present
          ? data.idIntervention.value
          : this.idIntervention,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Image(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('data: $data, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    filename,
    data,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Image &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.filename == this.filename &&
          other.data == this.data &&
          other.idIntervention == this.idIntervention &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSync == this.isSync);
}

class ImagesCompanion extends UpdateCompanion<Image> {
  final Value<int> localId;
  final Value<String?> id;
  final Value<String> filename;
  final Value<String> data;
  final Value<String> idIntervention;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSync;
  const ImagesCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.filename = const Value.absent(),
    this.data = const Value.absent(),
    this.idIntervention = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String filename,
    required String data,
    required String idIntervention,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  }) : filename = Value(filename),
       data = Value(data),
       idIntervention = Value(idIntervention);
  static Insertable<Image> custom({
    Expression<int>? localId,
    Expression<String>? id,
    Expression<String>? filename,
    Expression<String>? data,
    Expression<String>? idIntervention,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (filename != null) 'filename': filename,
      if (data != null) 'data': data,
      if (idIntervention != null) 'id_intervention': idIntervention,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  ImagesCompanion copyWith({
    Value<int>? localId,
    Value<String?>? id,
    Value<String>? filename,
    Value<String>? data,
    Value<String>? idIntervention,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSync,
  }) {
    return ImagesCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      filename: filename ?? this.filename,
      data: data ?? this.data,
      idIntervention: idIntervention ?? this.idIntervention,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<String>(idIntervention.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('data: $data, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $MaterialsTable extends Materials
    with TableInfo<$MaterialsTable, Material> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<String> idIntervention = GeneratedColumn<String>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    name,
    quantity,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'materials';
  @override
  VerificationContext validateIntegrity(
    Insertable<Material> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('id_intervention')) {
      context.handle(
        _idInterventionMeta,
        idIntervention.isAcceptableOrUnknown(
          data['id_intervention']!,
          _idInterventionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idInterventionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Material map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Material(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      idIntervention: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_intervention'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      )!,
    );
  }

  @override
  $MaterialsTable createAlias(String alias) {
    return $MaterialsTable(attachedDatabase, alias);
  }
}

class Material extends DataClass implements Insertable<Material> {
  /// Clé primaire locale (auto-incrément)
  final int localId;

  /// ID du serveur (nullable si pas encore synchronisé)
  final String? id;

  /// Nom du matériau
  final String name;

  /// Quantité
  final int quantity;

  /// ID de l'intervention associée
  final String idIntervention;

  /// Date de création
  final DateTime? createdAt;

  /// Date de mise à jour
  final DateTime? updatedAt;

  /// Indique si le matériau est synchronisé avec le serveur
  final bool isSync;
  const Material({
    required this.localId,
    this.id,
    required this.name,
    required this.quantity,
    required this.idIntervention,
    this.createdAt,
    this.updatedAt,
    required this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<int>(quantity);
    map['id_intervention'] = Variable<String>(idIntervention);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  MaterialsCompanion toCompanion(bool nullToAbsent) {
    return MaterialsCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      quantity: Value(quantity),
      idIntervention: Value(idIntervention),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSync: Value(isSync),
    );
  }

  factory Material.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Material(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<int>(json['quantity']),
      idIntervention: serializer.fromJson<String>(json['idIntervention']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String?>(id),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<int>(quantity),
      'idIntervention': serializer.toJson<String>(idIntervention),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  Material copyWith({
    int? localId,
    Value<String?> id = const Value.absent(),
    String? name,
    int? quantity,
    String? idIntervention,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSync,
  }) => Material(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    idIntervention: idIntervention ?? this.idIntervention,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSync: isSync ?? this.isSync,
  );
  Material copyWithCompanion(MaterialsCompanion data) {
    return Material(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      idIntervention: data.idIntervention.present
          ? data.idIntervention.value
          : this.idIntervention,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Material(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    name,
    quantity,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Material &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.idIntervention == this.idIntervention &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSync == this.isSync);
}

class MaterialsCompanion extends UpdateCompanion<Material> {
  final Value<int> localId;
  final Value<String?> id;
  final Value<String> name;
  final Value<int> quantity;
  final Value<String> idIntervention;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSync;
  const MaterialsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.idIntervention = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  MaterialsCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required int quantity,
    required String idIntervention,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  }) : name = Value(name),
       quantity = Value(quantity),
       idIntervention = Value(idIntervention);
  static Insertable<Material> custom({
    Expression<int>? localId,
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? quantity,
    Expression<String>? idIntervention,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (idIntervention != null) 'id_intervention': idIntervention,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  MaterialsCompanion copyWith({
    Value<int>? localId,
    Value<String?>? id,
    Value<String>? name,
    Value<int>? quantity,
    Value<String>? idIntervention,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSync,
  }) {
    return MaterialsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      idIntervention: idIntervention ?? this.idIntervention,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<String>(idIntervention.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $SignaturesTable extends Signatures
    with TableInfo<$SignaturesTable, Signature> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SignaturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<String> idIntervention = GeneratedColumn<String>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    filename,
    data,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'signatures';
  @override
  VerificationContext validateIntegrity(
    Insertable<Signature> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('id_intervention')) {
      context.handle(
        _idInterventionMeta,
        idIntervention.isAcceptableOrUnknown(
          data['id_intervention']!,
          _idInterventionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idInterventionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Signature map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Signature(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      idIntervention: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_intervention'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      )!,
    );
  }

  @override
  $SignaturesTable createAlias(String alias) {
    return $SignaturesTable(attachedDatabase, alias);
  }
}

class Signature extends DataClass implements Insertable<Signature> {
  /// Clé primaire locale (auto-incrément)
  final int localId;

  /// ID du serveur (nullable si pas encore synchronisé)
  final String? id;

  /// Nom du fichier
  final String filename;

  /// Données de la signature encodées en base64
  final String data;

  /// ID de l'intervention associée
  final String idIntervention;

  /// Date de création
  final DateTime? createdAt;

  /// Date de mise à jour
  final DateTime? updatedAt;

  /// Indique si la signature est synchronisée avec le serveur
  final bool isSync;
  const Signature({
    required this.localId,
    this.id,
    required this.filename,
    required this.data,
    required this.idIntervention,
    this.createdAt,
    this.updatedAt,
    required this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['filename'] = Variable<String>(filename);
    map['data'] = Variable<String>(data);
    map['id_intervention'] = Variable<String>(idIntervention);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  SignaturesCompanion toCompanion(bool nullToAbsent) {
    return SignaturesCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      filename: Value(filename),
      data: Value(data),
      idIntervention: Value(idIntervention),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSync: Value(isSync),
    );
  }

  factory Signature.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Signature(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String?>(json['id']),
      filename: serializer.fromJson<String>(json['filename']),
      data: serializer.fromJson<String>(json['data']),
      idIntervention: serializer.fromJson<String>(json['idIntervention']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String?>(id),
      'filename': serializer.toJson<String>(filename),
      'data': serializer.toJson<String>(data),
      'idIntervention': serializer.toJson<String>(idIntervention),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  Signature copyWith({
    int? localId,
    Value<String?> id = const Value.absent(),
    String? filename,
    String? data,
    String? idIntervention,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSync,
  }) => Signature(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    filename: filename ?? this.filename,
    data: data ?? this.data,
    idIntervention: idIntervention ?? this.idIntervention,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSync: isSync ?? this.isSync,
  );
  Signature copyWithCompanion(SignaturesCompanion data) {
    return Signature(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      filename: data.filename.present ? data.filename.value : this.filename,
      data: data.data.present ? data.data.value : this.data,
      idIntervention: data.idIntervention.present
          ? data.idIntervention.value
          : this.idIntervention,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Signature(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('data: $data, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    filename,
    data,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Signature &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.filename == this.filename &&
          other.data == this.data &&
          other.idIntervention == this.idIntervention &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSync == this.isSync);
}

class SignaturesCompanion extends UpdateCompanion<Signature> {
  final Value<int> localId;
  final Value<String?> id;
  final Value<String> filename;
  final Value<String> data;
  final Value<String> idIntervention;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSync;
  const SignaturesCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.filename = const Value.absent(),
    this.data = const Value.absent(),
    this.idIntervention = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  SignaturesCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String filename,
    required String data,
    required String idIntervention,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  }) : filename = Value(filename),
       data = Value(data),
       idIntervention = Value(idIntervention);
  static Insertable<Signature> custom({
    Expression<int>? localId,
    Expression<String>? id,
    Expression<String>? filename,
    Expression<String>? data,
    Expression<String>? idIntervention,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (filename != null) 'filename': filename,
      if (data != null) 'data': data,
      if (idIntervention != null) 'id_intervention': idIntervention,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  SignaturesCompanion copyWith({
    Value<int>? localId,
    Value<String?>? id,
    Value<String>? filename,
    Value<String>? data,
    Value<String>? idIntervention,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSync,
  }) {
    return SignaturesCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      filename: filename ?? this.filename,
      data: data ?? this.data,
      idIntervention: idIntervention ?? this.idIntervention,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<String>(idIntervention.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SignaturesCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('data: $data, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $TimesheetsTable extends Timesheets
    with TableInfo<$TimesheetsTable, Timesheet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimesheetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeAllocatedMeta = const VerificationMeta(
    'timeAllocated',
  );
  @override
  late final GeneratedColumn<double> timeAllocated = GeneratedColumn<double>(
    'time_allocated',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<String> idIntervention = GeneratedColumn<String>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    description,
    timeAllocated,
    date,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timesheets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Timesheet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('time_allocated')) {
      context.handle(
        _timeAllocatedMeta,
        timeAllocated.isAcceptableOrUnknown(
          data['time_allocated']!,
          _timeAllocatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timeAllocatedMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('id_intervention')) {
      context.handle(
        _idInterventionMeta,
        idIntervention.isAcceptableOrUnknown(
          data['id_intervention']!,
          _idInterventionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idInterventionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Timesheet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Timesheet(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      timeAllocated: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}time_allocated'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      idIntervention: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_intervention'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      )!,
    );
  }

  @override
  $TimesheetsTable createAlias(String alias) {
    return $TimesheetsTable(attachedDatabase, alias);
  }
}

class Timesheet extends DataClass implements Insertable<Timesheet> {
  /// Clé primaire locale (auto-incrément)
  final int localId;

  /// ID du serveur (nullable si pas encore synchronisé)
  final String? id;

  /// Description du travail
  final String description;

  /// Temps alloué en heures
  final double timeAllocated;

  /// Date du travail
  final String date;

  /// ID de l'intervention associée
  final String idIntervention;

  /// Date de création
  final DateTime? createdAt;

  /// Date de mise à jour
  final DateTime? updatedAt;

  /// Indique si la feuille de temps est synchronisée avec le serveur
  final bool isSync;
  const Timesheet({
    required this.localId,
    this.id,
    required this.description,
    required this.timeAllocated,
    required this.date,
    required this.idIntervention,
    this.createdAt,
    this.updatedAt,
    required this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['description'] = Variable<String>(description);
    map['time_allocated'] = Variable<double>(timeAllocated);
    map['date'] = Variable<String>(date);
    map['id_intervention'] = Variable<String>(idIntervention);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  TimesheetsCompanion toCompanion(bool nullToAbsent) {
    return TimesheetsCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: Value(description),
      timeAllocated: Value(timeAllocated),
      date: Value(date),
      idIntervention: Value(idIntervention),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSync: Value(isSync),
    );
  }

  factory Timesheet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Timesheet(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String?>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      timeAllocated: serializer.fromJson<double>(json['timeAllocated']),
      date: serializer.fromJson<String>(json['date']),
      idIntervention: serializer.fromJson<String>(json['idIntervention']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String?>(id),
      'description': serializer.toJson<String>(description),
      'timeAllocated': serializer.toJson<double>(timeAllocated),
      'date': serializer.toJson<String>(date),
      'idIntervention': serializer.toJson<String>(idIntervention),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  Timesheet copyWith({
    int? localId,
    Value<String?> id = const Value.absent(),
    String? description,
    double? timeAllocated,
    String? date,
    String? idIntervention,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSync,
  }) => Timesheet(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    description: description ?? this.description,
    timeAllocated: timeAllocated ?? this.timeAllocated,
    date: date ?? this.date,
    idIntervention: idIntervention ?? this.idIntervention,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSync: isSync ?? this.isSync,
  );
  Timesheet copyWithCompanion(TimesheetsCompanion data) {
    return Timesheet(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
      timeAllocated: data.timeAllocated.present
          ? data.timeAllocated.value
          : this.timeAllocated,
      date: data.date.present ? data.date.value : this.date,
      idIntervention: data.idIntervention.present
          ? data.idIntervention.value
          : this.idIntervention,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Timesheet(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('timeAllocated: $timeAllocated, ')
          ..write('date: $date, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    description,
    timeAllocated,
    date,
    idIntervention,
    createdAt,
    updatedAt,
    isSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Timesheet &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.description == this.description &&
          other.timeAllocated == this.timeAllocated &&
          other.date == this.date &&
          other.idIntervention == this.idIntervention &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSync == this.isSync);
}

class TimesheetsCompanion extends UpdateCompanion<Timesheet> {
  final Value<int> localId;
  final Value<String?> id;
  final Value<String> description;
  final Value<double> timeAllocated;
  final Value<String> date;
  final Value<String> idIntervention;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSync;
  const TimesheetsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.timeAllocated = const Value.absent(),
    this.date = const Value.absent(),
    this.idIntervention = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  TimesheetsCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String description,
    required double timeAllocated,
    required String date,
    required String idIntervention,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSync = const Value.absent(),
  }) : description = Value(description),
       timeAllocated = Value(timeAllocated),
       date = Value(date),
       idIntervention = Value(idIntervention);
  static Insertable<Timesheet> custom({
    Expression<int>? localId,
    Expression<String>? id,
    Expression<String>? description,
    Expression<double>? timeAllocated,
    Expression<String>? date,
    Expression<String>? idIntervention,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (timeAllocated != null) 'time_allocated': timeAllocated,
      if (date != null) 'date': date,
      if (idIntervention != null) 'id_intervention': idIntervention,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  TimesheetsCompanion copyWith({
    Value<int>? localId,
    Value<String?>? id,
    Value<String>? description,
    Value<double>? timeAllocated,
    Value<String>? date,
    Value<String>? idIntervention,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSync,
  }) {
    return TimesheetsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      description: description ?? this.description,
      timeAllocated: timeAllocated ?? this.timeAllocated,
      date: date ?? this.date,
      idIntervention: idIntervention ?? this.idIntervention,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timeAllocated.present) {
      map['time_allocated'] = Variable<double>(timeAllocated.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<String>(idIntervention.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimesheetsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('timeAllocated: $timeAllocated, ')
          ..write('date: $date, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $InterventionsTable interventions = $InterventionsTable(this);
  late final $CommentsTable comments = $CommentsTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $MaterialsTable materials = $MaterialsTable(this);
  late final $SignaturesTable signatures = $SignaturesTable(this);
  late final $TimesheetsTable timesheets = $TimesheetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    interventions,
    comments,
    documents,
    images,
    materials,
    signatures,
    timesheets,
  ];
}

typedef $$InterventionsTableCreateCompanionBuilder =
    InterventionsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      required String titre,
      required String dateStart,
      required String dateEnd,
      required int status,
      required String priority,
      required String customer,
      required double long,
      required double lat,
      required double distance,
      required String description,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String userId,
      Value<bool> isSync,
    });
typedef $$InterventionsTableUpdateCompanionBuilder =
    InterventionsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      Value<String> titre,
      Value<String> dateStart,
      Value<String> dateEnd,
      Value<int> status,
      Value<String> priority,
      Value<String> customer,
      Value<double> long,
      Value<double> lat,
      Value<double> distance,
      Value<String> description,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> userId,
      Value<bool> isSync,
    });

class $$InterventionsTableFilterComposer
    extends Composer<_$AppDatabase, $InterventionsTable> {
  $$InterventionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titre => $composableBuilder(
    column: $table.titre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateStart => $composableBuilder(
    column: $table.dateStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateEnd => $composableBuilder(
    column: $table.dateEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customer => $composableBuilder(
    column: $table.customer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get long => $composableBuilder(
    column: $table.long,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InterventionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InterventionsTable> {
  $$InterventionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titre => $composableBuilder(
    column: $table.titre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateStart => $composableBuilder(
    column: $table.dateStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateEnd => $composableBuilder(
    column: $table.dateEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customer => $composableBuilder(
    column: $table.customer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get long => $composableBuilder(
    column: $table.long,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InterventionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InterventionsTable> {
  $$InterventionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titre =>
      $composableBuilder(column: $table.titre, builder: (column) => column);

  GeneratedColumn<String> get dateStart =>
      $composableBuilder(column: $table.dateStart, builder: (column) => column);

  GeneratedColumn<String> get dateEnd =>
      $composableBuilder(column: $table.dateEnd, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get customer =>
      $composableBuilder(column: $table.customer, builder: (column) => column);

  GeneratedColumn<double> get long =>
      $composableBuilder(column: $table.long, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$InterventionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InterventionsTable,
          Intervention,
          $$InterventionsTableFilterComposer,
          $$InterventionsTableOrderingComposer,
          $$InterventionsTableAnnotationComposer,
          $$InterventionsTableCreateCompanionBuilder,
          $$InterventionsTableUpdateCompanionBuilder,
          (
            Intervention,
            BaseReferences<_$AppDatabase, $InterventionsTable, Intervention>,
          ),
          Intervention,
          PrefetchHooks Function()
        > {
  $$InterventionsTableTableManager(_$AppDatabase db, $InterventionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InterventionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InterventionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InterventionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<String> titre = const Value.absent(),
                Value<String> dateStart = const Value.absent(),
                Value<String> dateEnd = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> customer = const Value.absent(),
                Value<double> long = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => InterventionsCompanion(
                localId: localId,
                id: id,
                titre: titre,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                priority: priority,
                customer: customer,
                long: long,
                lat: lat,
                distance: distance,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                userId: userId,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required String titre,
                required String dateStart,
                required String dateEnd,
                required int status,
                required String priority,
                required String customer,
                required double long,
                required double lat,
                required double distance,
                required String description,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String userId,
                Value<bool> isSync = const Value.absent(),
              }) => InterventionsCompanion.insert(
                localId: localId,
                id: id,
                titre: titre,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                priority: priority,
                customer: customer,
                long: long,
                lat: lat,
                distance: distance,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                userId: userId,
                isSync: isSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InterventionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InterventionsTable,
      Intervention,
      $$InterventionsTableFilterComposer,
      $$InterventionsTableOrderingComposer,
      $$InterventionsTableAnnotationComposer,
      $$InterventionsTableCreateCompanionBuilder,
      $$InterventionsTableUpdateCompanionBuilder,
      (
        Intervention,
        BaseReferences<_$AppDatabase, $InterventionsTable, Intervention>,
      ),
      Intervention,
      PrefetchHooks Function()
    >;
typedef $$CommentsTableCreateCompanionBuilder =
    CommentsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      required String message,
      Value<String?> attachmentData,
      Value<String?> attachmentFilename,
      required String idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String date,
      Value<bool> isSync,
    });
typedef $$CommentsTableUpdateCompanionBuilder =
    CommentsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      Value<String> message,
      Value<String?> attachmentData,
      Value<String?> attachmentFilename,
      Value<String> idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> date,
      Value<bool> isSync,
    });

class $$CommentsTableFilterComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attachmentData => $composableBuilder(
    column: $table.attachmentData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attachmentFilename => $composableBuilder(
    column: $table.attachmentFilename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attachmentData => $composableBuilder(
    column: $table.attachmentData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attachmentFilename => $composableBuilder(
    column: $table.attachmentFilename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get attachmentData => $composableBuilder(
    column: $table.attachmentData,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attachmentFilename => $composableBuilder(
    column: $table.attachmentFilename,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$CommentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentsTable,
          Comment,
          $$CommentsTableFilterComposer,
          $$CommentsTableOrderingComposer,
          $$CommentsTableAnnotationComposer,
          $$CommentsTableCreateCompanionBuilder,
          $$CommentsTableUpdateCompanionBuilder,
          (Comment, BaseReferences<_$AppDatabase, $CommentsTable, Comment>),
          Comment,
          PrefetchHooks Function()
        > {
  $$CommentsTableTableManager(_$AppDatabase db, $CommentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String?> attachmentData = const Value.absent(),
                Value<String?> attachmentFilename = const Value.absent(),
                Value<String> idIntervention = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => CommentsCompanion(
                localId: localId,
                id: id,
                message: message,
                attachmentData: attachmentData,
                attachmentFilename: attachmentFilename,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                date: date,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required String message,
                Value<String?> attachmentData = const Value.absent(),
                Value<String?> attachmentFilename = const Value.absent(),
                required String idIntervention,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String date,
                Value<bool> isSync = const Value.absent(),
              }) => CommentsCompanion.insert(
                localId: localId,
                id: id,
                message: message,
                attachmentData: attachmentData,
                attachmentFilename: attachmentFilename,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                date: date,
                isSync: isSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentsTable,
      Comment,
      $$CommentsTableFilterComposer,
      $$CommentsTableOrderingComposer,
      $$CommentsTableAnnotationComposer,
      $$CommentsTableCreateCompanionBuilder,
      $$CommentsTableUpdateCompanionBuilder,
      (Comment, BaseReferences<_$AppDatabase, $CommentsTable, Comment>),
      Comment,
      PrefetchHooks Function()
    >;
typedef $$DocumentsTableCreateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      required String filename,
      required String data,
      required String idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });
typedef $$DocumentsTableUpdateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      Value<String> filename,
      Value<String> data,
      Value<String> idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$DocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTable,
          Document,
          $$DocumentsTableFilterComposer,
          $$DocumentsTableOrderingComposer,
          $$DocumentsTableAnnotationComposer,
          $$DocumentsTableCreateCompanionBuilder,
          $$DocumentsTableUpdateCompanionBuilder,
          (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
          Document,
          PrefetchHooks Function()
        > {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<String> idIntervention = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => DocumentsCompanion(
                localId: localId,
                id: id,
                filename: filename,
                data: data,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required String filename,
                required String data,
                required String idIntervention,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => DocumentsCompanion.insert(
                localId: localId,
                id: id,
                filename: filename,
                data: data,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTable,
      Document,
      $$DocumentsTableFilterComposer,
      $$DocumentsTableOrderingComposer,
      $$DocumentsTableAnnotationComposer,
      $$DocumentsTableCreateCompanionBuilder,
      $$DocumentsTableUpdateCompanionBuilder,
      (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
      Document,
      PrefetchHooks Function()
    >;
typedef $$ImagesTableCreateCompanionBuilder =
    ImagesCompanion Function({
      Value<int> localId,
      Value<String?> id,
      required String filename,
      required String data,
      required String idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });
typedef $$ImagesTableUpdateCompanionBuilder =
    ImagesCompanion Function({
      Value<int> localId,
      Value<String?> id,
      Value<String> filename,
      Value<String> data,
      Value<String> idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });

class $$ImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$ImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImagesTable,
          Image,
          $$ImagesTableFilterComposer,
          $$ImagesTableOrderingComposer,
          $$ImagesTableAnnotationComposer,
          $$ImagesTableCreateCompanionBuilder,
          $$ImagesTableUpdateCompanionBuilder,
          (Image, BaseReferences<_$AppDatabase, $ImagesTable, Image>),
          Image,
          PrefetchHooks Function()
        > {
  $$ImagesTableTableManager(_$AppDatabase db, $ImagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<String> idIntervention = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => ImagesCompanion(
                localId: localId,
                id: id,
                filename: filename,
                data: data,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required String filename,
                required String data,
                required String idIntervention,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => ImagesCompanion.insert(
                localId: localId,
                id: id,
                filename: filename,
                data: data,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImagesTable,
      Image,
      $$ImagesTableFilterComposer,
      $$ImagesTableOrderingComposer,
      $$ImagesTableAnnotationComposer,
      $$ImagesTableCreateCompanionBuilder,
      $$ImagesTableUpdateCompanionBuilder,
      (Image, BaseReferences<_$AppDatabase, $ImagesTable, Image>),
      Image,
      PrefetchHooks Function()
    >;
typedef $$MaterialsTableCreateCompanionBuilder =
    MaterialsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      required String name,
      required int quantity,
      required String idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });
typedef $$MaterialsTableUpdateCompanionBuilder =
    MaterialsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      Value<String> name,
      Value<int> quantity,
      Value<String> idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });

class $$MaterialsTableFilterComposer
    extends Composer<_$AppDatabase, $MaterialsTable> {
  $$MaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MaterialsTableOrderingComposer
    extends Composer<_$AppDatabase, $MaterialsTable> {
  $$MaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MaterialsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaterialsTable> {
  $$MaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$MaterialsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaterialsTable,
          Material,
          $$MaterialsTableFilterComposer,
          $$MaterialsTableOrderingComposer,
          $$MaterialsTableAnnotationComposer,
          $$MaterialsTableCreateCompanionBuilder,
          $$MaterialsTableUpdateCompanionBuilder,
          (Material, BaseReferences<_$AppDatabase, $MaterialsTable, Material>),
          Material,
          PrefetchHooks Function()
        > {
  $$MaterialsTableTableManager(_$AppDatabase db, $MaterialsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaterialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaterialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String> idIntervention = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => MaterialsCompanion(
                localId: localId,
                id: id,
                name: name,
                quantity: quantity,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required String name,
                required int quantity,
                required String idIntervention,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => MaterialsCompanion.insert(
                localId: localId,
                id: id,
                name: name,
                quantity: quantity,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MaterialsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaterialsTable,
      Material,
      $$MaterialsTableFilterComposer,
      $$MaterialsTableOrderingComposer,
      $$MaterialsTableAnnotationComposer,
      $$MaterialsTableCreateCompanionBuilder,
      $$MaterialsTableUpdateCompanionBuilder,
      (Material, BaseReferences<_$AppDatabase, $MaterialsTable, Material>),
      Material,
      PrefetchHooks Function()
    >;
typedef $$SignaturesTableCreateCompanionBuilder =
    SignaturesCompanion Function({
      Value<int> localId,
      Value<String?> id,
      required String filename,
      required String data,
      required String idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });
typedef $$SignaturesTableUpdateCompanionBuilder =
    SignaturesCompanion Function({
      Value<int> localId,
      Value<String?> id,
      Value<String> filename,
      Value<String> data,
      Value<String> idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });

class $$SignaturesTableFilterComposer
    extends Composer<_$AppDatabase, $SignaturesTable> {
  $$SignaturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SignaturesTableOrderingComposer
    extends Composer<_$AppDatabase, $SignaturesTable> {
  $$SignaturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SignaturesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SignaturesTable> {
  $$SignaturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$SignaturesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SignaturesTable,
          Signature,
          $$SignaturesTableFilterComposer,
          $$SignaturesTableOrderingComposer,
          $$SignaturesTableAnnotationComposer,
          $$SignaturesTableCreateCompanionBuilder,
          $$SignaturesTableUpdateCompanionBuilder,
          (
            Signature,
            BaseReferences<_$AppDatabase, $SignaturesTable, Signature>,
          ),
          Signature,
          PrefetchHooks Function()
        > {
  $$SignaturesTableTableManager(_$AppDatabase db, $SignaturesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SignaturesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SignaturesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SignaturesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<String> idIntervention = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => SignaturesCompanion(
                localId: localId,
                id: id,
                filename: filename,
                data: data,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required String filename,
                required String data,
                required String idIntervention,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => SignaturesCompanion.insert(
                localId: localId,
                id: id,
                filename: filename,
                data: data,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SignaturesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SignaturesTable,
      Signature,
      $$SignaturesTableFilterComposer,
      $$SignaturesTableOrderingComposer,
      $$SignaturesTableAnnotationComposer,
      $$SignaturesTableCreateCompanionBuilder,
      $$SignaturesTableUpdateCompanionBuilder,
      (Signature, BaseReferences<_$AppDatabase, $SignaturesTable, Signature>),
      Signature,
      PrefetchHooks Function()
    >;
typedef $$TimesheetsTableCreateCompanionBuilder =
    TimesheetsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      required String description,
      required double timeAllocated,
      required String date,
      required String idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });
typedef $$TimesheetsTableUpdateCompanionBuilder =
    TimesheetsCompanion Function({
      Value<int> localId,
      Value<String?> id,
      Value<String> description,
      Value<double> timeAllocated,
      Value<String> date,
      Value<String> idIntervention,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSync,
    });

class $$TimesheetsTableFilterComposer
    extends Composer<_$AppDatabase, $TimesheetsTable> {
  $$TimesheetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get timeAllocated => $composableBuilder(
    column: $table.timeAllocated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TimesheetsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimesheetsTable> {
  $$TimesheetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get timeAllocated => $composableBuilder(
    column: $table.timeAllocated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TimesheetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimesheetsTable> {
  $$TimesheetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get timeAllocated => $composableBuilder(
    column: $table.timeAllocated,
    builder: (column) => column,
  );

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get idIntervention => $composableBuilder(
    column: $table.idIntervention,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);
}

class $$TimesheetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimesheetsTable,
          Timesheet,
          $$TimesheetsTableFilterComposer,
          $$TimesheetsTableOrderingComposer,
          $$TimesheetsTableAnnotationComposer,
          $$TimesheetsTableCreateCompanionBuilder,
          $$TimesheetsTableUpdateCompanionBuilder,
          (
            Timesheet,
            BaseReferences<_$AppDatabase, $TimesheetsTable, Timesheet>,
          ),
          Timesheet,
          PrefetchHooks Function()
        > {
  $$TimesheetsTableTableManager(_$AppDatabase db, $TimesheetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimesheetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimesheetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimesheetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> timeAllocated = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> idIntervention = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => TimesheetsCompanion(
                localId: localId,
                id: id,
                description: description,
                timeAllocated: timeAllocated,
                date: date,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required String description,
                required double timeAllocated,
                required String date,
                required String idIntervention,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSync = const Value.absent(),
              }) => TimesheetsCompanion.insert(
                localId: localId,
                id: id,
                description: description,
                timeAllocated: timeAllocated,
                date: date,
                idIntervention: idIntervention,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSync: isSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TimesheetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimesheetsTable,
      Timesheet,
      $$TimesheetsTableFilterComposer,
      $$TimesheetsTableOrderingComposer,
      $$TimesheetsTableAnnotationComposer,
      $$TimesheetsTableCreateCompanionBuilder,
      $$TimesheetsTableUpdateCompanionBuilder,
      (Timesheet, BaseReferences<_$AppDatabase, $TimesheetsTable, Timesheet>),
      Timesheet,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$InterventionsTableTableManager get interventions =>
      $$InterventionsTableTableManager(_db, _db.interventions);
  $$CommentsTableTableManager get comments =>
      $$CommentsTableTableManager(_db, _db.comments);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$ImagesTableTableManager get images =>
      $$ImagesTableTableManager(_db, _db.images);
  $$MaterialsTableTableManager get materials =>
      $$MaterialsTableTableManager(_db, _db.materials);
  $$SignaturesTableTableManager get signatures =>
      $$SignaturesTableTableManager(_db, _db.signatures);
  $$TimesheetsTableTableManager get timesheets =>
      $$TimesheetsTableTableManager(_db, _db.timesheets);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(database)
const databaseProvider = DatabaseProvider._();

final class DatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$databaseHash() => r'0d10cad049f2e39987c611a7b3217988a8e18fb8';
