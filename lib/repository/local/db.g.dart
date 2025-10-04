// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $UserDOTable extends UserDO with TableInfo<$UserDOTable, UserDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    email,
    password,
    name,
    token,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDOData> instance, {
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
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  UserDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      password:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}password'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      token:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}token'],
          )!,
    );
  }

  @override
  $UserDOTable createAlias(String alias) {
    return $UserDOTable(attachedDatabase, alias);
  }
}

class UserDOData extends DataClass implements Insertable<UserDOData> {
  final int localId;
  final int? id;
  final String email;
  final String password;
  final String name;
  final String token;
  const UserDOData({
    required this.localId,
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.token,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    map['token'] = Variable<String>(token);
    return map;
  }

  UserDOCompanion toCompanion(bool nullToAbsent) {
    return UserDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      email: Value(email),
      password: Value(password),
      name: Value(name),
      token: Value(token),
    );
  }

  factory UserDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
      'token': serializer.toJson<String>(token),
    };
  }

  UserDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? email,
    String? password,
    String? name,
    String? token,
  }) => UserDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    email: email ?? this.email,
    password: password ?? this.password,
    name: name ?? this.name,
    token: token ?? this.token,
  );
  UserDOData copyWithCompanion(UserDOCompanion data) {
    return UserDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      name: data.name.present ? data.name.value : this.name,
      token: data.token.present ? data.token.value : this.token,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, email, password, name, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password &&
          other.name == this.name &&
          other.token == this.token);
}

class UserDOCompanion extends UpdateCompanion<UserDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> email;
  final Value<String> password;
  final Value<String> name;
  final Value<String> token;
  const UserDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.name = const Value.absent(),
    this.token = const Value.absent(),
  });
  UserDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String email,
    required String password,
    required String name,
    required String token,
  }) : email = Value(email),
       password = Value(password),
       name = Value(name),
       token = Value(token);
  static Insertable<UserDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? name,
    Expression<String>? token,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (name != null) 'name': name,
      if (token != null) 'token': token,
    });
  }

  UserDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? email,
    Value<String>? password,
    Value<String>? name,
    Value<String>? token,
  }) {
    return UserDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }
}

class $InterventionDOTable extends InterventionDO
    with TableInfo<$InterventionDOTable, InterventionDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterventionDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateEndMeta = const VerificationMeta(
    'dateEnd',
  );
  @override
  late final GeneratedColumn<String> dateEnd = GeneratedColumn<String>(
    'date_end',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _telephoneMeta = const VerificationMeta(
    'telephone',
  );
  @override
  late final GeneratedColumn<String> telephone = GeneratedColumn<String>(
    'telephone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _signatureMeta = const VerificationMeta(
    'signature',
  );
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
    'signature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TimerStatus?, int> timerStatus =
      GeneratedColumn<int>(
        'timer_status',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<TimerStatus?>(
        $InterventionDOTable.$convertertimerStatusn,
      );
  static const VerificationMeta _elapsedSecondsMeta = const VerificationMeta(
    'elapsedSeconds',
  );
  @override
  late final GeneratedColumn<int> elapsedSeconds = GeneratedColumn<int>(
    'elapsed_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    title,
    dateStart,
    dateEnd,
    status,
    priority,
    description,
    customer,
    long,
    lat,
    address,
    telephone,
    distance,
    signature,
    isSync,
    timerStatus,
    elapsedSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intervention_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<InterventionDOData> instance, {
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date_start')) {
      context.handle(
        _dateStartMeta,
        dateStart.isAcceptableOrUnknown(data['date_start']!, _dateStartMeta),
      );
    }
    if (data.containsKey('date_end')) {
      context.handle(
        _dateEndMeta,
        dateEnd.isAcceptableOrUnknown(data['date_end']!, _dateEndMeta),
      );
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
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('telephone')) {
      context.handle(
        _telephoneMeta,
        telephone.isAcceptableOrUnknown(data['telephone']!, _telephoneMeta),
      );
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(
        _signatureMeta,
        signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta),
      );
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
      );
    }
    if (data.containsKey('elapsed_seconds')) {
      context.handle(
        _elapsedSecondsMeta,
        elapsedSeconds.isAcceptableOrUnknown(
          data['elapsed_seconds']!,
          _elapsedSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  InterventionDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InterventionDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      dateStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_start'],
      ),
      dateEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_end'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}status'],
          )!,
      priority:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}priority'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      customer:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}customer'],
          )!,
      long:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}long'],
          )!,
      lat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}lat'],
          )!,
      address:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}address'],
          )!,
      telephone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telephone'],
      ),
      distance:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}distance'],
          )!,
      signature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature'],
      ),
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      ),
      timerStatus: $InterventionDOTable.$convertertimerStatusn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}timer_status'],
        ),
      ),
      elapsedSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}elapsed_seconds'],
      ),
    );
  }

  @override
  $InterventionDOTable createAlias(String alias) {
    return $InterventionDOTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TimerStatus, int, int> $convertertimerStatus =
      const EnumIndexConverter<TimerStatus>(TimerStatus.values);
  static JsonTypeConverter2<TimerStatus?, int?, int?> $convertertimerStatusn =
      JsonTypeConverter2.asNullable($convertertimerStatus);
}

class InterventionDOData extends DataClass
    implements Insertable<InterventionDOData> {
  final int localId;
  final int? id;
  final String title;
  final String? dateStart;
  final String? dateEnd;
  final int status;
  final String priority;
  final String description;
  final String customer;
  final double long;
  final double lat;
  final String address;
  final String? telephone;
  final double distance;
  final String? signature;
  final bool? isSync;
  final TimerStatus? timerStatus;
  final int? elapsedSeconds;
  const InterventionDOData({
    required this.localId,
    this.id,
    required this.title,
    this.dateStart,
    this.dateEnd,
    required this.status,
    required this.priority,
    required this.description,
    required this.customer,
    required this.long,
    required this.lat,
    required this.address,
    this.telephone,
    required this.distance,
    this.signature,
    this.isSync,
    this.timerStatus,
    this.elapsedSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || dateStart != null) {
      map['date_start'] = Variable<String>(dateStart);
    }
    if (!nullToAbsent || dateEnd != null) {
      map['date_end'] = Variable<String>(dateEnd);
    }
    map['status'] = Variable<int>(status);
    map['priority'] = Variable<String>(priority);
    map['description'] = Variable<String>(description);
    map['customer'] = Variable<String>(customer);
    map['long'] = Variable<double>(long);
    map['lat'] = Variable<double>(lat);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || telephone != null) {
      map['telephone'] = Variable<String>(telephone);
    }
    map['distance'] = Variable<double>(distance);
    if (!nullToAbsent || signature != null) {
      map['signature'] = Variable<String>(signature);
    }
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    if (!nullToAbsent || timerStatus != null) {
      map['timer_status'] = Variable<int>(
        $InterventionDOTable.$convertertimerStatusn.toSql(timerStatus),
      );
    }
    if (!nullToAbsent || elapsedSeconds != null) {
      map['elapsed_seconds'] = Variable<int>(elapsedSeconds);
    }
    return map;
  }

  InterventionDOCompanion toCompanion(bool nullToAbsent) {
    return InterventionDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      dateStart:
          dateStart == null && nullToAbsent
              ? const Value.absent()
              : Value(dateStart),
      dateEnd:
          dateEnd == null && nullToAbsent
              ? const Value.absent()
              : Value(dateEnd),
      status: Value(status),
      priority: Value(priority),
      description: Value(description),
      customer: Value(customer),
      long: Value(long),
      lat: Value(lat),
      address: Value(address),
      telephone:
          telephone == null && nullToAbsent
              ? const Value.absent()
              : Value(telephone),
      distance: Value(distance),
      signature:
          signature == null && nullToAbsent
              ? const Value.absent()
              : Value(signature),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
      timerStatus:
          timerStatus == null && nullToAbsent
              ? const Value.absent()
              : Value(timerStatus),
      elapsedSeconds:
          elapsedSeconds == null && nullToAbsent
              ? const Value.absent()
              : Value(elapsedSeconds),
    );
  }

  factory InterventionDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InterventionDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      dateStart: serializer.fromJson<String?>(json['dateStart']),
      dateEnd: serializer.fromJson<String?>(json['dateEnd']),
      status: serializer.fromJson<int>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      description: serializer.fromJson<String>(json['description']),
      customer: serializer.fromJson<String>(json['customer']),
      long: serializer.fromJson<double>(json['long']),
      lat: serializer.fromJson<double>(json['lat']),
      address: serializer.fromJson<String>(json['address']),
      telephone: serializer.fromJson<String?>(json['telephone']),
      distance: serializer.fromJson<double>(json['distance']),
      signature: serializer.fromJson<String?>(json['signature']),
      isSync: serializer.fromJson<bool?>(json['isSync']),
      timerStatus: $InterventionDOTable.$convertertimerStatusn.fromJson(
        serializer.fromJson<int?>(json['timerStatus']),
      ),
      elapsedSeconds: serializer.fromJson<int?>(json['elapsedSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'dateStart': serializer.toJson<String?>(dateStart),
      'dateEnd': serializer.toJson<String?>(dateEnd),
      'status': serializer.toJson<int>(status),
      'priority': serializer.toJson<String>(priority),
      'description': serializer.toJson<String>(description),
      'customer': serializer.toJson<String>(customer),
      'long': serializer.toJson<double>(long),
      'lat': serializer.toJson<double>(lat),
      'address': serializer.toJson<String>(address),
      'telephone': serializer.toJson<String?>(telephone),
      'distance': serializer.toJson<double>(distance),
      'signature': serializer.toJson<String?>(signature),
      'isSync': serializer.toJson<bool?>(isSync),
      'timerStatus': serializer.toJson<int?>(
        $InterventionDOTable.$convertertimerStatusn.toJson(timerStatus),
      ),
      'elapsedSeconds': serializer.toJson<int?>(elapsedSeconds),
    };
  }

  InterventionDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? title,
    Value<String?> dateStart = const Value.absent(),
    Value<String?> dateEnd = const Value.absent(),
    int? status,
    String? priority,
    String? description,
    String? customer,
    double? long,
    double? lat,
    String? address,
    Value<String?> telephone = const Value.absent(),
    double? distance,
    Value<String?> signature = const Value.absent(),
    Value<bool?> isSync = const Value.absent(),
    Value<TimerStatus?> timerStatus = const Value.absent(),
    Value<int?> elapsedSeconds = const Value.absent(),
  }) => InterventionDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    title: title ?? this.title,
    dateStart: dateStart.present ? dateStart.value : this.dateStart,
    dateEnd: dateEnd.present ? dateEnd.value : this.dateEnd,
    status: status ?? this.status,
    priority: priority ?? this.priority,
    description: description ?? this.description,
    customer: customer ?? this.customer,
    long: long ?? this.long,
    lat: lat ?? this.lat,
    address: address ?? this.address,
    telephone: telephone.present ? telephone.value : this.telephone,
    distance: distance ?? this.distance,
    signature: signature.present ? signature.value : this.signature,
    isSync: isSync.present ? isSync.value : this.isSync,
    timerStatus: timerStatus.present ? timerStatus.value : this.timerStatus,
    elapsedSeconds:
        elapsedSeconds.present ? elapsedSeconds.value : this.elapsedSeconds,
  );
  InterventionDOData copyWithCompanion(InterventionDOCompanion data) {
    return InterventionDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      dateStart: data.dateStart.present ? data.dateStart.value : this.dateStart,
      dateEnd: data.dateEnd.present ? data.dateEnd.value : this.dateEnd,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      description:
          data.description.present ? data.description.value : this.description,
      customer: data.customer.present ? data.customer.value : this.customer,
      long: data.long.present ? data.long.value : this.long,
      lat: data.lat.present ? data.lat.value : this.lat,
      address: data.address.present ? data.address.value : this.address,
      telephone: data.telephone.present ? data.telephone.value : this.telephone,
      distance: data.distance.present ? data.distance.value : this.distance,
      signature: data.signature.present ? data.signature.value : this.signature,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      timerStatus:
          data.timerStatus.present ? data.timerStatus.value : this.timerStatus,
      elapsedSeconds:
          data.elapsedSeconds.present
              ? data.elapsedSeconds.value
              : this.elapsedSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InterventionDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('description: $description, ')
          ..write('customer: $customer, ')
          ..write('long: $long, ')
          ..write('lat: $lat, ')
          ..write('address: $address, ')
          ..write('telephone: $telephone, ')
          ..write('distance: $distance, ')
          ..write('signature: $signature, ')
          ..write('isSync: $isSync, ')
          ..write('timerStatus: $timerStatus, ')
          ..write('elapsedSeconds: $elapsedSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    title,
    dateStart,
    dateEnd,
    status,
    priority,
    description,
    customer,
    long,
    lat,
    address,
    telephone,
    distance,
    signature,
    isSync,
    timerStatus,
    elapsedSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InterventionDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.title == this.title &&
          other.dateStart == this.dateStart &&
          other.dateEnd == this.dateEnd &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.description == this.description &&
          other.customer == this.customer &&
          other.long == this.long &&
          other.lat == this.lat &&
          other.address == this.address &&
          other.telephone == this.telephone &&
          other.distance == this.distance &&
          other.signature == this.signature &&
          other.isSync == this.isSync &&
          other.timerStatus == this.timerStatus &&
          other.elapsedSeconds == this.elapsedSeconds);
}

