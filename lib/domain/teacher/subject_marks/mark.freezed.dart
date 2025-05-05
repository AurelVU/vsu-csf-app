// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Mark {
  String? get studentId => throw _privateConstructorUsedError;
  String? get markId => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  bool? get canEdit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarkCopyWith<Mark> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkCopyWith<$Res> {
  factory $MarkCopyWith(Mark value, $Res Function(Mark) then) =
      _$MarkCopyWithImpl<$Res, Mark>;
  @useResult
  $Res call(
      {String? studentId,
      String? markId,
      String? value,
      String? color,
      bool? canEdit});
}

/// @nodoc
class _$MarkCopyWithImpl<$Res, $Val extends Mark>
    implements $MarkCopyWith<$Res> {
  _$MarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? markId = freezed,
    Object? value = freezed,
    Object? color = freezed,
    Object? canEdit = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      markId: freezed == markId
          ? _value.markId
          : markId // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkImplCopyWith<$Res> implements $MarkCopyWith<$Res> {
  factory _$$MarkImplCopyWith(
          _$MarkImpl value, $Res Function(_$MarkImpl) then) =
      __$$MarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? studentId,
      String? markId,
      String? value,
      String? color,
      bool? canEdit});
}

/// @nodoc
class __$$MarkImplCopyWithImpl<$Res>
    extends _$MarkCopyWithImpl<$Res, _$MarkImpl>
    implements _$$MarkImplCopyWith<$Res> {
  __$$MarkImplCopyWithImpl(_$MarkImpl _value, $Res Function(_$MarkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? markId = freezed,
    Object? value = freezed,
    Object? color = freezed,
    Object? canEdit = freezed,
  }) {
    return _then(_$MarkImpl(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      markId: freezed == markId
          ? _value.markId
          : markId // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$MarkImpl implements _Mark {
  _$MarkImpl(
      {this.studentId, this.markId, this.value, this.color, this.canEdit});

  @override
  final String? studentId;
  @override
  final String? markId;
  @override
  final String? value;
  @override
  final String? color;
  @override
  final bool? canEdit;

  @override
  String toString() {
    return 'Mark(studentId: $studentId, markId: $markId, value: $value, color: $color, canEdit: $canEdit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.markId, markId) || other.markId == markId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, studentId, markId, value, color, canEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkImplCopyWith<_$MarkImpl> get copyWith =>
      __$$MarkImplCopyWithImpl<_$MarkImpl>(this, _$identity);
}

abstract class _Mark implements Mark {
  factory _Mark(
      {final String? studentId,
      final String? markId,
      final String? value,
      final String? color,
      final bool? canEdit}) = _$MarkImpl;

  @override
  String? get studentId;
  @override
  String? get markId;
  @override
  String? get value;
  @override
  String? get color;
  @override
  bool? get canEdit;
  @override
  @JsonKey(ignore: true)
  _$$MarkImplCopyWith<_$MarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
