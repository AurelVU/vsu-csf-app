// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'next_subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NextSubject {
  Subject? get subject => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NextSubjectCopyWith<NextSubject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextSubjectCopyWith<$Res> {
  factory $NextSubjectCopyWith(
          NextSubject value, $Res Function(NextSubject) then) =
      _$NextSubjectCopyWithImpl<$Res, NextSubject>;
  @useResult
  $Res call({Subject? subject, String? status});

  $SubjectCopyWith<$Res>? get subject;
}

/// @nodoc
class _$NextSubjectCopyWithImpl<$Res, $Val extends NextSubject>
    implements $NextSubjectCopyWith<$Res> {
  _$NextSubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $SubjectCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NextSubjectImplCopyWith<$Res>
    implements $NextSubjectCopyWith<$Res> {
  factory _$$NextSubjectImplCopyWith(
          _$NextSubjectImpl value, $Res Function(_$NextSubjectImpl) then) =
      __$$NextSubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Subject? subject, String? status});

  @override
  $SubjectCopyWith<$Res>? get subject;
}

/// @nodoc
class __$$NextSubjectImplCopyWithImpl<$Res>
    extends _$NextSubjectCopyWithImpl<$Res, _$NextSubjectImpl>
    implements _$$NextSubjectImplCopyWith<$Res> {
  __$$NextSubjectImplCopyWithImpl(
      _$NextSubjectImpl _value, $Res Function(_$NextSubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = freezed,
    Object? status = freezed,
  }) {
    return _then(_$NextSubjectImpl(
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NextSubjectImpl implements _NextSubject {
  _$NextSubjectImpl({this.subject, this.status});

  @override
  final Subject? subject;
  @override
  final String? status;

  @override
  String toString() {
    return 'NextSubject(subject: $subject, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextSubjectImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subject, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextSubjectImplCopyWith<_$NextSubjectImpl> get copyWith =>
      __$$NextSubjectImplCopyWithImpl<_$NextSubjectImpl>(this, _$identity);
}

abstract class _NextSubject implements NextSubject {
  factory _NextSubject({final Subject? subject, final String? status}) =
      _$NextSubjectImpl;

  @override
  Subject? get subject;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$NextSubjectImplCopyWith<_$NextSubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
