// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherDto _$TeacherDtoFromJson(Map<String, dynamic> json) {
  return _TeacherDto.fromJson(json);
}

/// @nodoc
mixin _$TeacherDto {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_selected')
  bool? get isSelected => throw _privateConstructorUsedError;
  String? get middlename => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherDtoCopyWith<TeacherDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDtoCopyWith<$Res> {
  factory $TeacherDtoCopyWith(
          TeacherDto value, $Res Function(TeacherDto) then) =
      _$TeacherDtoCopyWithImpl<$Res, TeacherDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'is_selected') bool? isSelected,
      String? middlename,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName});
}

/// @nodoc
class _$TeacherDtoCopyWithImpl<$Res, $Val extends TeacherDto>
    implements $TeacherDtoCopyWith<$Res> {
  _$TeacherDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isSelected = freezed,
    Object? middlename = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherDtoImplCopyWith<$Res>
    implements $TeacherDtoCopyWith<$Res> {
  factory _$$TeacherDtoImplCopyWith(
          _$TeacherDtoImpl value, $Res Function(_$TeacherDtoImpl) then) =
      __$$TeacherDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'is_selected') bool? isSelected,
      String? middlename,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName});
}

/// @nodoc
class __$$TeacherDtoImplCopyWithImpl<$Res>
    extends _$TeacherDtoCopyWithImpl<$Res, _$TeacherDtoImpl>
    implements _$$TeacherDtoImplCopyWith<$Res> {
  __$$TeacherDtoImplCopyWithImpl(
      _$TeacherDtoImpl _value, $Res Function(_$TeacherDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isSelected = freezed,
    Object? middlename = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$TeacherDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherDtoImpl implements _TeacherDto {
  const _$TeacherDtoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'is_selected') this.isSelected,
      this.middlename,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName});

  factory _$TeacherDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'is_selected')
  final bool? isSelected;
  @override
  final String? middlename;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;

  @override
  String toString() {
    return 'TeacherDto(id: $id, isSelected: $isSelected, middlename: $middlename, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, isSelected, middlename, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherDtoImplCopyWith<_$TeacherDtoImpl> get copyWith =>
      __$$TeacherDtoImplCopyWithImpl<_$TeacherDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherDtoImplToJson(
      this,
    );
  }
}

abstract class _TeacherDto implements TeacherDto {
  const factory _TeacherDto(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'is_selected') final bool? isSelected,
      final String? middlename,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName}) = _$TeacherDtoImpl;

  factory _TeacherDto.fromJson(Map<String, dynamic> json) =
      _$TeacherDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'is_selected')
  bool? get isSelected;
  @override
  String? get middlename;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$TeacherDtoImplCopyWith<_$TeacherDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
