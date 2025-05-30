// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserData {
  String? get userId => throw _privateConstructorUsedError;
  String? get studentCard => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get group => throw _privateConstructorUsedError;
  int? get subGroup => throw _privateConstructorUsedError;
  int? get course => throw _privateConstructorUsedError;
  List<SemesterResult>? get results => throw _privateConstructorUsedError;
  bool? get acceptPolitics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String? userId,
      String? studentCard,
      String? name,
      int? group,
      int? subGroup,
      int? course,
      List<SemesterResult>? results,
      bool? acceptPolitics});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? studentCard = freezed,
    Object? name = freezed,
    Object? group = freezed,
    Object? subGroup = freezed,
    Object? course = freezed,
    Object? results = freezed,
    Object? acceptPolitics = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCard: freezed == studentCard
          ? _value.studentCard
          : studentCard // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      subGroup: freezed == subGroup
          ? _value.subGroup
          : subGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SemesterResult>?,
      acceptPolitics: freezed == acceptPolitics
          ? _value.acceptPolitics
          : acceptPolitics // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? studentCard,
      String? name,
      int? group,
      int? subGroup,
      int? course,
      List<SemesterResult>? results,
      bool? acceptPolitics});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? studentCard = freezed,
    Object? name = freezed,
    Object? group = freezed,
    Object? subGroup = freezed,
    Object? course = freezed,
    Object? results = freezed,
    Object? acceptPolitics = freezed,
  }) {
    return _then(_$UserDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCard: freezed == studentCard
          ? _value.studentCard
          : studentCard // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      subGroup: freezed == subGroup
          ? _value.subGroup
          : subGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SemesterResult>?,
      acceptPolitics: freezed == acceptPolitics
          ? _value.acceptPolitics
          : acceptPolitics // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$UserDataImpl implements _UserData {
  _$UserDataImpl(
      {this.userId,
      this.studentCard,
      this.name,
      this.group,
      this.subGroup,
      this.course,
      final List<SemesterResult>? results,
      this.acceptPolitics})
      : _results = results;

  @override
  final String? userId;
  @override
  final String? studentCard;
  @override
  final String? name;
  @override
  final int? group;
  @override
  final int? subGroup;
  @override
  final int? course;
  final List<SemesterResult>? _results;
  @override
  List<SemesterResult>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? acceptPolitics;

  @override
  String toString() {
    return 'UserData(userId: $userId, studentCard: $studentCard, name: $name, group: $group, subGroup: $subGroup, course: $course, results: $results, acceptPolitics: $acceptPolitics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.studentCard, studentCard) ||
                other.studentCard == studentCard) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.subGroup, subGroup) ||
                other.subGroup == subGroup) &&
            (identical(other.course, course) || other.course == course) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.acceptPolitics, acceptPolitics) ||
                other.acceptPolitics == acceptPolitics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      studentCard,
      name,
      group,
      subGroup,
      course,
      const DeepCollectionEquality().hash(_results),
      acceptPolitics);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);
}

abstract class _UserData implements UserData {
  factory _UserData(
      {final String? userId,
      final String? studentCard,
      final String? name,
      final int? group,
      final int? subGroup,
      final int? course,
      final List<SemesterResult>? results,
      final bool? acceptPolitics}) = _$UserDataImpl;

  @override
  String? get userId;
  @override
  String? get studentCard;
  @override
  String? get name;
  @override
  int? get group;
  @override
  int? get subGroup;
  @override
  int? get course;
  @override
  List<SemesterResult>? get results;
  @override
  bool? get acceptPolitics;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
