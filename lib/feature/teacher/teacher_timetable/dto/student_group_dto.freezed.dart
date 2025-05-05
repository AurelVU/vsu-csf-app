// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_group_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentGroupDto _$StudentGroupDtoFromJson(Map<String, dynamic> json) {
  return _StudentGroupDto.fromJson(json);
}

/// @nodoc
mixin _$StudentGroupDto {
  List<int>? get id => throw _privateConstructorUsedError;
  int? get course => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  int? get subGroupNumber => throw _privateConstructorUsedError;
  GroupLeaderDto? get curator => throw _privateConstructorUsedError;
  GroupLeaderDto? get groupLeader => throw _privateConstructorUsedError;
  GroupLeaderDto? get groupLeader2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentGroupDtoCopyWith<StudentGroupDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentGroupDtoCopyWith<$Res> {
  factory $StudentGroupDtoCopyWith(
          StudentGroupDto value, $Res Function(StudentGroupDto) then) =
      _$StudentGroupDtoCopyWithImpl<$Res, StudentGroupDto>;
  @useResult
  $Res call(
      {List<int>? id,
      int? course,
      int? number,
      int? subGroupNumber,
      GroupLeaderDto? curator,
      GroupLeaderDto? groupLeader,
      GroupLeaderDto? groupLeader2});

  $GroupLeaderDtoCopyWith<$Res>? get curator;
  $GroupLeaderDtoCopyWith<$Res>? get groupLeader;
  $GroupLeaderDtoCopyWith<$Res>? get groupLeader2;
}

/// @nodoc
class _$StudentGroupDtoCopyWithImpl<$Res, $Val extends StudentGroupDto>
    implements $StudentGroupDtoCopyWith<$Res> {
  _$StudentGroupDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? course = freezed,
    Object? number = freezed,
    Object? subGroupNumber = freezed,
    Object? curator = freezed,
    Object? groupLeader = freezed,
    Object? groupLeader2 = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      subGroupNumber: freezed == subGroupNumber
          ? _value.subGroupNumber
          : subGroupNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      curator: freezed == curator
          ? _value.curator
          : curator // ignore: cast_nullable_to_non_nullable
              as GroupLeaderDto?,
      groupLeader: freezed == groupLeader
          ? _value.groupLeader
          : groupLeader // ignore: cast_nullable_to_non_nullable
              as GroupLeaderDto?,
      groupLeader2: freezed == groupLeader2
          ? _value.groupLeader2
          : groupLeader2 // ignore: cast_nullable_to_non_nullable
              as GroupLeaderDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupLeaderDtoCopyWith<$Res>? get curator {
    if (_value.curator == null) {
      return null;
    }

    return $GroupLeaderDtoCopyWith<$Res>(_value.curator!, (value) {
      return _then(_value.copyWith(curator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupLeaderDtoCopyWith<$Res>? get groupLeader {
    if (_value.groupLeader == null) {
      return null;
    }

    return $GroupLeaderDtoCopyWith<$Res>(_value.groupLeader!, (value) {
      return _then(_value.copyWith(groupLeader: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupLeaderDtoCopyWith<$Res>? get groupLeader2 {
    if (_value.groupLeader2 == null) {
      return null;
    }

    return $GroupLeaderDtoCopyWith<$Res>(_value.groupLeader2!, (value) {
      return _then(_value.copyWith(groupLeader2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentGroupDtoImplCopyWith<$Res>
    implements $StudentGroupDtoCopyWith<$Res> {
  factory _$$StudentGroupDtoImplCopyWith(_$StudentGroupDtoImpl value,
          $Res Function(_$StudentGroupDtoImpl) then) =
      __$$StudentGroupDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int>? id,
      int? course,
      int? number,
      int? subGroupNumber,
      GroupLeaderDto? curator,
      GroupLeaderDto? groupLeader,
      GroupLeaderDto? groupLeader2});

  @override
  $GroupLeaderDtoCopyWith<$Res>? get curator;
  @override
  $GroupLeaderDtoCopyWith<$Res>? get groupLeader;
  @override
  $GroupLeaderDtoCopyWith<$Res>? get groupLeader2;
}

/// @nodoc
class __$$StudentGroupDtoImplCopyWithImpl<$Res>
    extends _$StudentGroupDtoCopyWithImpl<$Res, _$StudentGroupDtoImpl>
    implements _$$StudentGroupDtoImplCopyWith<$Res> {
  __$$StudentGroupDtoImplCopyWithImpl(
      _$StudentGroupDtoImpl _value, $Res Function(_$StudentGroupDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? course = freezed,
    Object? number = freezed,
    Object? subGroupNumber = freezed,
    Object? curator = freezed,
    Object? groupLeader = freezed,
    Object? groupLeader2 = freezed,
  }) {
    return _then(_$StudentGroupDtoImpl(
      id: freezed == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      subGroupNumber: freezed == subGroupNumber
          ? _value.subGroupNumber
          : subGroupNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      curator: freezed == curator
          ? _value.curator
          : curator // ignore: cast_nullable_to_non_nullable
              as GroupLeaderDto?,
      groupLeader: freezed == groupLeader
          ? _value.groupLeader
          : groupLeader // ignore: cast_nullable_to_non_nullable
              as GroupLeaderDto?,
      groupLeader2: freezed == groupLeader2
          ? _value.groupLeader2
          : groupLeader2 // ignore: cast_nullable_to_non_nullable
              as GroupLeaderDto?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class _$StudentGroupDtoImpl implements _StudentGroupDto {
  const _$StudentGroupDtoImpl(
      {final List<int>? id,
      this.course,
      this.number,
      this.subGroupNumber,
      this.curator,
      this.groupLeader,
      this.groupLeader2})
      : _id = id;

  factory _$StudentGroupDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentGroupDtoImplFromJson(json);

  final List<int>? _id;
  @override
  List<int>? get id {
    final value = _id;
    if (value == null) return null;
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? course;
  @override
  final int? number;
  @override
  final int? subGroupNumber;
  @override
  final GroupLeaderDto? curator;
  @override
  final GroupLeaderDto? groupLeader;
  @override
  final GroupLeaderDto? groupLeader2;

  @override
  String toString() {
    return 'StudentGroupDto(id: $id, course: $course, number: $number, subGroupNumber: $subGroupNumber, curator: $curator, groupLeader: $groupLeader, groupLeader2: $groupLeader2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentGroupDtoImpl &&
            const DeepCollectionEquality().equals(other._id, _id) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.subGroupNumber, subGroupNumber) ||
                other.subGroupNumber == subGroupNumber) &&
            (identical(other.curator, curator) || other.curator == curator) &&
            (identical(other.groupLeader, groupLeader) ||
                other.groupLeader == groupLeader) &&
            (identical(other.groupLeader2, groupLeader2) ||
                other.groupLeader2 == groupLeader2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_id),
      course,
      number,
      subGroupNumber,
      curator,
      groupLeader,
      groupLeader2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentGroupDtoImplCopyWith<_$StudentGroupDtoImpl> get copyWith =>
      __$$StudentGroupDtoImplCopyWithImpl<_$StudentGroupDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentGroupDtoImplToJson(
      this,
    );
  }
}

abstract class _StudentGroupDto implements StudentGroupDto {
  const factory _StudentGroupDto(
      {final List<int>? id,
      final int? course,
      final int? number,
      final int? subGroupNumber,
      final GroupLeaderDto? curator,
      final GroupLeaderDto? groupLeader,
      final GroupLeaderDto? groupLeader2}) = _$StudentGroupDtoImpl;

  factory _StudentGroupDto.fromJson(Map<String, dynamic> json) =
      _$StudentGroupDtoImpl.fromJson;

  @override
  List<int>? get id;
  @override
  int? get course;
  @override
  int? get number;
  @override
  int? get subGroupNumber;
  @override
  GroupLeaderDto? get curator;
  @override
  GroupLeaderDto? get groupLeader;
  @override
  GroupLeaderDto? get groupLeader2;
  @override
  @JsonKey(ignore: true)
  _$$StudentGroupDtoImplCopyWith<_$StudentGroupDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
