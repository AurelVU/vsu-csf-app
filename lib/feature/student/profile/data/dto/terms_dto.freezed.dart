// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TermsDto _$TermsDtoFromJson(Map<String, dynamic> json) {
  return _TermsDto.fromJson(json);
}

/// @nodoc
mixin _$TermsDto {
  int? get numbers => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  List<MarksDto>? get marks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsDtoCopyWith<TermsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsDtoCopyWith<$Res> {
  factory $TermsDtoCopyWith(TermsDto value, $Res Function(TermsDto) then) =
      _$TermsDtoCopyWithImpl<$Res, TermsDto>;
  @useResult
  $Res call({int? numbers, String? year, List<MarksDto>? marks});
}

/// @nodoc
class _$TermsDtoCopyWithImpl<$Res, $Val extends TermsDto>
    implements $TermsDtoCopyWith<$Res> {
  _$TermsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = freezed,
    Object? year = freezed,
    Object? marks = freezed,
  }) {
    return _then(_value.copyWith(
      numbers: freezed == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      marks: freezed == marks
          ? _value.marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarksDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsDtoImplCopyWith<$Res>
    implements $TermsDtoCopyWith<$Res> {
  factory _$$TermsDtoImplCopyWith(
          _$TermsDtoImpl value, $Res Function(_$TermsDtoImpl) then) =
      __$$TermsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? numbers, String? year, List<MarksDto>? marks});
}

/// @nodoc
class __$$TermsDtoImplCopyWithImpl<$Res>
    extends _$TermsDtoCopyWithImpl<$Res, _$TermsDtoImpl>
    implements _$$TermsDtoImplCopyWith<$Res> {
  __$$TermsDtoImplCopyWithImpl(
      _$TermsDtoImpl _value, $Res Function(_$TermsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = freezed,
    Object? year = freezed,
    Object? marks = freezed,
  }) {
    return _then(_$TermsDtoImpl(
      numbers: freezed == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      marks: freezed == marks
          ? _value._marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarksDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TermsDtoImpl implements _TermsDto {
  const _$TermsDtoImpl({this.numbers, this.year, final List<MarksDto>? marks})
      : _marks = marks;

  factory _$TermsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermsDtoImplFromJson(json);

  @override
  final int? numbers;
  @override
  final String? year;
  final List<MarksDto>? _marks;
  @override
  List<MarksDto>? get marks {
    final value = _marks;
    if (value == null) return null;
    if (_marks is EqualUnmodifiableListView) return _marks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TermsDto(numbers: $numbers, year: $year, marks: $marks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsDtoImpl &&
            (identical(other.numbers, numbers) || other.numbers == numbers) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(other._marks, _marks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, numbers, year, const DeepCollectionEquality().hash(_marks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsDtoImplCopyWith<_$TermsDtoImpl> get copyWith =>
      __$$TermsDtoImplCopyWithImpl<_$TermsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermsDtoImplToJson(
      this,
    );
  }
}

abstract class _TermsDto implements TermsDto {
  const factory _TermsDto(
      {final int? numbers,
      final String? year,
      final List<MarksDto>? marks}) = _$TermsDtoImpl;

  factory _TermsDto.fromJson(Map<String, dynamic> json) =
      _$TermsDtoImpl.fromJson;

  @override
  int? get numbers;
  @override
  String? get year;
  @override
  List<MarksDto>? get marks;
  @override
  @JsonKey(ignore: true)
  _$$TermsDtoImplCopyWith<_$TermsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