class InterventionDOCompanion extends UpdateCompanion<InterventionDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> title;
  final Value<String?> dateStart;
  final Value<String?> dateEnd;
  final Value<int> status;
  final Value<String> priority;
  final Value<String> description;
  final Value<String> customer;
  final Value<double> long;
  final Value<double> lat;
  final Value<String> address;
  final Value<String?> telephone;
  final Value<double> distance;
  final Value<String?> signature;
  final Value<bool?> isSync;
  final Value<TimerStatus?> timerStatus;
  final Value<int?> elapsedSeconds;
  const InterventionDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.dateStart = const Value.absent(),
    this.dateEnd = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.description = const Value.absent(),
    this.customer = const Value.absent(),
    this.long = const Value.absent(),
    this.lat = const Value.absent(),
    this.address = const Value.absent(),
    this.telephone = const Value.absent(),
    this.distance = const Value.absent(),
    this.signature = const Value.absent(),
    this.isSync = const Value.absent(),
    this.timerStatus = const Value.absent(),
    this.elapsedSeconds = const Value.absent(),
  });
  InterventionDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String title,
    this.dateStart = const Value.absent(),
    this.dateEnd = const Value.absent(),
    required int status,
    required String priority,
    required String description,
    required String customer,
    required double long,
    required double lat,
    required String address,
    this.telephone = const Value.absent(),
    required double distance,
    this.signature = const Value.absent(),
    this.isSync = const Value.absent(),
    this.timerStatus = const Value.absent(),
    this.elapsedSeconds = const Value.absent(),
  }) : title = Value(title),
       status = Value(status),
       priority = Value(priority),
       description = Value(description),
       customer = Value(customer),
       long = Value(long),
       lat = Value(lat),
       address = Value(address),
       distance = Value(distance);
  static Insertable<InterventionDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? dateStart,
    Expression<String>? dateEnd,
    Expression<int>? status,
    Expression<String>? priority,
    Expression<String>? description,
    Expression<String>? customer,
    Expression<double>? long,
    Expression<double>? lat,
    Expression<String>? address,
    Expression<String>? telephone,
    Expression<double>? distance,
    Expression<String>? signature,
    Expression<bool>? isSync,
    Expression<int>? timerStatus,
    Expression<int>? elapsedSeconds,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (dateStart != null) 'date_start': dateStart,
      if (dateEnd != null) 'date_end': dateEnd,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (description != null) 'description': description,
      if (customer != null) 'customer': customer,
      if (long != null) 'long': long,
      if (lat != null) 'lat': lat,
      if (address != null) 'address': address,
      if (telephone != null) 'telephone': telephone,
      if (distance != null) 'distance': distance,
      if (signature != null) 'signature': signature,
      if (isSync != null) 'is_sync': isSync,
      if (timerStatus != null) 'timer_status': timerStatus,
      if (elapsedSeconds != null) 'elapsed_seconds': elapsedSeconds,
    });
  }

  InterventionDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? title,
    Value<String?>? dateStart,
    Value<String?>? dateEnd,
    Value<int>? status,
    Value<String>? priority,
    Value<String>? description,
    Value<String>? customer,
    Value<double>? long,
    Value<double>? lat,
    Value<String>? address,
    Value<String?>? telephone,
    Value<double>? distance,
    Value<String?>? signature,
    Value<bool?>? isSync,
    Value<TimerStatus?>? timerStatus,
    Value<int?>? elapsedSeconds,
  }) {
    return InterventionDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      title: title ?? this.title,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      description: description ?? this.description,
      customer: customer ?? this.customer,
      long: long ?? this.long,
      lat: lat ?? this.lat,
      address: address ?? this.address,
      telephone: telephone ?? this.telephone,
      distance: distance ?? this.distance,
      signature: signature ?? this.signature,
      isSync: isSync ?? this.isSync,
      timerStatus: timerStatus ?? this.timerStatus,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (telephone.present) {
      map['telephone'] = Variable<String>(telephone.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (timerStatus.present) {
      map['timer_status'] = Variable<int>(
        $InterventionDOTable.$convertertimerStatusn.toSql(timerStatus.value),
      );
    }
    if (elapsedSeconds.present) {
      map['elapsed_seconds'] = Variable<int>(elapsedSeconds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterventionDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('description: $description, ')
          ..write('customer: $customer, ')
          ..write('long: $long, ')
          ..write('lat: $lat, ')
          ..write('address: $address, ')
          ..write('telephone: $telephone, ')
          ..write('distance: $distance, ')
          ..write('signature: $signature, ')
          ..write('isSync: $isSync, ')
          ..write('timerStatus: $timerStatus, ')
          ..write('elapsedSeconds: $elapsedSeconds')
          ..write(')'))
        .toString();
  }
}

class $PhotoDOTable extends PhotoDO with TableInfo<$PhotoDOTable, PhotoDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
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
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<int> idIntervention = GeneratedColumn<int>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES intervention_d_o (local_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    name,
    location,
    isSync,
    idIntervention,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoDOData> instance, {
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
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  PhotoDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      location:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}location'],
          )!,
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      ),
      idIntervention:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_intervention'],
          )!,
    );
  }

  @override
  $PhotoDOTable createAlias(String alias) {
    return $PhotoDOTable(attachedDatabase, alias);
  }
}

class PhotoDOData extends DataClass implements Insertable<PhotoDOData> {
  final int localId;
  final int? id;
  final String name;
  final String location;
  final bool? isSync;
  final int idIntervention;
  const PhotoDOData({
    required this.localId,
    this.id,
    required this.name,
    required this.location,
    this.isSync,
    required this.idIntervention,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['location'] = Variable<String>(location);
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    map['id_intervention'] = Variable<int>(idIntervention);
    return map;
  }

  PhotoDOCompanion toCompanion(bool nullToAbsent) {
    return PhotoDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      location: Value(location),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
      idIntervention: Value(idIntervention),
    );
  }

  factory PhotoDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String>(json['location']),
      isSync: serializer.fromJson<bool?>(json['isSync']),
      idIntervention: serializer.fromJson<int>(json['idIntervention']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String>(location),
      'isSync': serializer.toJson<bool?>(isSync),
      'idIntervention': serializer.toJson<int>(idIntervention),
    };
  }

  PhotoDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? name,
    String? location,
    Value<bool?> isSync = const Value.absent(),
    int? idIntervention,
  }) => PhotoDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    location: location ?? this.location,
    isSync: isSync.present ? isSync.value : this.isSync,
    idIntervention: idIntervention ?? this.idIntervention,
  );
  PhotoDOData copyWithCompanion(PhotoDOCompanion data) {
    return PhotoDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      idIntervention:
          data.idIntervention.present
              ? data.idIntervention.value
              : this.idIntervention,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, id, name, location, isSync, idIntervention);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.name == this.name &&
          other.location == this.location &&
          other.isSync == this.isSync &&
          other.idIntervention == this.idIntervention);
}

class PhotoDOCompanion extends UpdateCompanion<PhotoDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> name;
  final Value<String> location;
  final Value<bool?> isSync;
  final Value<int> idIntervention;
  const PhotoDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.isSync = const Value.absent(),
    this.idIntervention = const Value.absent(),
  });
  PhotoDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required String location,
    this.isSync = const Value.absent(),
    required int idIntervention,
  }) : name = Value(name),
       location = Value(location),
       idIntervention = Value(idIntervention);
  static Insertable<PhotoDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? location,
    Expression<bool>? isSync,
    Expression<int>? idIntervention,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (isSync != null) 'is_sync': isSync,
      if (idIntervention != null) 'id_intervention': idIntervention,
    });
  }

  PhotoDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? name,
    Value<String>? location,
    Value<bool?>? isSync,
    Value<int>? idIntervention,
  }) {
    return PhotoDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      isSync: isSync ?? this.isSync,
      idIntervention: idIntervention ?? this.idIntervention,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<int>(idIntervention.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }
}

class $TempsInterventionDOTable extends TempsInterventionDO
    with TableInfo<$TempsInterventionDOTable, TempsInterventionDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TempsInterventionDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _tempsMeta = const VerificationMeta('temps');
  @override
  late final GeneratedColumn<String> temps = GeneratedColumn<String>(
    'temps',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<int> idIntervention = GeneratedColumn<int>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES intervention_d_o (local_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    date,
    temps,
    description,
    isSync,
    idIntervention,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'temps_intervention_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<TempsInterventionDOData> instance, {
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
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('temps')) {
      context.handle(
        _tempsMeta,
        temps.isAcceptableOrUnknown(data['temps']!, _tempsMeta),
      );
    } else if (isInserting) {
      context.missing(_tempsMeta);
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
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  TempsInterventionDOData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TempsInterventionDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}date'],
          )!,
      temps:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}temps'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      ),
      idIntervention:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_intervention'],
          )!,
    );
  }

  @override
  $TempsInterventionDOTable createAlias(String alias) {
    return $TempsInterventionDOTable(attachedDatabase, alias);
  }
}

