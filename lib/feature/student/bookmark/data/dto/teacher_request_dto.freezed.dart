// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherRequestDto _$TeacherRequestDtoFromJson(Map<String, dynamic> json) {
  return _TeacherRequestDto.fromJson(json);
}

/// @nodoc
mixin _$TeacherRequestDto {
  @JsonKey(name: 'teacher_id')
  int? get teacherId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherRequestDtoCopyWith<TeacherRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherRequestDtoCopyWith<$Res> {
  factory $TeacherRequestDtoCopyWith(
          TeacherRequestDto value, $Res Function(TeacherRequestDto) then) =
      _$TeacherRequestDtoCopyWithImpl<$Res, TeacherRequestDto>;
  @useResult
  $Res call({@JsonKey(name: 'teacher_id') int? teacherId});
}

/// @nodoc
class _$TeacherRequestDtoCopyWithImpl<$Res, $Val extends TeacherRequestDto>
    implements $TeacherRequestDtoCopyWith<$Res> {
  _$TeacherRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = freezed,
  }) {
    return _then(_value.copyWith(
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherRequestDtoImplCopyWith<$Res>
    implements $TeacherRequestDtoCopyWith<$Res> {
  factory _$$TeacherRequestDtoImplCopyWith(_$TeacherRequestDtoImpl value,
          $Res Function(_$TeacherRequestDtoImpl) then) =
      __$$TeacherRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'teacher_id') int? teacherId});
}

/// @nodoc
class __$$TeacherRequestDtoImplCopyWithImpl<$Res>
    extends _$TeacherRequestDtoCopyWithImpl<$Res, _$TeacherRequestDtoImpl>
    implements _$$TeacherRequestDtoImplCopyWith<$Res> {
  __$$TeacherRequestDtoImplCopyWithImpl(_$TeacherRequestDtoImpl _value,
      $Res Function(_$TeacherRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = freezed,
  }) {
    return _then(_$TeacherRequestDtoImpl(
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherRequestDtoImpl implements _TeacherRequestDto {
  const _$TeacherRequestDtoImpl({@JsonKey(name: 'teacher_id') this.teacherId});

  factory _$TeacherRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'teacher_id')
  final int? teacherId;

  @override
  String toString() {
    return 'TeacherRequestDto(teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherRequestDtoImpl &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, teacherId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherRequestDtoImplCopyWith<_$TeacherRequestDtoImpl> get copyWith =>
      __$$TeacherRequestDtoImplCopyWithImpl<_$TeacherRequestDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _TeacherRequestDto implements TeacherRequestDto {
  const factory _TeacherRequestDto(
          {@JsonKey(name: 'teacher_id') final int? teacherId}) =
      _$TeacherRequestDtoImpl;

  factory _TeacherRequestDto.fromJson(Map<String, dynamic> json) =
      _$TeacherRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'teacher_id')
  int? get teacherId;
  @override
  @JsonKey(ignore: true)
  _$$TeacherRequestDtoImplCopyWith<_$TeacherRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
