// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentRating _$StudentRatingFromJson(Map<String, dynamic> json) {
  return _StudentRating.fromJson(json);
}

/// @nodoc
mixin _$StudentRating {
  int? get course => throw _privateConstructorUsedError;
  int? get specialty => throw _privateConstructorUsedError;
  int? get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'list_ratings')
  List<ListRating>? get listRatings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentRatingCopyWith<StudentRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentRatingCopyWith<$Res> {
  factory $StudentRatingCopyWith(
          StudentRating value, $Res Function(StudentRating) then) =
      _$StudentRatingCopyWithImpl<$Res, StudentRating>;
  @useResult
  $Res call(
      {int? course,
      int? specialty,
      int? group,
      @JsonKey(name: 'list_ratings') List<ListRating>? listRatings});
}

/// @nodoc
class _$StudentRatingCopyWithImpl<$Res, $Val extends StudentRating>
    implements $StudentRatingCopyWith<$Res> {
  _$StudentRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = freezed,
    Object? specialty = freezed,
    Object? group = freezed,
    Object? listRatings = freezed,
  }) {
    return _then(_value.copyWith(
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      specialty: freezed == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      listRatings: freezed == listRatings
          ? _value.listRatings
          : listRatings // ignore: cast_nullable_to_non_nullable
              as List<ListRating>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentRatingImplCopyWith<$Res>
    implements $StudentRatingCopyWith<$Res> {
  factory _$$StudentRatingImplCopyWith(
          _$StudentRatingImpl value, $Res Function(_$StudentRatingImpl) then) =
      __$$StudentRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? course,
      int? specialty,
      int? group,
      @JsonKey(name: 'list_ratings') List<ListRating>? listRatings});
}

/// @nodoc
class __$$StudentRatingImplCopyWithImpl<$Res>
    extends _$StudentRatingCopyWithImpl<$Res, _$StudentRatingImpl>
    implements _$$StudentRatingImplCopyWith<$Res> {
  __$$StudentRatingImplCopyWithImpl(
      _$StudentRatingImpl _value, $Res Function(_$StudentRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = freezed,
    Object? specialty = freezed,
    Object? group = freezed,
    Object? listRatings = freezed,
  }) {
    return _then(_$StudentRatingImpl(
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      specialty: freezed == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      listRatings: freezed == listRatings
          ? _value._listRatings
          : listRatings // ignore: cast_nullable_to_non_nullable
              as List<ListRating>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentRatingImpl implements _StudentRating {
  _$StudentRatingImpl(
      {this.course,
      this.specialty,
      this.group,
      @JsonKey(name: 'list_ratings') final List<ListRating>? listRatings})
      : _listRatings = listRatings;

  factory _$StudentRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentRatingImplFromJson(json);

  @override
  final int? course;
  @override
  final int? specialty;
  @override
  final int? group;
  final List<ListRating>? _listRatings;
  @override
  @JsonKey(name: 'list_ratings')
  List<ListRating>? get listRatings {
    final value = _listRatings;
    if (value == null) return null;
    if (_listRatings is EqualUnmodifiableListView) return _listRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StudentRating(course: $course, specialty: $specialty, group: $group, listRatings: $listRatings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentRatingImpl &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.group, group) || other.group == group) &&
            const DeepCollectionEquality()
                .equals(other._listRatings, _listRatings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, course, specialty, group,
      const DeepCollectionEquality().hash(_listRatings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentRatingImplCopyWith<_$StudentRatingImpl> get copyWith =>
      __$$StudentRatingImplCopyWithImpl<_$StudentRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentRatingImplToJson(
      this,
    );
  }
}

abstract class _StudentRating implements StudentRating {
  factory _StudentRating(
          {final int? course,
          final int? specialty,
          final int? group,
          @JsonKey(name: 'list_ratings') final List<ListRating>? listRatings}) =
      _$StudentRatingImpl;

  factory _StudentRating.fromJson(Map<String, dynamic> json) =
      _$StudentRatingImpl.fromJson;

  @override
  int? get course;
  @override
  int? get specialty;
  @override
  int? get group;
  @override
  @JsonKey(name: 'list_ratings')
  List<ListRating>? get listRatings;
  @override
  @JsonKey(ignore: true)
  _$$StudentRatingImplCopyWith<_$StudentRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