class TempsInterventionDOData extends DataClass
    implements Insertable<TempsInterventionDOData> {
  final int localId;
  final int? id;
  final String date;
  final String temps;
  final String description;
  final bool? isSync;
  final int idIntervention;
  const TempsInterventionDOData({
    required this.localId,
    this.id,
    required this.date,
    required this.temps,
    required this.description,
    this.isSync,
    required this.idIntervention,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['date'] = Variable<String>(date);
    map['temps'] = Variable<String>(temps);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    map['id_intervention'] = Variable<int>(idIntervention);
    return map;
  }

  TempsInterventionDOCompanion toCompanion(bool nullToAbsent) {
    return TempsInterventionDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: Value(date),
      temps: Value(temps),
      description: Value(description),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
      idIntervention: Value(idIntervention),
    );
  }

  factory TempsInterventionDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TempsInterventionDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      date: serializer.fromJson<String>(json['date']),
      temps: serializer.fromJson<String>(json['temps']),
      description: serializer.fromJson<String>(json['description']),
      isSync: serializer.fromJson<bool?>(json['isSync']),
      idIntervention: serializer.fromJson<int>(json['idIntervention']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'date': serializer.toJson<String>(date),
      'temps': serializer.toJson<String>(temps),
      'description': serializer.toJson<String>(description),
      'isSync': serializer.toJson<bool?>(isSync),
      'idIntervention': serializer.toJson<int>(idIntervention),
    };
  }

  TempsInterventionDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? date,
    String? temps,
    String? description,
    Value<bool?> isSync = const Value.absent(),
    int? idIntervention,
  }) => TempsInterventionDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    date: date ?? this.date,
    temps: temps ?? this.temps,
    description: description ?? this.description,
    isSync: isSync.present ? isSync.value : this.isSync,
    idIntervention: idIntervention ?? this.idIntervention,
  );
  TempsInterventionDOData copyWithCompanion(TempsInterventionDOCompanion data) {
    return TempsInterventionDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      temps: data.temps.present ? data.temps.value : this.temps,
      description:
          data.description.present ? data.description.value : this.description,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      idIntervention:
          data.idIntervention.present
              ? data.idIntervention.value
              : this.idIntervention,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TempsInterventionDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('temps: $temps, ')
          ..write('description: $description, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    id,
    date,
    temps,
    description,
    isSync,
    idIntervention,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TempsInterventionDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.date == this.date &&
          other.temps == this.temps &&
          other.description == this.description &&
          other.isSync == this.isSync &&
          other.idIntervention == this.idIntervention);
}

class TempsInterventionDOCompanion
    extends UpdateCompanion<TempsInterventionDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> date;
  final Value<String> temps;
  final Value<String> description;
  final Value<bool?> isSync;
  final Value<int> idIntervention;
  const TempsInterventionDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.temps = const Value.absent(),
    this.description = const Value.absent(),
    this.isSync = const Value.absent(),
    this.idIntervention = const Value.absent(),
  });
  TempsInterventionDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String date,
    required String temps,
    required String description,
    this.isSync = const Value.absent(),
    required int idIntervention,
  }) : date = Value(date),
       temps = Value(temps),
       description = Value(description),
       idIntervention = Value(idIntervention);
  static Insertable<TempsInterventionDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? date,
    Expression<String>? temps,
    Expression<String>? description,
    Expression<bool>? isSync,
    Expression<int>? idIntervention,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (temps != null) 'temps': temps,
      if (description != null) 'description': description,
      if (isSync != null) 'is_sync': isSync,
      if (idIntervention != null) 'id_intervention': idIntervention,
    });
  }

  TempsInterventionDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? date,
    Value<String>? temps,
    Value<String>? description,
    Value<bool?>? isSync,
    Value<int>? idIntervention,
  }) {
    return TempsInterventionDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      date: date ?? this.date,
      temps: temps ?? this.temps,
      description: description ?? this.description,
      isSync: isSync ?? this.isSync,
      idIntervention: idIntervention ?? this.idIntervention,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (temps.present) {
      map['temps'] = Variable<String>(temps.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<int>(idIntervention.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TempsInterventionDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('temps: $temps, ')
          ..write('description: $description, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }
}

class $DocumentDOTable extends DocumentDO
    with TableInfo<$DocumentDOTable, DocumentDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
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
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<int> idIntervention = GeneratedColumn<int>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES intervention_d_o (local_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    name,
    location,
    isSync,
    idIntervention,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentDOData> instance, {
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
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  DocumentDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      location:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}location'],
          )!,
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      ),
      idIntervention:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_intervention'],
          )!,
    );
  }

  @override
  $DocumentDOTable createAlias(String alias) {
    return $DocumentDOTable(attachedDatabase, alias);
  }
}

class DocumentDOData extends DataClass implements Insertable<DocumentDOData> {
  final int localId;
  final int? id;
  final String name;
  final String location;
  final bool? isSync;
  final int idIntervention;
  const DocumentDOData({
    required this.localId,
    this.id,
    required this.name,
    required this.location,
    this.isSync,
    required this.idIntervention,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['location'] = Variable<String>(location);
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    map['id_intervention'] = Variable<int>(idIntervention);
    return map;
  }

  DocumentDOCompanion toCompanion(bool nullToAbsent) {
    return DocumentDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      location: Value(location),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
      idIntervention: Value(idIntervention),
    );
  }

  factory DocumentDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String>(json['location']),
      isSync: serializer.fromJson<bool?>(json['isSync']),
      idIntervention: serializer.fromJson<int>(json['idIntervention']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String>(location),
      'isSync': serializer.toJson<bool?>(isSync),
      'idIntervention': serializer.toJson<int>(idIntervention),
    };
  }

  DocumentDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? name,
    String? location,
    Value<bool?> isSync = const Value.absent(),
    int? idIntervention,
  }) => DocumentDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    location: location ?? this.location,
    isSync: isSync.present ? isSync.value : this.isSync,
    idIntervention: idIntervention ?? this.idIntervention,
  );
  DocumentDOData copyWithCompanion(DocumentDOCompanion data) {
    return DocumentDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      idIntervention:
          data.idIntervention.present
              ? data.idIntervention.value
              : this.idIntervention,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, id, name, location, isSync, idIntervention);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.name == this.name &&
          other.location == this.location &&
          other.isSync == this.isSync &&
          other.idIntervention == this.idIntervention);
}

class DocumentDOCompanion extends UpdateCompanion<DocumentDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> name;
  final Value<String> location;
  final Value<bool?> isSync;
  final Value<int> idIntervention;
  const DocumentDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.isSync = const Value.absent(),
    this.idIntervention = const Value.absent(),
  });
  DocumentDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required String location,
    this.isSync = const Value.absent(),
    required int idIntervention,
  }) : name = Value(name),
       location = Value(location),
       idIntervention = Value(idIntervention);
  static Insertable<DocumentDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? location,
    Expression<bool>? isSync,
    Expression<int>? idIntervention,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (isSync != null) 'is_sync': isSync,
      if (idIntervention != null) 'id_intervention': idIntervention,
    });
  }

  DocumentDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? name,
    Value<String>? location,
    Value<bool?>? isSync,
    Value<int>? idIntervention,
  }) {
    return DocumentDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      isSync: isSync ?? this.isSync,
      idIntervention: idIntervention ?? this.idIntervention,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<int>(idIntervention.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }
}

class $CommentairePjDOTable extends CommentairePjDO
    with TableInfo<$CommentairePjDOTable, CommentairePjDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentairePjDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [localId, id, name, location];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'commentaire_pj_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommentairePjDOData> instance, {
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
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  CommentairePjDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentairePjDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      location:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}location'],
          )!,
    );
  }

  @override
  $CommentairePjDOTable createAlias(String alias) {
    return $CommentairePjDOTable(attachedDatabase, alias);
  }
}

class CommentairePjDOData extends DataClass
    implements Insertable<CommentairePjDOData> {
  final int localId;
  final int? id;
  final String name;
  final String location;
  const CommentairePjDOData({
    required this.localId,
    this.id,
    required this.name,
    required this.location,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['location'] = Variable<String>(location);
    return map;
  }

  CommentairePjDOCompanion toCompanion(bool nullToAbsent) {
    return CommentairePjDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      location: Value(location),
    );
  }

  factory CommentairePjDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentairePjDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String>(location),
    };
  }

  CommentairePjDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? name,
    String? location,
  }) => CommentairePjDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    location: location ?? this.location,
  );
  CommentairePjDOData copyWithCompanion(CommentairePjDOCompanion data) {
    return CommentairePjDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentairePjDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, name, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentairePjDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.name == this.name &&
          other.location == this.location);
}

class CommentairePjDOCompanion extends UpdateCompanion<CommentairePjDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> name;
  final Value<String> location;
  const CommentairePjDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
  });
  CommentairePjDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required String location,
  }) : name = Value(name),
       location = Value(location);
  static Insertable<CommentairePjDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
    });
  }

  CommentairePjDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? name,
    Value<String>? location,
  }) {
    return CommentairePjDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentairePjDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $CommentaireDOTable extends CommentaireDO
    with TableInfo<$CommentaireDOTable, CommentaireDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentaireDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
    'user',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<int> idIntervention = GeneratedColumn<int>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES intervention_d_o (local_id)',
    ),
  );
  static const VerificationMeta _pjMeta = const VerificationMeta('pj');
  @override
  late final GeneratedColumn<String> pj = GeneratedColumn<String>(
    'pj',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    true,
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
    user,
    comment,
    date,
    idIntervention,
    pj,
    isSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'commentaire_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommentaireDOData> instance, {
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
    if (data.containsKey('user')) {
      context.handle(
        _userMeta,
        user.isAcceptableOrUnknown(data['user']!, _userMeta),
      );
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    } else if (isInserting) {
      context.missing(_commentMeta);
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
    if (data.containsKey('pj')) {
      context.handle(_pjMeta, pj.isAcceptableOrUnknown(data['pj']!, _pjMeta));
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
  CommentaireDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentaireDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      user:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user'],
          )!,
      comment:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}comment'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      idIntervention:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_intervention'],
          )!,
      pj: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pj'],
      ),
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      ),
    );
  }

  @override
  $CommentaireDOTable createAlias(String alias) {
    return $CommentaireDOTable(attachedDatabase, alias);
  }
}

class CommentaireDOData extends DataClass
    implements Insertable<CommentaireDOData> {
  final int localId;
  final int? id;
  final String user;
  final String comment;
  final DateTime date;
  final int idIntervention;
  final String? pj;
  final bool? isSync;
  const CommentaireDOData({
    required this.localId,
    this.id,
    required this.user,
    required this.comment,
    required this.date,
    required this.idIntervention,
    this.pj,
    this.isSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['user'] = Variable<String>(user);
    map['comment'] = Variable<String>(comment);
    map['date'] = Variable<DateTime>(date);
    map['id_intervention'] = Variable<int>(idIntervention);
    if (!nullToAbsent || pj != null) {
      map['pj'] = Variable<String>(pj);
    }
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    return map;
  }

  CommentaireDOCompanion toCompanion(bool nullToAbsent) {
    return CommentaireDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      user: Value(user),
      comment: Value(comment),
      date: Value(date),
      idIntervention: Value(idIntervention),
      pj: pj == null && nullToAbsent ? const Value.absent() : Value(pj),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
    );
  }

  factory CommentaireDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentaireDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      user: serializer.fromJson<String>(json['user']),
      comment: serializer.fromJson<String>(json['comment']),
      date: serializer.fromJson<DateTime>(json['date']),
      idIntervention: serializer.fromJson<int>(json['idIntervention']),
      pj: serializer.fromJson<String?>(json['pj']),
      isSync: serializer.fromJson<bool?>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'user': serializer.toJson<String>(user),
      'comment': serializer.toJson<String>(comment),
      'date': serializer.toJson<DateTime>(date),
      'idIntervention': serializer.toJson<int>(idIntervention),
      'pj': serializer.toJson<String?>(pj),
      'isSync': serializer.toJson<bool?>(isSync),
    };
  }

  CommentaireDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? user,
    String? comment,
    DateTime? date,
    int? idIntervention,
    Value<String?> pj = const Value.absent(),
    Value<bool?> isSync = const Value.absent(),
  }) => CommentaireDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    user: user ?? this.user,
    comment: comment ?? this.comment,
    date: date ?? this.date,
    idIntervention: idIntervention ?? this.idIntervention,
    pj: pj.present ? pj.value : this.pj,
    isSync: isSync.present ? isSync.value : this.isSync,
  );
  CommentaireDOData copyWithCompanion(CommentaireDOCompanion data) {
    return CommentaireDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      user: data.user.present ? data.user.value : this.user,
      comment: data.comment.present ? data.comment.value : this.comment,
      date: data.date.present ? data.date.value : this.date,
      idIntervention:
          data.idIntervention.present
              ? data.idIntervention.value
              : this.idIntervention,
      pj: data.pj.present ? data.pj.value : this.pj,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentaireDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('user: $user, ')
          ..write('comment: $comment, ')
          ..write('date: $date, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('pj: $pj, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, id, user, comment, date, idIntervention, pj, isSync);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentaireDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.user == this.user &&
          other.comment == this.comment &&
          other.date == this.date &&
          other.idIntervention == this.idIntervention &&
          other.pj == this.pj &&
          other.isSync == this.isSync);
}

