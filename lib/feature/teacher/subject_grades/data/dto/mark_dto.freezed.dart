// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarkDto _$MarkDtoFromJson(Map<String, dynamic> json) {
  return _MarkDto.fromJson(json);
}

/// @nodoc
mixin _$MarkDto {
  @JsonKey(name: 'student_id')
  String? get studentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mark_id')
  String? get markId => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_edit')
  bool? get canEdit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkDtoCopyWith<MarkDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkDtoCopyWith<$Res> {
  factory $MarkDtoCopyWith(MarkDto value, $Res Function(MarkDto) then) =
      _$MarkDtoCopyWithImpl<$Res, MarkDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id') String? studentId,
      @JsonKey(name: 'mark_id') String? markId,
      String? value,
      String? color,
      @JsonKey(name: 'can_edit') bool? canEdit});
}

/// @nodoc
class _$MarkDtoCopyWithImpl<$Res, $Val extends MarkDto>
    implements $MarkDtoCopyWith<$Res> {
  _$MarkDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$MarkDtoImplCopyWith<$Res> implements $MarkDtoCopyWith<$Res> {
  factory _$$MarkDtoImplCopyWith(
          _$MarkDtoImpl value, $Res Function(_$MarkDtoImpl) then) =
      __$$MarkDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id') String? studentId,
      @JsonKey(name: 'mark_id') String? markId,
      String? value,
      String? color,
      @JsonKey(name: 'can_edit') bool? canEdit});
}

/// @nodoc
class __$$MarkDtoImplCopyWithImpl<$Res>
    extends _$MarkDtoCopyWithImpl<$Res, _$MarkDtoImpl>
    implements _$$MarkDtoImplCopyWith<$Res> {
  __$$MarkDtoImplCopyWithImpl(
      _$MarkDtoImpl _value, $Res Function(_$MarkDtoImpl) _then)
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
    return _then(_$MarkDtoImpl(
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
@JsonSerializable()
class _$MarkDtoImpl implements _MarkDto {
  const _$MarkDtoImpl(
      {@JsonKey(name: 'student_id') this.studentId,
      @JsonKey(name: 'mark_id') this.markId,
      this.value,
      this.color,
      @JsonKey(name: 'can_edit') this.canEdit});

  factory _$MarkDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkDtoImplFromJson(json);

  @override
  @JsonKey(name: 'student_id')
  final String? studentId;
  @override
  @JsonKey(name: 'mark_id')
  final String? markId;
  @override
  final String? value;
  @override
  final String? color;
  @override
  @JsonKey(name: 'can_edit')
  final bool? canEdit;

  @override
  String toString() {
    return 'MarkDto(studentId: $studentId, markId: $markId, value: $value, color: $color, canEdit: $canEdit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkDtoImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.markId, markId) || other.markId == markId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, studentId, markId, value, color, canEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkDtoImplCopyWith<_$MarkDtoImpl> get copyWith =>
      __$$MarkDtoImplCopyWithImpl<_$MarkDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkDtoImplToJson(
      this,
    );
  }
}

abstract class _MarkDto implements MarkDto {
  const factory _MarkDto(
      {@JsonKey(name: 'student_id') final String? studentId,
      @JsonKey(name: 'mark_id') final String? markId,
      final String? value,
      final String? color,
      @JsonKey(name: 'can_edit') final bool? canEdit}) = _$MarkDtoImpl;

  factory _MarkDto.fromJson(Map<String, dynamic> json) = _$MarkDtoImpl.fromJson;

  @override
  @JsonKey(name: 'student_id')
  String? get studentId;
  @override
  @JsonKey(name: 'mark_id')
  String? get markId;
  @override
  String? get value;
  @override
  String? get color;
  @override
  @JsonKey(name: 'can_edit')
  bool? get canEdit;
  @override
  @JsonKey(ignore: true)
  _$$MarkDtoImplCopyWith<_$MarkDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
