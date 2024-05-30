// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPhotoModelCollection on Isar {
  IsarCollection<PhotoModel> get photoModels => this.collection();
}

const PhotoModelSchema = CollectionSchema(
  name: r'PhotoModel',
  id: -2122015663171639146,
  properties: {
    r'alt': PropertySchema(
      id: 0,
      name: r'alt',
      type: IsarType.string,
    ),
    r'avgColor': PropertySchema(
      id: 1,
      name: r'avgColor',
      type: IsarType.string,
    ),
    r'height': PropertySchema(
      id: 2,
      name: r'height',
      type: IsarType.long,
    ),
    r'liked': PropertySchema(
      id: 3,
      name: r'liked',
      type: IsarType.bool,
    ),
    r'photographer': PropertySchema(
      id: 4,
      name: r'photographer',
      type: IsarType.string,
    ),
    r'photographerId': PropertySchema(
      id: 5,
      name: r'photographerId',
      type: IsarType.long,
    ),
    r'photographerUrl': PropertySchema(
      id: 6,
      name: r'photographerUrl',
      type: IsarType.string,
    ),
    r'src': PropertySchema(
      id: 7,
      name: r'src',
      type: IsarType.object,
      target: r'SrcModel',
    ),
    r'url': PropertySchema(
      id: 8,
      name: r'url',
      type: IsarType.string,
    ),
    r'width': PropertySchema(
      id: 9,
      name: r'width',
      type: IsarType.long,
    )
  },
  estimateSize: _photoModelEstimateSize,
  serialize: _photoModelSerialize,
  deserialize: _photoModelDeserialize,
  deserializeProp: _photoModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'SrcModel': SrcModelSchema},
  getId: _photoModelGetId,
  getLinks: _photoModelGetLinks,
  attach: _photoModelAttach,
  version: '3.1.0+1',
);

int _photoModelEstimateSize(
  PhotoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alt.length * 3;
  bytesCount += 3 + object.avgColor.length * 3;
  bytesCount += 3 + object.photographer.length * 3;
  bytesCount += 3 + object.photographerUrl.length * 3;
  bytesCount += 3 +
      SrcModelSchema.estimateSize(
          object.src, allOffsets[SrcModel]!, allOffsets);
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _photoModelSerialize(
  PhotoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alt);
  writer.writeString(offsets[1], object.avgColor);
  writer.writeLong(offsets[2], object.height);
  writer.writeBool(offsets[3], object.liked);
  writer.writeString(offsets[4], object.photographer);
  writer.writeLong(offsets[5], object.photographerId);
  writer.writeString(offsets[6], object.photographerUrl);
  writer.writeObject<SrcModel>(
    offsets[7],
    allOffsets,
    SrcModelSchema.serialize,
    object.src,
  );
  writer.writeString(offsets[8], object.url);
  writer.writeLong(offsets[9], object.width);
}

PhotoModel _photoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhotoModel(
    alt: reader.readString(offsets[0]),
    avgColor: reader.readString(offsets[1]),
    height: reader.readLong(offsets[2]),
    id: id,
    liked: reader.readBool(offsets[3]),
    photographer: reader.readString(offsets[4]),
    photographerId: reader.readLong(offsets[5]),
    photographerUrl: reader.readString(offsets[6]),
    src: reader.readObjectOrNull<SrcModel>(
          offsets[7],
          SrcModelSchema.deserialize,
          allOffsets,
        ) ??
        SrcModel(),
    url: reader.readString(offsets[8]),
    width: reader.readLong(offsets[9]),
  );
  return object;
}

P _photoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<SrcModel>(
            offset,
            SrcModelSchema.deserialize,
            allOffsets,
          ) ??
          SrcModel()) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _photoModelGetId(PhotoModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _photoModelGetLinks(PhotoModel object) {
  return [];
}

void _photoModelAttach(IsarCollection<dynamic> col, Id id, PhotoModel object) {}

extension PhotoModelQueryWhereSort
    on QueryBuilder<PhotoModel, PhotoModel, QWhere> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhotoModelQueryWhere
    on QueryBuilder<PhotoModel, PhotoModel, QWhereClause> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idBetween(
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
}

extension PhotoModelQueryFilter
    on QueryBuilder<PhotoModel, PhotoModel, QFilterCondition> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alt',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> altIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alt',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> avgColorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avgColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      avgColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avgColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> avgColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avgColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> avgColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avgColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      avgColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avgColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> avgColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avgColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> avgColorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avgColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> avgColorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avgColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      avgColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avgColor',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      avgColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avgColor',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> heightEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> heightGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> heightLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> heightBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> likedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'liked',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photographer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photographer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photographer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photographer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photographer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photographer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photographer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photographer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photographer',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photographer',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photographerId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photographerId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photographerId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photographerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photographerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photographerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photographerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photographerUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photographerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photographerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photographerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photographerUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photographerUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photographerUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photographerUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> widthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> widthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> widthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> widthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PhotoModelQueryObject
    on QueryBuilder<PhotoModel, PhotoModel, QFilterCondition> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> src(
      FilterQuery<SrcModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'src');
    });
  }
}

extension PhotoModelQueryLinks
    on QueryBuilder<PhotoModel, PhotoModel, QFilterCondition> {}

extension PhotoModelQuerySortBy
    on QueryBuilder<PhotoModel, PhotoModel, QSortBy> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByAlt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByAltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByAvgColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgColor', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByAvgColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgColor', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liked', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liked', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotographer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographer', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotographerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographer', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotographerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerId', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy>
      sortByPhotographerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerId', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotographerUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerUrl', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy>
      sortByPhotographerUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerUrl', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }
}

extension PhotoModelQuerySortThenBy
    on QueryBuilder<PhotoModel, PhotoModel, QSortThenBy> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByAlt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByAltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alt', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByAvgColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgColor', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByAvgColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgColor', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liked', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'liked', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotographer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographer', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotographerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographer', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotographerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerId', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy>
      thenByPhotographerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerId', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotographerUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerUrl', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy>
      thenByPhotographerUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photographerUrl', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }
}

extension PhotoModelQueryWhereDistinct
    on QueryBuilder<PhotoModel, PhotoModel, QDistinct> {
  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByAlt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByAvgColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'liked');
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByPhotographer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photographer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByPhotographerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photographerId');
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByPhotographerUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photographerUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'width');
    });
  }
}

extension PhotoModelQueryProperty
    on QueryBuilder<PhotoModel, PhotoModel, QQueryProperty> {
  QueryBuilder<PhotoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PhotoModel, String, QQueryOperations> altProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alt');
    });
  }

  QueryBuilder<PhotoModel, String, QQueryOperations> avgColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgColor');
    });
  }

  QueryBuilder<PhotoModel, int, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<PhotoModel, bool, QQueryOperations> likedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'liked');
    });
  }

  QueryBuilder<PhotoModel, String, QQueryOperations> photographerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photographer');
    });
  }

  QueryBuilder<PhotoModel, int, QQueryOperations> photographerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photographerId');
    });
  }

  QueryBuilder<PhotoModel, String, QQueryOperations> photographerUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photographerUrl');
    });
  }

  QueryBuilder<PhotoModel, SrcModel, QQueryOperations> srcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'src');
    });
  }

  QueryBuilder<PhotoModel, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }

  QueryBuilder<PhotoModel, int, QQueryOperations> widthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'width');
    });
  }
}