class CommentaireDOCompanion extends UpdateCompanion<CommentaireDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> user;
  final Value<String> comment;
  final Value<DateTime> date;
  final Value<int> idIntervention;
  final Value<String?> pj;
  final Value<bool?> isSync;
  const CommentaireDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.user = const Value.absent(),
    this.comment = const Value.absent(),
    this.date = const Value.absent(),
    this.idIntervention = const Value.absent(),
    this.pj = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  CommentaireDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String user,
    required String comment,
    required DateTime date,
    required int idIntervention,
    this.pj = const Value.absent(),
    this.isSync = const Value.absent(),
  }) : user = Value(user),
       comment = Value(comment),
       date = Value(date),
       idIntervention = Value(idIntervention);
  static Insertable<CommentaireDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? user,
    Expression<String>? comment,
    Expression<DateTime>? date,
    Expression<int>? idIntervention,
    Expression<String>? pj,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (user != null) 'user': user,
      if (comment != null) 'comment': comment,
      if (date != null) 'date': date,
      if (idIntervention != null) 'id_intervention': idIntervention,
      if (pj != null) 'pj': pj,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  CommentaireDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? user,
    Value<String>? comment,
    Value<DateTime>? date,
    Value<int>? idIntervention,
    Value<String?>? pj,
    Value<bool?>? isSync,
  }) {
    return CommentaireDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      user: user ?? this.user,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      idIntervention: idIntervention ?? this.idIntervention,
      pj: pj ?? this.pj,
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
      map['id'] = Variable<int>(id.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<int>(idIntervention.value);
    }
    if (pj.present) {
      map['pj'] = Variable<String>(pj.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentaireDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('user: $user, ')
          ..write('comment: $comment, ')
          ..write('date: $date, ')
          ..write('idIntervention: $idIntervention, ')
          ..write('pj: $pj, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $MaterialDOTable extends MaterialDO
    with TableInfo<$MaterialDOTable, MaterialDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
    'is_sync',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<int> idIntervention = GeneratedColumn<int>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES intervention_d_o (local_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    id,
    name,
    quantity,
    isSync,
    idIntervention,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaterialDOData> instance, {
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
    if (data.containsKey('is_sync')) {
      context.handle(
        _isSyncMeta,
        isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  MaterialDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      quantity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}quantity'],
          )!,
      isSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sync'],
      ),
      idIntervention:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_intervention'],
          )!,
    );
  }

  @override
  $MaterialDOTable createAlias(String alias) {
    return $MaterialDOTable(attachedDatabase, alias);
  }
}

class MaterialDOData extends DataClass implements Insertable<MaterialDOData> {
  final int localId;
  final int? id;
  final String name;
  final double quantity;
  final bool? isSync;
  final int idIntervention;
  const MaterialDOData({
    required this.localId,
    this.id,
    required this.name,
    required this.quantity,
    this.isSync,
    required this.idIntervention,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    map['id_intervention'] = Variable<int>(idIntervention);
    return map;
  }

  MaterialDOCompanion toCompanion(bool nullToAbsent) {
    return MaterialDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      quantity: Value(quantity),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
      idIntervention: Value(idIntervention),
    );
  }

  factory MaterialDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<double>(json['quantity']),
      isSync: serializer.fromJson<bool?>(json['isSync']),
      idIntervention: serializer.fromJson<int>(json['idIntervention']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<double>(quantity),
      'isSync': serializer.toJson<bool?>(isSync),
      'idIntervention': serializer.toJson<int>(idIntervention),
    };
  }

  MaterialDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? name,
    double? quantity,
    Value<bool?> isSync = const Value.absent(),
    int? idIntervention,
  }) => MaterialDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    isSync: isSync.present ? isSync.value : this.isSync,
    idIntervention: idIntervention ?? this.idIntervention,
  );
  MaterialDOData copyWithCompanion(MaterialDOCompanion data) {
    return MaterialDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      isSync: data.isSync.present ? data.isSync.value : this.isSync,
      idIntervention:
          data.idIntervention.present
              ? data.idIntervention.value
              : this.idIntervention,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, id, name, quantity, isSync, idIntervention);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.isSync == this.isSync &&
          other.idIntervention == this.idIntervention);
}

class MaterialDOCompanion extends UpdateCompanion<MaterialDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> name;
  final Value<double> quantity;
  final Value<bool?> isSync;
  final Value<int> idIntervention;
  const MaterialDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.isSync = const Value.absent(),
    this.idIntervention = const Value.absent(),
  });
  MaterialDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required double quantity,
    this.isSync = const Value.absent(),
    required int idIntervention,
  }) : name = Value(name),
       quantity = Value(quantity),
       idIntervention = Value(idIntervention);
  static Insertable<MaterialDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? quantity,
    Expression<bool>? isSync,
    Expression<int>? idIntervention,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (isSync != null) 'is_sync': isSync,
      if (idIntervention != null) 'id_intervention': idIntervention,
    });
  }

  MaterialDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? name,
    Value<double>? quantity,
    Value<bool?>? isSync,
    Value<int>? idIntervention,
  }) {
    return MaterialDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      isSync: isSync ?? this.isSync,
      idIntervention: idIntervention ?? this.idIntervention,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<int>(idIntervention.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('isSync: $isSync, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }
}

class $MaterialAvailableDOTable extends MaterialAvailableDO
    with TableInfo<$MaterialAvailableDOTable, MaterialAvailableDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialAvailableDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [localId, id, name, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_available_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaterialAvailableDOData> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  MaterialAvailableDOData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialAvailableDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      quantity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}quantity'],
          )!,
    );
  }

  @override
  $MaterialAvailableDOTable createAlias(String alias) {
    return $MaterialAvailableDOTable(attachedDatabase, alias);
  }
}

class MaterialAvailableDOData extends DataClass
    implements Insertable<MaterialAvailableDOData> {
  final int localId;
  final int? id;
  final String name;
  final double quantity;
  const MaterialAvailableDOData({
    required this.localId,
    this.id,
    required this.name,
    required this.quantity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<double>(quantity);
    return map;
  }

  MaterialAvailableDOCompanion toCompanion(bool nullToAbsent) {
    return MaterialAvailableDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      quantity: Value(quantity),
    );
  }

  factory MaterialAvailableDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialAvailableDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<double>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<double>(quantity),
    };
  }

  MaterialAvailableDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? name,
    double? quantity,
  }) => MaterialAvailableDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
  );
  MaterialAvailableDOData copyWithCompanion(MaterialAvailableDOCompanion data) {
    return MaterialAvailableDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialAvailableDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, name, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialAvailableDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity);
}

class MaterialAvailableDOCompanion
    extends UpdateCompanion<MaterialAvailableDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> name;
  final Value<double> quantity;
  const MaterialAvailableDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  MaterialAvailableDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required double quantity,
  }) : name = Value(name),
       quantity = Value(quantity);
  static Insertable<MaterialAvailableDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? quantity,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
    });
  }

  MaterialAvailableDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? name,
    Value<double>? quantity,
  }) {
    return MaterialAvailableDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialAvailableDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $MaterialRequiredDOTable extends MaterialRequiredDO
    with TableInfo<$MaterialRequiredDOTable, MaterialRequiredDOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialRequiredDOTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _idInterventionMeta = const VerificationMeta(
    'idIntervention',
  );
  @override
  late final GeneratedColumn<int> idIntervention = GeneratedColumn<int>(
    'id_intervention',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES intervention_d_o (local_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [localId, id, name, idIntervention];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_required_d_o';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaterialRequiredDOData> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  MaterialRequiredDOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialRequiredDOData(
      localId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}local_id'],
          )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      idIntervention:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_intervention'],
          )!,
    );
  }

  @override
  $MaterialRequiredDOTable createAlias(String alias) {
    return $MaterialRequiredDOTable(attachedDatabase, alias);
  }
}

class MaterialRequiredDOData extends DataClass
    implements Insertable<MaterialRequiredDOData> {
  final int localId;
  final int? id;
  final String name;
  final int idIntervention;
  const MaterialRequiredDOData({
    required this.localId,
    this.id,
    required this.name,
    required this.idIntervention,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['id_intervention'] = Variable<int>(idIntervention);
    return map;
  }

  MaterialRequiredDOCompanion toCompanion(bool nullToAbsent) {
    return MaterialRequiredDOCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      idIntervention: Value(idIntervention),
    );
  }

  factory MaterialRequiredDOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialRequiredDOData(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      idIntervention: serializer.fromJson<int>(json['idIntervention']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'idIntervention': serializer.toJson<int>(idIntervention),
    };
  }

  MaterialRequiredDOData copyWith({
    int? localId,
    Value<int?> id = const Value.absent(),
    String? name,
    int? idIntervention,
  }) => MaterialRequiredDOData(
    localId: localId ?? this.localId,
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    idIntervention: idIntervention ?? this.idIntervention,
  );
  MaterialRequiredDOData copyWithCompanion(MaterialRequiredDOCompanion data) {
    return MaterialRequiredDOData(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      idIntervention:
          data.idIntervention.present
              ? data.idIntervention.value
              : this.idIntervention,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialRequiredDOData(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, name, idIntervention);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialRequiredDOData &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.name == this.name &&
          other.idIntervention == this.idIntervention);
}

class MaterialRequiredDOCompanion
    extends UpdateCompanion<MaterialRequiredDOData> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> name;
  final Value<int> idIntervention;
  const MaterialRequiredDOCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.idIntervention = const Value.absent(),
  });
  MaterialRequiredDOCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required int idIntervention,
  }) : name = Value(name),
       idIntervention = Value(idIntervention);
  static Insertable<MaterialRequiredDOData> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? idIntervention,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (idIntervention != null) 'id_intervention': idIntervention,
    });
  }

  MaterialRequiredDOCompanion copyWith({
    Value<int>? localId,
    Value<int?>? id,
    Value<String>? name,
    Value<int>? idIntervention,
  }) {
    return MaterialRequiredDOCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      idIntervention: idIntervention ?? this.idIntervention,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (idIntervention.present) {
      map['id_intervention'] = Variable<int>(idIntervention.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialRequiredDOCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('idIntervention: $idIntervention')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserDOTable userDO = $UserDOTable(this);
  late final $InterventionDOTable interventionDO = $InterventionDOTable(this);
  late final $PhotoDOTable photoDO = $PhotoDOTable(this);
  late final $TempsInterventionDOTable tempsInterventionDO =
      $TempsInterventionDOTable(this);
  late final $DocumentDOTable documentDO = $DocumentDOTable(this);
  late final $CommentairePjDOTable commentairePjDO = $CommentairePjDOTable(
    this,
  );
  late final $CommentaireDOTable commentaireDO = $CommentaireDOTable(this);
  late final $MaterialDOTable materialDO = $MaterialDOTable(this);
  late final $MaterialAvailableDOTable materialAvailableDO =
      $MaterialAvailableDOTable(this);
  late final $MaterialRequiredDOTable materialRequiredDO =
      $MaterialRequiredDOTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userDO,
    interventionDO,
    photoDO,
    tempsInterventionDO,
    documentDO,
    commentairePjDO,
    commentaireDO,
    materialDO,
    materialAvailableDO,
    materialRequiredDO,
  ];
}

typedef $$UserDOTableCreateCompanionBuilder =
    UserDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String email,
      required String password,
      required String name,
      required String token,
    });
