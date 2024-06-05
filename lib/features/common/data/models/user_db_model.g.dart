// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserDbModelCollection on Isar {
  IsarCollection<UserDbModel> get userDbModels => this.collection();
}

const UserDbModelSchema = CollectionSchema(
  name: r'UserDbModel',
  id: 6877280276919868428,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'idUser': PropertySchema(
      id: 2,
      name: r'idUser',
      type: IsarType.string,
    ),
    r'isCompleteProfile': PropertySchema(
      id: 3,
      name: r'isCompleteProfile',
      type: IsarType.bool,
    ),
    r'refreshToken': PropertySchema(
      id: 4,
      name: r'refreshToken',
      type: IsarType.string,
    ),
    r'stringify': PropertySchema(
      id: 5,
      name: r'stringify',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userAddress': PropertySchema(
      id: 7,
      name: r'userAddress',
      type: IsarType.string,
    ),
    r'userDateOfBirth': PropertySchema(
      id: 8,
      name: r'userDateOfBirth',
      type: IsarType.dateTime,
    ),
    r'userEmail': PropertySchema(
      id: 9,
      name: r'userEmail',
      type: IsarType.string,
    ),
    r'userFullName': PropertySchema(
      id: 10,
      name: r'userFullName',
      type: IsarType.string,
    ),
    r'userGender': PropertySchema(
      id: 11,
      name: r'userGender',
      type: IsarType.string,
    ),
    r'userName': PropertySchema(
      id: 12,
      name: r'userName',
      type: IsarType.string,
    ),
    r'userNik': PropertySchema(
      id: 13,
      name: r'userNik',
      type: IsarType.string,
    ),
    r'userPhone': PropertySchema(
      id: 14,
      name: r'userPhone',
      type: IsarType.string,
    )
  },
  estimateSize: _userDbModelEstimateSize,
  serialize: _userDbModelSerialize,
  deserialize: _userDbModelDeserialize,
  deserializeProp: _userDbModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'idUser': IndexSchema(
      id: 4457735720952084498,
      name: r'idUser',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idUser',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userDbModelGetId,
  getLinks: _userDbModelGetLinks,
  attach: _userDbModelAttach,
  version: '3.1.0+1',
);

int _userDbModelEstimateSize(
  UserDbModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idUser.length * 3;
  {
    final value = object.refreshToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userEmail.length * 3;
  {
    final value = object.userFullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userGender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userNik.length * 3;
  {
    final value = object.userPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userDbModelSerialize(
  UserDbModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeString(offsets[2], object.idUser);
  writer.writeBool(offsets[3], object.isCompleteProfile);
  writer.writeString(offsets[4], object.refreshToken);
  writer.writeBool(offsets[5], object.stringify);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeString(offsets[7], object.userAddress);
  writer.writeDateTime(offsets[8], object.userDateOfBirth);
  writer.writeString(offsets[9], object.userEmail);
  writer.writeString(offsets[10], object.userFullName);
  writer.writeString(offsets[11], object.userGender);
  writer.writeString(offsets[12], object.userName);
  writer.writeString(offsets[13], object.userNik);
  writer.writeString(offsets[14], object.userPhone);
}

UserDbModel _userDbModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserDbModel(
    createdAt: reader.readDateTime(offsets[0]),
    idUser: reader.readString(offsets[2]),
    isCompleteProfile: reader.readBool(offsets[3]),
    refreshToken: reader.readStringOrNull(offsets[4]),
    updatedAt: reader.readDateTime(offsets[6]),
    userAddress: reader.readStringOrNull(offsets[7]),
    userDateOfBirth: reader.readDateTimeOrNull(offsets[8]),
    userEmail: reader.readString(offsets[9]),
    userFullName: reader.readStringOrNull(offsets[10]),
    userGender: reader.readStringOrNull(offsets[11]),
    userName: reader.readStringOrNull(offsets[12]),
    userNik: reader.readString(offsets[13]),
    userPhone: reader.readStringOrNull(offsets[14]),
  );
  return object;
}

P _userDbModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userDbModelGetId(UserDbModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userDbModelGetLinks(UserDbModel object) {
  return [];
}

void _userDbModelAttach(
    IsarCollection<dynamic> col, Id id, UserDbModel object) {}

extension UserDbModelByIndex on IsarCollection<UserDbModel> {
  Future<UserDbModel?> getByIdUser(String idUser) {
    return getByIndex(r'idUser', [idUser]);
  }

  UserDbModel? getByIdUserSync(String idUser) {
    return getByIndexSync(r'idUser', [idUser]);
  }

  Future<bool> deleteByIdUser(String idUser) {
    return deleteByIndex(r'idUser', [idUser]);
  }

  bool deleteByIdUserSync(String idUser) {
    return deleteByIndexSync(r'idUser', [idUser]);
  }

  Future<List<UserDbModel?>> getAllByIdUser(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return getAllByIndex(r'idUser', values);
  }

  List<UserDbModel?> getAllByIdUserSync(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idUser', values);
  }

  Future<int> deleteAllByIdUser(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idUser', values);
  }

  int deleteAllByIdUserSync(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idUser', values);
  }

  Future<Id> putByIdUser(UserDbModel object) {
    return putByIndex(r'idUser', object);
  }

  Id putByIdUserSync(UserDbModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'idUser', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdUser(List<UserDbModel> objects) {
    return putAllByIndex(r'idUser', objects);
  }

  List<Id> putAllByIdUserSync(List<UserDbModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idUser', objects, saveLinks: saveLinks);
  }
}

extension UserDbModelQueryWhereSort
    on QueryBuilder<UserDbModel, UserDbModel, QWhere> {
  QueryBuilder<UserDbModel, UserDbModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserDbModelQueryWhere
    on QueryBuilder<UserDbModel, UserDbModel, QWhereClause> {
  QueryBuilder<UserDbModel, UserDbModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterWhereClause> idUserEqualTo(
      String idUser) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idUser',
        value: [idUser],
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterWhereClause> idUserNotEqualTo(
      String idUser) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [],
              upper: [idUser],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [idUser],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [idUser],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [],
              upper: [idUser],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserDbModelQueryFilter
    on QueryBuilder<UserDbModel, UserDbModel, QFilterCondition> {
  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      idUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      idUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idUserContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> idUserMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      idUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      idUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      isCompleteProfileEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleteProfile',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'refreshToken',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'refreshToken',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refreshToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'refreshToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refreshToken',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      refreshTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'refreshToken',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      stringifyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      stringifyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      stringifyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringify',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userAddress',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userAddress',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userDateOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userDateOfBirth',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userDateOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userDateOfBirth',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userDateOfBirthEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userDateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userDateOfBirthGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userDateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userDateOfBirthLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userDateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userDateOfBirthBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userDateOfBirth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userFullName',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userFullName',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userFullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userFullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userFullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userFullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userFullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userFullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userFullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFullName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userFullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userFullName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userGender',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userGender',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userGender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userGender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userGender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userGenderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userGender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNikEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userNik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNikGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userNik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNikLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userNik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNikBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userNik',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNikStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userNik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNikEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userNik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNikContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userNik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition> userNikMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userNik',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNikIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userNik',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userNikIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userNik',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userPhone',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userPhone',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterFilterCondition>
      userPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userPhone',
        value: '',
      ));
    });
  }
}

extension UserDbModelQueryObject
    on QueryBuilder<UserDbModel, UserDbModel, QFilterCondition> {}

extension UserDbModelQueryLinks
    on QueryBuilder<UserDbModel, UserDbModel, QFilterCondition> {}

extension UserDbModelQuerySortBy
    on QueryBuilder<UserDbModel, UserDbModel, QSortBy> {
  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      sortByIsCompleteProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      sortByIsCompleteProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByRefreshToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      sortByRefreshTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAddress', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAddress', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      sortByUserDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFullName', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      sortByUserFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFullName', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGender', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGender', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserNik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userNik', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserNikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userNik', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPhone', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> sortByUserPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPhone', Sort.desc);
    });
  }
}

