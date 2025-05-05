// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_mark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentMark {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  int? get exclude => throw _privateConstructorUsedError;
  int? get avgBall => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentMarkCopyWith<StudentMark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentMarkCopyWith<$Res> {
  factory $StudentMarkCopyWith(
          StudentMark value, $Res Function(StudentMark) then) =
      _$StudentMarkCopyWithImpl<$Res, StudentMark>;
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? middleName,
      int? exclude,
      int? avgBall});
}

/// @nodoc
class _$StudentMarkCopyWithImpl<$Res, $Val extends StudentMark>
    implements $StudentMarkCopyWith<$Res> {
  _$StudentMarkCopyWithImpl(this._value, this._then);

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
abstract class _$$StudentMarkImplCopyWith<$Res>
    implements $StudentMarkCopyWith<$Res> {
  factory _$$StudentMarkImplCopyWith(
          _$StudentMarkImpl value, $Res Function(_$StudentMarkImpl) then) =
      __$$StudentMarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? middleName,
      int? exclude,
      int? avgBall});
}

/// @nodoc
class __$$StudentMarkImplCopyWithImpl<$Res>
    extends _$StudentMarkCopyWithImpl<$Res, _$StudentMarkImpl>
    implements _$$StudentMarkImplCopyWith<$Res> {
  __$$StudentMarkImplCopyWithImpl(
      _$StudentMarkImpl _value, $Res Function(_$StudentMarkImpl) _then)
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
    return _then(_$StudentMarkImpl(
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

class _$StudentMarkImpl implements _StudentMark {
  _$StudentMarkImpl(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.exclude,
      this.avgBall});

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? middleName;
  @override
  final int? exclude;
  @override
  final int? avgBall;

  @override
  String toString() {
    return 'StudentMark(id: $id, firstName: $firstName, lastName: $lastName, middleName: $middleName, exclude: $exclude, avgBall: $avgBall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentMarkImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, id, firstName, lastName, middleName, exclude, avgBall);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentMarkImplCopyWith<_$StudentMarkImpl> get copyWith =>
      __$$StudentMarkImplCopyWithImpl<_$StudentMarkImpl>(this, _$identity);
}

abstract class _StudentMark implements StudentMark {
  factory _StudentMark(
      {final String? id,
      final String? firstName,
      final String? lastName,
      final String? middleName,
      final int? exclude,
      final int? avgBall}) = _$StudentMarkImpl;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get middleName;
  @override
  int? get exclude;
  @override
  int? get avgBall;
  @override
  @JsonKey(ignore: true)
  _$$StudentMarkImplCopyWith<_$StudentMarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