typedef $$UserDOTableUpdateCompanionBuilder =
    UserDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> email,
      Value<String> password,
      Value<String> name,
      Value<String> token,
    });

class $$UserDOTableFilterComposer
    extends Composer<_$AppDatabase, $UserDOTable> {
  $$UserDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserDOTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDOTable> {
  $$UserDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDOTable> {
  $$UserDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);
}

class $$UserDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserDOTable,
          UserDOData,
          $$UserDOTableFilterComposer,
          $$UserDOTableOrderingComposer,
          $$UserDOTableAnnotationComposer,
          $$UserDOTableCreateCompanionBuilder,
          $$UserDOTableUpdateCompanionBuilder,
          (UserDOData, BaseReferences<_$AppDatabase, $UserDOTable, UserDOData>),
          UserDOData,
          PrefetchHooks Function()
        > {
  $$UserDOTableTableManager(_$AppDatabase db, $UserDOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UserDOTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UserDOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UserDOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> token = const Value.absent(),
              }) => UserDOCompanion(
                localId: localId,
                id: id,
                email: email,
                password: password,
                name: name,
                token: token,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String email,
                required String password,
                required String name,
                required String token,
              }) => UserDOCompanion.insert(
                localId: localId,
                id: id,
                email: email,
                password: password,
                name: name,
                token: token,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserDOTable,
      UserDOData,
      $$UserDOTableFilterComposer,
      $$UserDOTableOrderingComposer,
      $$UserDOTableAnnotationComposer,
      $$UserDOTableCreateCompanionBuilder,
      $$UserDOTableUpdateCompanionBuilder,
      (UserDOData, BaseReferences<_$AppDatabase, $UserDOTable, UserDOData>),
      UserDOData,
      PrefetchHooks Function()
    >;
typedef $$InterventionDOTableCreateCompanionBuilder =
    InterventionDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String title,
      Value<String?> dateStart,
      Value<String?> dateEnd,
      required int status,
      required String priority,
      required String description,
      required String customer,
      required double long,
      required double lat,
      required String address,
      Value<String?> telephone,
      required double distance,
      Value<String?> signature,
      Value<bool?> isSync,
      Value<TimerStatus?> timerStatus,
      Value<int?> elapsedSeconds,
    });
typedef $$InterventionDOTableUpdateCompanionBuilder =
    InterventionDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> title,
      Value<String?> dateStart,
      Value<String?> dateEnd,
      Value<int> status,
      Value<String> priority,
      Value<String> description,
      Value<String> customer,
      Value<double> long,
      Value<double> lat,
      Value<String> address,
      Value<String?> telephone,
      Value<double> distance,
      Value<String?> signature,
      Value<bool?> isSync,
      Value<TimerStatus?> timerStatus,
      Value<int?> elapsedSeconds,
    });