extension UserDbModelQuerySortThenBy
    on QueryBuilder<UserDbModel, UserDbModel, QSortThenBy> {
  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      thenByIsCompleteProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      thenByIsCompleteProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByRefreshToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      thenByRefreshTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAddress', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAddress', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      thenByUserDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFullName', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy>
      thenByUserFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFullName', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGender', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGender', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserNik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userNik', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserNikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userNik', Sort.desc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPhone', Sort.asc);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QAfterSortBy> thenByUserPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPhone', Sort.desc);
    });
  }
}

extension UserDbModelQueryWhereDistinct
    on QueryBuilder<UserDbModel, UserDbModel, QDistinct> {
  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByIdUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct>
      distinctByIsCompleteProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleteProfile');
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByRefreshToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refreshToken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stringify');
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUserAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct>
      distinctByUserDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userDateOfBirth');
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUserEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUserFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userFullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUserGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userGender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUserNik(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userNik', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDbModel, UserDbModel, QDistinct> distinctByUserPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userPhone', caseSensitive: caseSensitive);
    });
  }
}

extension UserDbModelQueryProperty
    on QueryBuilder<UserDbModel, UserDbModel, QQueryProperty> {
  QueryBuilder<UserDbModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserDbModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<UserDbModel, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<UserDbModel, String, QQueryOperations> idUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUser');
    });
  }

  QueryBuilder<UserDbModel, bool, QQueryOperations>
      isCompleteProfileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleteProfile');
    });
  }

  QueryBuilder<UserDbModel, String?, QQueryOperations> refreshTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refreshToken');
    });
  }

  QueryBuilder<UserDbModel, bool?, QQueryOperations> stringifyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stringify');
    });
  }

  QueryBuilder<UserDbModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<UserDbModel, String?, QQueryOperations> userAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAddress');
    });
  }

  QueryBuilder<UserDbModel, DateTime?, QQueryOperations>
      userDateOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userDateOfBirth');
    });
  }

  QueryBuilder<UserDbModel, String, QQueryOperations> userEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userEmail');
    });
  }

  QueryBuilder<UserDbModel, String?, QQueryOperations> userFullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userFullName');
    });
  }

  QueryBuilder<UserDbModel, String?, QQueryOperations> userGenderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userGender');
    });
  }

  QueryBuilder<UserDbModel, String?, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }

  QueryBuilder<UserDbModel, String, QQueryOperations> userNikProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userNik');
    });
  }

  QueryBuilder<UserDbModel, String?, QQueryOperations> userPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userPhone');
    });
  }
}
