// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'src_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SrcModelSchema = Schema(
  name: r'SrcModel',
  id: -6608525819625506959,
  properties: {
    r'landscape': PropertySchema(
      id: 0,
      name: r'landscape',
      type: IsarType.string,
    ),
    r'large': PropertySchema(
      id: 1,
      name: r'large',
      type: IsarType.string,
    ),
    r'large2X': PropertySchema(
      id: 2,
      name: r'large2X',
      type: IsarType.string,
    ),
    r'medium': PropertySchema(
      id: 3,
      name: r'medium',
      type: IsarType.string,
    ),
    r'original': PropertySchema(
      id: 4,
      name: r'original',
      type: IsarType.string,
    ),
    r'portrait': PropertySchema(
      id: 5,
      name: r'portrait',
      type: IsarType.string,
    ),
    r'small': PropertySchema(
      id: 6,
      name: r'small',
      type: IsarType.string,
    ),
    r'tiny': PropertySchema(
      id: 7,
      name: r'tiny',
      type: IsarType.string,
    )
  },
  estimateSize: _srcModelEstimateSize,
  serialize: _srcModelSerialize,
  deserialize: _srcModelDeserialize,
  deserializeProp: _srcModelDeserializeProp,
);

int _srcModelEstimateSize(
  SrcModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.landscape;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.large;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.large2X;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.medium;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.original;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.portrait;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.small;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _srcModelSerialize(
  SrcModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.landscape);
  writer.writeString(offsets[1], object.large);
  writer.writeString(offsets[2], object.large2X);
  writer.writeString(offsets[3], object.medium);
  writer.writeString(offsets[4], object.original);
  writer.writeString(offsets[5], object.portrait);
  writer.writeString(offsets[6], object.small);
  writer.writeString(offsets[7], object.tiny);
}

SrcModel _srcModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SrcModel(
    landscape: reader.readStringOrNull(offsets[0]),
    large: reader.readStringOrNull(offsets[1]),
    large2X: reader.readStringOrNull(offsets[2]),
    medium: reader.readStringOrNull(offsets[3]),
    original: reader.readStringOrNull(offsets[4]),
    portrait: reader.readStringOrNull(offsets[5]),
    small: reader.readStringOrNull(offsets[6]),
    tiny: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _srcModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SrcModelQueryFilter
    on QueryBuilder<SrcModel, SrcModel, QFilterCondition> {
  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'landscape',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'landscape',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'landscape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'landscape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'landscape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'landscape',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'landscape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'landscape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'landscape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'landscape',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> landscapeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'landscape',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition>
      landscapeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'landscape',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'large',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'large',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> largeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'large2X',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'large2X',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large2X',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'large2X',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'large2X',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'large2X',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'large2X',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'large2X',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'large2X',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'large2X',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large2X',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> large2XIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'large2X',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medium',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medium',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medium',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medium',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> mediumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medium',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'original',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'original',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'original',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'original',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'original',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> originalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'original',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portrait',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portrait',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portrait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portrait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portrait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portrait',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portrait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portrait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portrait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portrait',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portrait',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> portraitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portrait',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'small',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'small',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'small',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'small',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'small',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> smallIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'small',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tiny',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tiny',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tiny',
        value: '',
      ));
    });
  }

  QueryBuilder<SrcModel, SrcModel, QAfterFilterCondition> tinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tiny',
        value: '',
      ));
    });
  }
}

extension SrcModelQueryObject
    on QueryBuilder<SrcModel, SrcModel, QFilterCondition> {}