final class $$InterventionDOTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InterventionDOTable,
          InterventionDOData
        > {
  $$InterventionDOTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PhotoDOTable, List<PhotoDOData>>
  _photoDORefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.photoDO,
    aliasName: $_aliasNameGenerator(
      db.interventionDO.localId,
      db.photoDO.idIntervention,
    ),
  );

  $$PhotoDOTableProcessedTableManager get photoDORefs {
    final manager = $$PhotoDOTableTableManager($_db, $_db.photoDO).filter(
      (f) => f.idIntervention.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_photoDORefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TempsInterventionDOTable,
    List<TempsInterventionDOData>
  >
  _tempsInterventionDORefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.tempsInterventionDO,
        aliasName: $_aliasNameGenerator(
          db.interventionDO.localId,
          db.tempsInterventionDO.idIntervention,
        ),
      );

  $$TempsInterventionDOTableProcessedTableManager get tempsInterventionDORefs {
    final manager = $$TempsInterventionDOTableTableManager(
      $_db,
      $_db.tempsInterventionDO,
    ).filter(
      (f) => f.idIntervention.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _tempsInterventionDORefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DocumentDOTable, List<DocumentDOData>>
  _documentDORefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.documentDO,
    aliasName: $_aliasNameGenerator(
      db.interventionDO.localId,
      db.documentDO.idIntervention,
    ),
  );

  $$DocumentDOTableProcessedTableManager get documentDORefs {
    final manager = $$DocumentDOTableTableManager($_db, $_db.documentDO).filter(
      (f) => f.idIntervention.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_documentDORefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CommentaireDOTable, List<CommentaireDOData>>
  _commentaireDORefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.commentaireDO,
    aliasName: $_aliasNameGenerator(
      db.interventionDO.localId,
      db.commentaireDO.idIntervention,
    ),
  );

  $$CommentaireDOTableProcessedTableManager get commentaireDORefs {
    final manager = $$CommentaireDOTableTableManager(
      $_db,
      $_db.commentaireDO,
    ).filter(
      (f) => f.idIntervention.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_commentaireDORefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MaterialDOTable, List<MaterialDOData>>
  _materialDORefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.materialDO,
    aliasName: $_aliasNameGenerator(
      db.interventionDO.localId,
      db.materialDO.idIntervention,
    ),
  );

  $$MaterialDOTableProcessedTableManager get materialDORefs {
    final manager = $$MaterialDOTableTableManager($_db, $_db.materialDO).filter(
      (f) => f.idIntervention.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_materialDORefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MaterialRequiredDOTable,
    List<MaterialRequiredDOData>
  >
  _materialRequiredDORefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.materialRequiredDO,
        aliasName: $_aliasNameGenerator(
          db.interventionDO.localId,
          db.materialRequiredDO.idIntervention,
        ),
      );

  $$MaterialRequiredDOTableProcessedTableManager get materialRequiredDORefs {
    final manager = $$MaterialRequiredDOTableTableManager(
      $_db,
      $_db.materialRequiredDO,
    ).filter(
      (f) => f.idIntervention.localId.sqlEquals($_itemColumn<int>('local_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _materialRequiredDORefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InterventionDOTableFilterComposer
    extends Composer<_$AppDatabase, $InterventionDOTable> {
  $$InterventionDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
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

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telephone => $composableBuilder(
    column: $table.telephone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TimerStatus?, TimerStatus, int>
  get timerStatus => $composableBuilder(
    column: $table.timerStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get elapsedSeconds => $composableBuilder(
    column: $table.elapsedSeconds,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> photoDORefs(
    Expression<bool> Function($$PhotoDOTableFilterComposer f) f,
  ) {
    final $$PhotoDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.photoDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoDOTableFilterComposer(
            $db: $db,
            $table: $db.photoDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tempsInterventionDORefs(
    Expression<bool> Function($$TempsInterventionDOTableFilterComposer f) f,
  ) {
    final $$TempsInterventionDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.tempsInterventionDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TempsInterventionDOTableFilterComposer(
            $db: $db,
            $table: $db.tempsInterventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> documentDORefs(
    Expression<bool> Function($$DocumentDOTableFilterComposer f) f,
  ) {
    final $$DocumentDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.documentDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentDOTableFilterComposer(
            $db: $db,
            $table: $db.documentDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> commentaireDORefs(
    Expression<bool> Function($$CommentaireDOTableFilterComposer f) f,
  ) {
    final $$CommentaireDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.commentaireDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentaireDOTableFilterComposer(
            $db: $db,
            $table: $db.commentaireDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> materialDORefs(
    Expression<bool> Function($$MaterialDOTableFilterComposer f) f,
  ) {
    final $$MaterialDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.materialDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaterialDOTableFilterComposer(
            $db: $db,
            $table: $db.materialDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> materialRequiredDORefs(
    Expression<bool> Function($$MaterialRequiredDOTableFilterComposer f) f,
  ) {
    final $$MaterialRequiredDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.materialRequiredDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaterialRequiredDOTableFilterComposer(
            $db: $db,
            $table: $db.materialRequiredDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InterventionDOTableOrderingComposer
    extends Composer<_$AppDatabase, $InterventionDOTable> {
  $$InterventionDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
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

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telephone => $composableBuilder(
    column: $table.telephone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timerStatus => $composableBuilder(
    column: $table.timerStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get elapsedSeconds => $composableBuilder(
    column: $table.elapsedSeconds,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InterventionDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $InterventionDOTable> {
  $$InterventionDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get dateStart =>
      $composableBuilder(column: $table.dateStart, builder: (column) => column);

  GeneratedColumn<String> get dateEnd =>
      $composableBuilder(column: $table.dateEnd, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customer =>
      $composableBuilder(column: $table.customer, builder: (column) => column);

  GeneratedColumn<double> get long =>
      $composableBuilder(column: $table.long, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get telephone =>
      $composableBuilder(column: $table.telephone, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<String> get signature =>
      $composableBuilder(column: $table.signature, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TimerStatus?, int> get timerStatus =>
      $composableBuilder(
        column: $table.timerStatus,
        builder: (column) => column,
      );

  GeneratedColumn<int> get elapsedSeconds => $composableBuilder(
    column: $table.elapsedSeconds,
    builder: (column) => column,
  );

  Expression<T> photoDORefs<T extends Object>(
    Expression<T> Function($$PhotoDOTableAnnotationComposer a) f,
  ) {
    final $$PhotoDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.photoDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotoDOTableAnnotationComposer(
            $db: $db,
            $table: $db.photoDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tempsInterventionDORefs<T extends Object>(
    Expression<T> Function($$TempsInterventionDOTableAnnotationComposer a) f,
  ) {
    final $$TempsInterventionDOTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.tempsInterventionDO,
          getReferencedColumn: (t) => t.idIntervention,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TempsInterventionDOTableAnnotationComposer(
                $db: $db,
                $table: $db.tempsInterventionDO,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> documentDORefs<T extends Object>(
    Expression<T> Function($$DocumentDOTableAnnotationComposer a) f,
  ) {
    final $$DocumentDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.documentDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentDOTableAnnotationComposer(
            $db: $db,
            $table: $db.documentDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> commentaireDORefs<T extends Object>(
    Expression<T> Function($$CommentaireDOTableAnnotationComposer a) f,
  ) {
    final $$CommentaireDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.commentaireDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentaireDOTableAnnotationComposer(
            $db: $db,
            $table: $db.commentaireDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> materialDORefs<T extends Object>(
    Expression<T> Function($$MaterialDOTableAnnotationComposer a) f,
  ) {
    final $$MaterialDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localId,
      referencedTable: $db.materialDO,
      getReferencedColumn: (t) => t.idIntervention,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaterialDOTableAnnotationComposer(
            $db: $db,
            $table: $db.materialDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> materialRequiredDORefs<T extends Object>(
    Expression<T> Function($$MaterialRequiredDOTableAnnotationComposer a) f,
  ) {
    final $$MaterialRequiredDOTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localId,
          referencedTable: $db.materialRequiredDO,
          getReferencedColumn: (t) => t.idIntervention,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MaterialRequiredDOTableAnnotationComposer(
                $db: $db,
                $table: $db.materialRequiredDO,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$InterventionDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InterventionDOTable,
          InterventionDOData,
          $$InterventionDOTableFilterComposer,
          $$InterventionDOTableOrderingComposer,
          $$InterventionDOTableAnnotationComposer,
          $$InterventionDOTableCreateCompanionBuilder,
          $$InterventionDOTableUpdateCompanionBuilder,
          (InterventionDOData, $$InterventionDOTableReferences),
          InterventionDOData,
          PrefetchHooks Function({
            bool photoDORefs,
            bool tempsInterventionDORefs,
            bool documentDORefs,
            bool commentaireDORefs,
            bool materialDORefs,
            bool materialRequiredDORefs,
          })
        > {
  $$InterventionDOTableTableManager(
    _$AppDatabase db,
    $InterventionDOTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$InterventionDOTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$InterventionDOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$InterventionDOTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> dateStart = const Value.absent(),
                Value<String?> dateEnd = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> customer = const Value.absent(),
                Value<double> long = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String?> telephone = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<String?> signature = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
                Value<TimerStatus?> timerStatus = const Value.absent(),
                Value<int?> elapsedSeconds = const Value.absent(),
              }) => InterventionDOCompanion(
                localId: localId,
                id: id,
                title: title,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                priority: priority,
                description: description,
                customer: customer,
                long: long,
                lat: lat,
                address: address,
                telephone: telephone,
                distance: distance,
                signature: signature,
                isSync: isSync,
                timerStatus: timerStatus,
                elapsedSeconds: elapsedSeconds,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String title,
                Value<String?> dateStart = const Value.absent(),
                Value<String?> dateEnd = const Value.absent(),
                required int status,
                required String priority,
                required String description,
                required String customer,
                required double long,
                required double lat,
                required String address,
                Value<String?> telephone = const Value.absent(),
                required double distance,
                Value<String?> signature = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
                Value<TimerStatus?> timerStatus = const Value.absent(),
                Value<int?> elapsedSeconds = const Value.absent(),
              }) => InterventionDOCompanion.insert(
                localId: localId,
                id: id,
                title: title,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                priority: priority,
                description: description,
                customer: customer,
                long: long,
                lat: lat,
                address: address,
                telephone: telephone,
                distance: distance,
                signature: signature,
                isSync: isSync,
                timerStatus: timerStatus,
                elapsedSeconds: elapsedSeconds,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$InterventionDOTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            photoDORefs = false,
            tempsInterventionDORefs = false,
            documentDORefs = false,
            commentaireDORefs = false,
            materialDORefs = false,
            materialRequiredDORefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (photoDORefs) db.photoDO,
                if (tempsInterventionDORefs) db.tempsInterventionDO,
                if (documentDORefs) db.documentDO,
                if (commentaireDORefs) db.commentaireDO,
                if (materialDORefs) db.materialDO,
                if (materialRequiredDORefs) db.materialRequiredDO,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (photoDORefs)
                    await $_getPrefetchedData<
                      InterventionDOData,
                      $InterventionDOTable,
                      PhotoDOData
                    >(
                      currentTable: table,
                      referencedTable: $$InterventionDOTableReferences
                          ._photoDORefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InterventionDOTableReferences(
                                db,
                                table,
                                p0,
                              ).photoDORefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idIntervention == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (tempsInterventionDORefs)
                    await $_getPrefetchedData<
                      InterventionDOData,
                      $InterventionDOTable,
                      TempsInterventionDOData
                    >(
                      currentTable: table,
                      referencedTable: $$InterventionDOTableReferences
                          ._tempsInterventionDORefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InterventionDOTableReferences(
                                db,
                                table,
                                p0,
                              ).tempsInterventionDORefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idIntervention == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (documentDORefs)
                    await $_getPrefetchedData<
                      InterventionDOData,
                      $InterventionDOTable,
                      DocumentDOData
                    >(
                      currentTable: table,
                      referencedTable: $$InterventionDOTableReferences
                          ._documentDORefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InterventionDOTableReferences(
                                db,
                                table,
                                p0,
                              ).documentDORefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idIntervention == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (commentaireDORefs)
                    await $_getPrefetchedData<
                      InterventionDOData,
                      $InterventionDOTable,
                      CommentaireDOData
                    >(
                      currentTable: table,
                      referencedTable: $$InterventionDOTableReferences
                          ._commentaireDORefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InterventionDOTableReferences(
                                db,
                                table,
                                p0,
                              ).commentaireDORefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idIntervention == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (materialDORefs)
                    await $_getPrefetchedData<
                      InterventionDOData,
                      $InterventionDOTable,
                      MaterialDOData
                    >(
                      currentTable: table,
                      referencedTable: $$InterventionDOTableReferences
                          ._materialDORefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InterventionDOTableReferences(
                                db,
                                table,
                                p0,
                              ).materialDORefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idIntervention == item.localId,
                          ),
                      typedResults: items,
                    ),
                  if (materialRequiredDORefs)
                    await $_getPrefetchedData<
                      InterventionDOData,
                      $InterventionDOTable,
                      MaterialRequiredDOData
                    >(
                      currentTable: table,
                      referencedTable: $$InterventionDOTableReferences
                          ._materialRequiredDORefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InterventionDOTableReferences(
                                db,
                                table,
                                p0,
                              ).materialRequiredDORefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idIntervention == item.localId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InterventionDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InterventionDOTable,
      InterventionDOData,
      $$InterventionDOTableFilterComposer,
      $$InterventionDOTableOrderingComposer,
      $$InterventionDOTableAnnotationComposer,
      $$InterventionDOTableCreateCompanionBuilder,
      $$InterventionDOTableUpdateCompanionBuilder,
      (InterventionDOData, $$InterventionDOTableReferences),
      InterventionDOData,
      PrefetchHooks Function({
        bool photoDORefs,
        bool tempsInterventionDORefs,
        bool documentDORefs,
        bool commentaireDORefs,
        bool materialDORefs,
        bool materialRequiredDORefs,
      })
    >;
typedef $$PhotoDOTableCreateCompanionBuilder =
    PhotoDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String name,
      required String location,
      Value<bool?> isSync,
      required int idIntervention,
    });
typedef $$PhotoDOTableUpdateCompanionBuilder =
    PhotoDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> name,
      Value<String> location,
      Value<bool?> isSync,
      Value<int> idIntervention,
    });

final class $$PhotoDOTableReferences
    extends BaseReferences<_$AppDatabase, $PhotoDOTable, PhotoDOData> {
  $$PhotoDOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InterventionDOTable _idInterventionTable(_$AppDatabase db) =>
      db.interventionDO.createAlias(
        $_aliasNameGenerator(
          db.photoDO.idIntervention,
          db.interventionDO.localId,
        ),
      );

  $$InterventionDOTableProcessedTableManager get idIntervention {
    final $_column = $_itemColumn<int>('id_intervention')!;

    final manager = $$InterventionDOTableTableManager(
      $_db,
      $_db.interventionDO,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idInterventionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PhotoDOTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoDOTable> {
  $$PhotoDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionDOTableFilterComposer get idIntervention {
    final $$InterventionDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableFilterComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotoDOTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoDOTable> {
  $$PhotoDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionDOTableOrderingComposer get idIntervention {
    final $$InterventionDOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableOrderingComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotoDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoDOTable> {
  $$PhotoDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  $$InterventionDOTableAnnotationComposer get idIntervention {
    final $$InterventionDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableAnnotationComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotoDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotoDOTable,
          PhotoDOData,
          $$PhotoDOTableFilterComposer,
          $$PhotoDOTableOrderingComposer,
          $$PhotoDOTableAnnotationComposer,
          $$PhotoDOTableCreateCompanionBuilder,
          $$PhotoDOTableUpdateCompanionBuilder,
          (PhotoDOData, $$PhotoDOTableReferences),
          PhotoDOData,
          PrefetchHooks Function({bool idIntervention})
        > {
  $$PhotoDOTableTableManager(_$AppDatabase db, $PhotoDOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PhotoDOTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PhotoDOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PhotoDOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
                Value<int> idIntervention = const Value.absent(),
              }) => PhotoDOCompanion(
                localId: localId,
                id: id,
                name: name,
                location: location,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String name,
                required String location,
                Value<bool?> isSync = const Value.absent(),
                required int idIntervention,
              }) => PhotoDOCompanion.insert(
                localId: localId,
                id: id,
                name: name,
                location: location,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PhotoDOTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idIntervention = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idIntervention) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idIntervention,
                            referencedTable: $$PhotoDOTableReferences
                                ._idInterventionTable(db),
                            referencedColumn:
                                $$PhotoDOTableReferences
                                    ._idInterventionTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PhotoDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotoDOTable,
      PhotoDOData,
      $$PhotoDOTableFilterComposer,
      $$PhotoDOTableOrderingComposer,
      $$PhotoDOTableAnnotationComposer,
      $$PhotoDOTableCreateCompanionBuilder,
      $$PhotoDOTableUpdateCompanionBuilder,
      (PhotoDOData, $$PhotoDOTableReferences),
      PhotoDOData,
      PrefetchHooks Function({bool idIntervention})
    >;
typedef $$TempsInterventionDOTableCreateCompanionBuilder =
    TempsInterventionDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String date,
      required String temps,
      required String description,
      Value<bool?> isSync,
      required int idIntervention,
    });
typedef $$TempsInterventionDOTableUpdateCompanionBuilder =
    TempsInterventionDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> date,
      Value<String> temps,
      Value<String> description,
      Value<bool?> isSync,
      Value<int> idIntervention,
    });

final class $$TempsInterventionDOTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TempsInterventionDOTable,
          TempsInterventionDOData
        > {
  $$TempsInterventionDOTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionDOTable _idInterventionTable(_$AppDatabase db) =>
      db.interventionDO.createAlias(
        $_aliasNameGenerator(
          db.tempsInterventionDO.idIntervention,
          db.interventionDO.localId,
        ),
      );

  $$InterventionDOTableProcessedTableManager get idIntervention {
    final $_column = $_itemColumn<int>('id_intervention')!;

    final manager = $$InterventionDOTableTableManager(
      $_db,
      $_db.interventionDO,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idInterventionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TempsInterventionDOTableFilterComposer
    extends Composer<_$AppDatabase, $TempsInterventionDOTable> {
  $$TempsInterventionDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get temps => $composableBuilder(
    column: $table.temps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionDOTableFilterComposer get idIntervention {
    final $$InterventionDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableFilterComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TempsInterventionDOTableOrderingComposer
    extends Composer<_$AppDatabase, $TempsInterventionDOTable> {
  $$TempsInterventionDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get temps => $composableBuilder(
    column: $table.temps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionDOTableOrderingComposer get idIntervention {
    final $$InterventionDOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableOrderingComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TempsInterventionDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $TempsInterventionDOTable> {
  $$TempsInterventionDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get temps =>
      $composableBuilder(column: $table.temps, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  $$InterventionDOTableAnnotationComposer get idIntervention {
    final $$InterventionDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableAnnotationComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TempsInterventionDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TempsInterventionDOTable,
          TempsInterventionDOData,
          $$TempsInterventionDOTableFilterComposer,
          $$TempsInterventionDOTableOrderingComposer,
          $$TempsInterventionDOTableAnnotationComposer,
          $$TempsInterventionDOTableCreateCompanionBuilder,
          $$TempsInterventionDOTableUpdateCompanionBuilder,
          (TempsInterventionDOData, $$TempsInterventionDOTableReferences),
          TempsInterventionDOData,
          PrefetchHooks Function({bool idIntervention})
        > {
  $$TempsInterventionDOTableTableManager(
    _$AppDatabase db,
    $TempsInterventionDOTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TempsInterventionDOTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$TempsInterventionDOTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$TempsInterventionDOTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> temps = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
                Value<int> idIntervention = const Value.absent(),
              }) => TempsInterventionDOCompanion(
                localId: localId,
                id: id,
                date: date,
                temps: temps,
                description: description,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String date,
                required String temps,
                required String description,
                Value<bool?> isSync = const Value.absent(),
                required int idIntervention,
              }) => TempsInterventionDOCompanion.insert(
                localId: localId,
                id: id,
                date: date,
                temps: temps,
                description: description,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TempsInterventionDOTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idIntervention = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idIntervention) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idIntervention,
                            referencedTable:
                                $$TempsInterventionDOTableReferences
                                    ._idInterventionTable(db),
                            referencedColumn:
                                $$TempsInterventionDOTableReferences
                                    ._idInterventionTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TempsInterventionDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TempsInterventionDOTable,
      TempsInterventionDOData,
      $$TempsInterventionDOTableFilterComposer,
      $$TempsInterventionDOTableOrderingComposer,
      $$TempsInterventionDOTableAnnotationComposer,
      $$TempsInterventionDOTableCreateCompanionBuilder,
      $$TempsInterventionDOTableUpdateCompanionBuilder,
      (TempsInterventionDOData, $$TempsInterventionDOTableReferences),
      TempsInterventionDOData,
      PrefetchHooks Function({bool idIntervention})
    >;
typedef $$DocumentDOTableCreateCompanionBuilder =
    DocumentDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String name,
      required String location,
      Value<bool?> isSync,
      required int idIntervention,
    });
typedef $$DocumentDOTableUpdateCompanionBuilder =
    DocumentDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> name,
      Value<String> location,
      Value<bool?> isSync,
      Value<int> idIntervention,
    });

final class $$DocumentDOTableReferences
    extends BaseReferences<_$AppDatabase, $DocumentDOTable, DocumentDOData> {
  $$DocumentDOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InterventionDOTable _idInterventionTable(_$AppDatabase db) =>
      db.interventionDO.createAlias(
        $_aliasNameGenerator(
          db.documentDO.idIntervention,
          db.interventionDO.localId,
        ),
      );

  $$InterventionDOTableProcessedTableManager get idIntervention {
    final $_column = $_itemColumn<int>('id_intervention')!;

    final manager = $$InterventionDOTableTableManager(
      $_db,
      $_db.interventionDO,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idInterventionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DocumentDOTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentDOTable> {
  $$DocumentDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionDOTableFilterComposer get idIntervention {
    final $$InterventionDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableFilterComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentDOTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentDOTable> {
  $$DocumentDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionDOTableOrderingComposer get idIntervention {
    final $$InterventionDOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableOrderingComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentDOTable> {
  $$DocumentDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  $$InterventionDOTableAnnotationComposer get idIntervention {
    final $$InterventionDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableAnnotationComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentDOTable,
          DocumentDOData,
          $$DocumentDOTableFilterComposer,
          $$DocumentDOTableOrderingComposer,
          $$DocumentDOTableAnnotationComposer,
          $$DocumentDOTableCreateCompanionBuilder,
          $$DocumentDOTableUpdateCompanionBuilder,
          (DocumentDOData, $$DocumentDOTableReferences),
          DocumentDOData,
          PrefetchHooks Function({bool idIntervention})
        > {
  $$DocumentDOTableTableManager(_$AppDatabase db, $DocumentDOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DocumentDOTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DocumentDOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DocumentDOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
                Value<int> idIntervention = const Value.absent(),
              }) => DocumentDOCompanion(
                localId: localId,
                id: id,
                name: name,
                location: location,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String name,
                required String location,
                Value<bool?> isSync = const Value.absent(),
                required int idIntervention,
              }) => DocumentDOCompanion.insert(
                localId: localId,
                id: id,
                name: name,
                location: location,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DocumentDOTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idIntervention = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idIntervention) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idIntervention,
                            referencedTable: $$DocumentDOTableReferences
                                ._idInterventionTable(db),
                            referencedColumn:
                                $$DocumentDOTableReferences
                                    ._idInterventionTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DocumentDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentDOTable,
      DocumentDOData,
      $$DocumentDOTableFilterComposer,
      $$DocumentDOTableOrderingComposer,
      $$DocumentDOTableAnnotationComposer,
      $$DocumentDOTableCreateCompanionBuilder,
      $$DocumentDOTableUpdateCompanionBuilder,
      (DocumentDOData, $$DocumentDOTableReferences),
      DocumentDOData,
      PrefetchHooks Function({bool idIntervention})
    >;
typedef $$CommentairePjDOTableCreateCompanionBuilder =
    CommentairePjDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String name,
      required String location,
    });
typedef $$CommentairePjDOTableUpdateCompanionBuilder =
    CommentairePjDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> name,
      Value<String> location,
    });

class $$CommentairePjDOTableFilterComposer
    extends Composer<_$AppDatabase, $CommentairePjDOTable> {
  $$CommentairePjDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommentairePjDOTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentairePjDOTable> {
  $$CommentairePjDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommentairePjDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentairePjDOTable> {
  $$CommentairePjDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);
}

class $$CommentairePjDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentairePjDOTable,
          CommentairePjDOData,
          $$CommentairePjDOTableFilterComposer,
          $$CommentairePjDOTableOrderingComposer,
          $$CommentairePjDOTableAnnotationComposer,
          $$CommentairePjDOTableCreateCompanionBuilder,
          $$CommentairePjDOTableUpdateCompanionBuilder,
          (
            CommentairePjDOData,
            BaseReferences<
              _$AppDatabase,
              $CommentairePjDOTable,
              CommentairePjDOData
            >,
          ),
          CommentairePjDOData,
          PrefetchHooks Function()
        > {
  $$CommentairePjDOTableTableManager(
    _$AppDatabase db,
    $CommentairePjDOTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CommentairePjDOTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CommentairePjDOTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CommentairePjDOTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> location = const Value.absent(),
              }) => CommentairePjDOCompanion(
                localId: localId,
                id: id,
                name: name,
                location: location,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String name,
                required String location,
              }) => CommentairePjDOCompanion.insert(
                localId: localId,
                id: id,
                name: name,
                location: location,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentairePjDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentairePjDOTable,
      CommentairePjDOData,
      $$CommentairePjDOTableFilterComposer,
      $$CommentairePjDOTableOrderingComposer,
      $$CommentairePjDOTableAnnotationComposer,
      $$CommentairePjDOTableCreateCompanionBuilder,
      $$CommentairePjDOTableUpdateCompanionBuilder,
      (
        CommentairePjDOData,
        BaseReferences<
          _$AppDatabase,
          $CommentairePjDOTable,
          CommentairePjDOData
        >,
      ),
      CommentairePjDOData,
      PrefetchHooks Function()
    >;
typedef $$CommentaireDOTableCreateCompanionBuilder =
    CommentaireDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String user,
      required String comment,
      required DateTime date,
      required int idIntervention,
      Value<String?> pj,
      Value<bool?> isSync,
    });
typedef $$CommentaireDOTableUpdateCompanionBuilder =
    CommentaireDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> user,
      Value<String> comment,
      Value<DateTime> date,
      Value<int> idIntervention,
      Value<String?> pj,
      Value<bool?> isSync,
    });

final class $$CommentaireDOTableReferences
    extends
        BaseReferences<_$AppDatabase, $CommentaireDOTable, CommentaireDOData> {
  $$CommentaireDOTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionDOTable _idInterventionTable(_$AppDatabase db) =>
      db.interventionDO.createAlias(
        $_aliasNameGenerator(
          db.commentaireDO.idIntervention,
          db.interventionDO.localId,
        ),
      );

  $$InterventionDOTableProcessedTableManager get idIntervention {
    final $_column = $_itemColumn<int>('id_intervention')!;

    final manager = $$InterventionDOTableTableManager(
      $_db,
      $_db.interventionDO,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idInterventionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CommentaireDOTableFilterComposer
    extends Composer<_$AppDatabase, $CommentaireDOTable> {
  $$CommentaireDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pj => $composableBuilder(
    column: $table.pj,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionDOTableFilterComposer get idIntervention {
    final $$InterventionDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableFilterComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentaireDOTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentaireDOTable> {
  $$CommentaireDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pj => $composableBuilder(
    column: $table.pj,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionDOTableOrderingComposer get idIntervention {
    final $$InterventionDOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableOrderingComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentaireDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentaireDOTable> {
  $$CommentaireDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user =>
      $composableBuilder(column: $table.user, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get pj =>
      $composableBuilder(column: $table.pj, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  $$InterventionDOTableAnnotationComposer get idIntervention {
    final $$InterventionDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableAnnotationComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentaireDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentaireDOTable,
          CommentaireDOData,
          $$CommentaireDOTableFilterComposer,
          $$CommentaireDOTableOrderingComposer,
          $$CommentaireDOTableAnnotationComposer,
          $$CommentaireDOTableCreateCompanionBuilder,
          $$CommentaireDOTableUpdateCompanionBuilder,
          (CommentaireDOData, $$CommentaireDOTableReferences),
          CommentaireDOData,
          PrefetchHooks Function({bool idIntervention})
        > {
  $$CommentaireDOTableTableManager(_$AppDatabase db, $CommentaireDOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CommentaireDOTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CommentaireDOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CommentaireDOTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> user = const Value.absent(),
                Value<String> comment = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> idIntervention = const Value.absent(),
                Value<String?> pj = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
              }) => CommentaireDOCompanion(
                localId: localId,
                id: id,
                user: user,
                comment: comment,
                date: date,
                idIntervention: idIntervention,
                pj: pj,
                isSync: isSync,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String user,
                required String comment,
                required DateTime date,
                required int idIntervention,
                Value<String?> pj = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
              }) => CommentaireDOCompanion.insert(
                localId: localId,
                id: id,
                user: user,
                comment: comment,
                date: date,
                idIntervention: idIntervention,
                pj: pj,
                isSync: isSync,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CommentaireDOTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idIntervention = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idIntervention) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idIntervention,
                            referencedTable: $$CommentaireDOTableReferences
                                ._idInterventionTable(db),
                            referencedColumn:
                                $$CommentaireDOTableReferences
                                    ._idInterventionTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CommentaireDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentaireDOTable,
      CommentaireDOData,
      $$CommentaireDOTableFilterComposer,
      $$CommentaireDOTableOrderingComposer,
      $$CommentaireDOTableAnnotationComposer,
      $$CommentaireDOTableCreateCompanionBuilder,
      $$CommentaireDOTableUpdateCompanionBuilder,
      (CommentaireDOData, $$CommentaireDOTableReferences),
      CommentaireDOData,
      PrefetchHooks Function({bool idIntervention})
    >;
typedef $$MaterialDOTableCreateCompanionBuilder =
    MaterialDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String name,
      required double quantity,
      Value<bool?> isSync,
      required int idIntervention,
    });
typedef $$MaterialDOTableUpdateCompanionBuilder =
    MaterialDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> name,
      Value<double> quantity,
      Value<bool?> isSync,
      Value<int> idIntervention,
    });

final class $$MaterialDOTableReferences
    extends BaseReferences<_$AppDatabase, $MaterialDOTable, MaterialDOData> {
  $$MaterialDOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InterventionDOTable _idInterventionTable(_$AppDatabase db) =>
      db.interventionDO.createAlias(
        $_aliasNameGenerator(
          db.materialDO.idIntervention,
          db.interventionDO.localId,
        ),
      );

  $$InterventionDOTableProcessedTableManager get idIntervention {
    final $_column = $_itemColumn<int>('id_intervention')!;

    final manager = $$InterventionDOTableTableManager(
      $_db,
      $_db.interventionDO,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idInterventionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MaterialDOTableFilterComposer
    extends Composer<_$AppDatabase, $MaterialDOTable> {
  $$MaterialDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionDOTableFilterComposer get idIntervention {
    final $$InterventionDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableFilterComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaterialDOTableOrderingComposer
    extends Composer<_$AppDatabase, $MaterialDOTable> {
  $$MaterialDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSync => $composableBuilder(
    column: $table.isSync,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionDOTableOrderingComposer get idIntervention {
    final $$InterventionDOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableOrderingComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaterialDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaterialDOTable> {
  $$MaterialDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<bool> get isSync =>
      $composableBuilder(column: $table.isSync, builder: (column) => column);

  $$InterventionDOTableAnnotationComposer get idIntervention {
    final $$InterventionDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableAnnotationComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaterialDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaterialDOTable,
          MaterialDOData,
          $$MaterialDOTableFilterComposer,
          $$MaterialDOTableOrderingComposer,
          $$MaterialDOTableAnnotationComposer,
          $$MaterialDOTableCreateCompanionBuilder,
          $$MaterialDOTableUpdateCompanionBuilder,
          (MaterialDOData, $$MaterialDOTableReferences),
          MaterialDOData,
          PrefetchHooks Function({bool idIntervention})
        > {
  $$MaterialDOTableTableManager(_$AppDatabase db, $MaterialDOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MaterialDOTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MaterialDOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$MaterialDOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<bool?> isSync = const Value.absent(),
                Value<int> idIntervention = const Value.absent(),
              }) => MaterialDOCompanion(
                localId: localId,
                id: id,
                name: name,
                quantity: quantity,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String name,
                required double quantity,
                Value<bool?> isSync = const Value.absent(),
                required int idIntervention,
              }) => MaterialDOCompanion.insert(
                localId: localId,
                id: id,
                name: name,
                quantity: quantity,
                isSync: isSync,
                idIntervention: idIntervention,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MaterialDOTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idIntervention = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idIntervention) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idIntervention,
                            referencedTable: $$MaterialDOTableReferences
                                ._idInterventionTable(db),
                            referencedColumn:
                                $$MaterialDOTableReferences
                                    ._idInterventionTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MaterialDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaterialDOTable,
      MaterialDOData,
      $$MaterialDOTableFilterComposer,
      $$MaterialDOTableOrderingComposer,
      $$MaterialDOTableAnnotationComposer,
      $$MaterialDOTableCreateCompanionBuilder,
      $$MaterialDOTableUpdateCompanionBuilder,
      (MaterialDOData, $$MaterialDOTableReferences),
      MaterialDOData,
      PrefetchHooks Function({bool idIntervention})
    >;
typedef $$MaterialAvailableDOTableCreateCompanionBuilder =
    MaterialAvailableDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String name,
      required double quantity,
    });
typedef $$MaterialAvailableDOTableUpdateCompanionBuilder =
    MaterialAvailableDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> name,
      Value<double> quantity,
    });

class $$MaterialAvailableDOTableFilterComposer
    extends Composer<_$AppDatabase, $MaterialAvailableDOTable> {
  $$MaterialAvailableDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MaterialAvailableDOTableOrderingComposer
    extends Composer<_$AppDatabase, $MaterialAvailableDOTable> {
  $$MaterialAvailableDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MaterialAvailableDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaterialAvailableDOTable> {
  $$MaterialAvailableDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);
}

class $$MaterialAvailableDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaterialAvailableDOTable,
          MaterialAvailableDOData,
          $$MaterialAvailableDOTableFilterComposer,
          $$MaterialAvailableDOTableOrderingComposer,
          $$MaterialAvailableDOTableAnnotationComposer,
          $$MaterialAvailableDOTableCreateCompanionBuilder,
          $$MaterialAvailableDOTableUpdateCompanionBuilder,
          (
            MaterialAvailableDOData,
            BaseReferences<
              _$AppDatabase,
              $MaterialAvailableDOTable,
              MaterialAvailableDOData
            >,
          ),
          MaterialAvailableDOData,
          PrefetchHooks Function()
        > {
  $$MaterialAvailableDOTableTableManager(
    _$AppDatabase db,
    $MaterialAvailableDOTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MaterialAvailableDOTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$MaterialAvailableDOTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$MaterialAvailableDOTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> quantity = const Value.absent(),
              }) => MaterialAvailableDOCompanion(
                localId: localId,
                id: id,
                name: name,
                quantity: quantity,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String name,
                required double quantity,
              }) => MaterialAvailableDOCompanion.insert(
                localId: localId,
                id: id,
                name: name,
                quantity: quantity,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MaterialAvailableDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaterialAvailableDOTable,
      MaterialAvailableDOData,
      $$MaterialAvailableDOTableFilterComposer,
      $$MaterialAvailableDOTableOrderingComposer,
      $$MaterialAvailableDOTableAnnotationComposer,
      $$MaterialAvailableDOTableCreateCompanionBuilder,
      $$MaterialAvailableDOTableUpdateCompanionBuilder,
      (
        MaterialAvailableDOData,
        BaseReferences<
          _$AppDatabase,
          $MaterialAvailableDOTable,
          MaterialAvailableDOData
        >,
      ),
      MaterialAvailableDOData,
      PrefetchHooks Function()
    >;
typedef $$MaterialRequiredDOTableCreateCompanionBuilder =
    MaterialRequiredDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      required String name,
      required int idIntervention,
    });
typedef $$MaterialRequiredDOTableUpdateCompanionBuilder =
    MaterialRequiredDOCompanion Function({
      Value<int> localId,
      Value<int?> id,
      Value<String> name,
      Value<int> idIntervention,
    });

final class $$MaterialRequiredDOTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MaterialRequiredDOTable,
          MaterialRequiredDOData
        > {
  $$MaterialRequiredDOTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionDOTable _idInterventionTable(_$AppDatabase db) =>
      db.interventionDO.createAlias(
        $_aliasNameGenerator(
          db.materialRequiredDO.idIntervention,
          db.interventionDO.localId,
        ),
      );

  $$InterventionDOTableProcessedTableManager get idIntervention {
    final $_column = $_itemColumn<int>('id_intervention')!;

    final manager = $$InterventionDOTableTableManager(
      $_db,
      $_db.interventionDO,
    ).filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idInterventionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MaterialRequiredDOTableFilterComposer
    extends Composer<_$AppDatabase, $MaterialRequiredDOTable> {
  $$MaterialRequiredDOTableFilterComposer({
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

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionDOTableFilterComposer get idIntervention {
    final $$InterventionDOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableFilterComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaterialRequiredDOTableOrderingComposer
    extends Composer<_$AppDatabase, $MaterialRequiredDOTable> {
  $$MaterialRequiredDOTableOrderingComposer({
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

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionDOTableOrderingComposer get idIntervention {
    final $$InterventionDOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableOrderingComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaterialRequiredDOTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaterialRequiredDOTable> {
  $$MaterialRequiredDOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$InterventionDOTableAnnotationComposer get idIntervention {
    final $$InterventionDOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idIntervention,
      referencedTable: $db.interventionDO,
      getReferencedColumn: (t) => t.localId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionDOTableAnnotationComposer(
            $db: $db,
            $table: $db.interventionDO,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaterialRequiredDOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaterialRequiredDOTable,
          MaterialRequiredDOData,
          $$MaterialRequiredDOTableFilterComposer,
          $$MaterialRequiredDOTableOrderingComposer,
          $$MaterialRequiredDOTableAnnotationComposer,
          $$MaterialRequiredDOTableCreateCompanionBuilder,
          $$MaterialRequiredDOTableUpdateCompanionBuilder,
          (MaterialRequiredDOData, $$MaterialRequiredDOTableReferences),
          MaterialRequiredDOData,
          PrefetchHooks Function({bool idIntervention})
        > {
  $$MaterialRequiredDOTableTableManager(
    _$AppDatabase db,
    $MaterialRequiredDOTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MaterialRequiredDOTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$MaterialRequiredDOTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$MaterialRequiredDOTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> idIntervention = const Value.absent(),
              }) => MaterialRequiredDOCompanion(
                localId: localId,
                id: id,
                name: name,
                idIntervention: idIntervention,
              ),
          createCompanionCallback:
              ({
                Value<int> localId = const Value.absent(),
                Value<int?> id = const Value.absent(),
                required String name,
                required int idIntervention,
              }) => MaterialRequiredDOCompanion.insert(
                localId: localId,
                id: id,
                name: name,
                idIntervention: idIntervention,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MaterialRequiredDOTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idIntervention = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idIntervention) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idIntervention,
                            referencedTable: $$MaterialRequiredDOTableReferences
                                ._idInterventionTable(db),
                            referencedColumn:
                                $$MaterialRequiredDOTableReferences
                                    ._idInterventionTable(db)
                                    .localId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MaterialRequiredDOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaterialRequiredDOTable,
      MaterialRequiredDOData,
      $$MaterialRequiredDOTableFilterComposer,
      $$MaterialRequiredDOTableOrderingComposer,
      $$MaterialRequiredDOTableAnnotationComposer,
      $$MaterialRequiredDOTableCreateCompanionBuilder,
      $$MaterialRequiredDOTableUpdateCompanionBuilder,
      (MaterialRequiredDOData, $$MaterialRequiredDOTableReferences),
      MaterialRequiredDOData,
      PrefetchHooks Function({bool idIntervention})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserDOTableTableManager get userDO =>
      $$UserDOTableTableManager(_db, _db.userDO);
  $$InterventionDOTableTableManager get interventionDO =>
      $$InterventionDOTableTableManager(_db, _db.interventionDO);
  $$PhotoDOTableTableManager get photoDO =>
      $$PhotoDOTableTableManager(_db, _db.photoDO);
  $$TempsInterventionDOTableTableManager get tempsInterventionDO =>
      $$TempsInterventionDOTableTableManager(_db, _db.tempsInterventionDO);
  $$DocumentDOTableTableManager get documentDO =>
      $$DocumentDOTableTableManager(_db, _db.documentDO);
  $$CommentairePjDOTableTableManager get commentairePjDO =>
      $$CommentairePjDOTableTableManager(_db, _db.commentairePjDO);
  $$CommentaireDOTableTableManager get commentaireDO =>
      $$CommentaireDOTableTableManager(_db, _db.commentaireDO);
  $$MaterialDOTableTableManager get materialDO =>
      $$MaterialDOTableTableManager(_db, _db.materialDO);
  $$MaterialAvailableDOTableTableManager get materialAvailableDO =>
      $$MaterialAvailableDOTableTableManager(_db, _db.materialAvailableDO);
  $$MaterialRequiredDOTableTableManager get materialRequiredDO =>
      $$MaterialRequiredDOTableTableManager(_db, _db.materialRequiredDO);
}
