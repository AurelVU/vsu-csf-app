// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_mark_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentMarkDto _$StudentMarkDtoFromJson(Map<String, dynamic> json) {
  return _StudentMarkDto.fromJson(json);
}

/// @nodoc
mixin _$StudentMarkDto {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middlename')
  String? get middleName => throw _privateConstructorUsedError;
  int? get exclude => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_ball')
  int? get avgBall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentMarkDtoCopyWith<StudentMarkDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentMarkDtoCopyWith<$Res> {
  factory $StudentMarkDtoCopyWith(
          StudentMarkDto value, $Res Function(StudentMarkDto) then) =
      _$StudentMarkDtoCopyWithImpl<$Res, StudentMarkDto>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middleName,
      int? exclude,
      @JsonKey(name: 'avg_ball') int? avgBall});
}

/// @nodoc
class _$StudentMarkDtoCopyWithImpl<$Res, $Val extends StudentMarkDto>
    implements $StudentMarkDtoCopyWith<$Res> {
  _$StudentMarkDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? exclude = freezed,
    Object? avgBall = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      exclude: freezed == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as int?,
      avgBall: freezed == avgBall
          ? _value.avgBall
          : avgBall // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentMarkDtoImplCopyWith<$Res>
    implements $StudentMarkDtoCopyWith<$Res> {
  factory _$$StudentMarkDtoImplCopyWith(_$StudentMarkDtoImpl value,
          $Res Function(_$StudentMarkDtoImpl) then) =
      __$$StudentMarkDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middleName,
      int? exclude,
      @JsonKey(name: 'avg_ball') int? avgBall});
}

/// @nodoc
class __$$StudentMarkDtoImplCopyWithImpl<$Res>
    extends _$StudentMarkDtoCopyWithImpl<$Res, _$StudentMarkDtoImpl>
    implements _$$StudentMarkDtoImplCopyWith<$Res> {
  __$$StudentMarkDtoImplCopyWithImpl(
      _$StudentMarkDtoImpl _value, $Res Function(_$StudentMarkDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? exclude = freezed,
    Object? avgBall = freezed,
  }) {
    return _then(_$StudentMarkDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      exclude: freezed == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as int?,
      avgBall: freezed == avgBall
          ? _value.avgBall
          : avgBall // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentMarkDtoImpl implements _StudentMarkDto {
  const _$StudentMarkDtoImpl(
      {this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'middlename') this.middleName,
      this.exclude,
      @JsonKey(name: 'avg_ball') this.avgBall});

  factory _$StudentMarkDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentMarkDtoImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'middlename')
  final String? middleName;
  @override
  final int? exclude;
  @override
  @JsonKey(name: 'avg_ball')
  final int? avgBall;

  @override
  String toString() {
    return 'StudentMarkDto(id: $id, firstName: $firstName, lastName: $lastName, middleName: $middleName, exclude: $exclude, avgBall: $avgBall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentMarkDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.exclude, exclude) || other.exclude == exclude) &&
            (identical(other.avgBall, avgBall) || other.avgBall == avgBall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, firstName, lastName, middleName, exclude, avgBall);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentMarkDtoImplCopyWith<_$StudentMarkDtoImpl> get copyWith =>
      __$$StudentMarkDtoImplCopyWithImpl<_$StudentMarkDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentMarkDtoImplToJson(
      this,
    );
  }
}

abstract class _StudentMarkDto implements StudentMarkDto {
  const factory _StudentMarkDto(
      {final String? id,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'middlename') final String? middleName,
      final int? exclude,
      @JsonKey(name: 'avg_ball') final int? avgBall}) = _$StudentMarkDtoImpl;

  factory _StudentMarkDto.fromJson(Map<String, dynamic> json) =
      _$StudentMarkDtoImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'middlename')
  String? get middleName;
  @override
  int? get exclude;
  @override
  @JsonKey(name: 'avg_ball')
  int? get avgBall;
  @override
  @JsonKey(ignore: true)
  _$$StudentMarkDtoImplCopyWith<_$StudentMarkDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
