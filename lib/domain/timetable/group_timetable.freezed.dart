// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DayTimetable {
  DateTime? get dateTimetable => throw _privateConstructorUsedError;
  List<Subject>? get subjects => throw _privateConstructorUsedError;
  bool? get numerator => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayTimetableCopyWith<DayTimetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayTimetableCopyWith<$Res> {
  factory $DayTimetableCopyWith(
          DayTimetable value, $Res Function(DayTimetable) then) =
      _$DayTimetableCopyWithImpl<$Res, DayTimetable>;
  @useResult
  $Res call(
      {DateTime? dateTimetable, List<Subject>? subjects, bool? numerator});
}

/// @nodoc
class _$DayTimetableCopyWithImpl<$Res, $Val extends DayTimetable>
    implements $DayTimetableCopyWith<$Res> {
  _$DayTimetableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTimetable = freezed,
    Object? subjects = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_value.copyWith(
      dateTimetable: freezed == dateTimetable
          ? _value.dateTimetable
          : dateTimetable // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subjects: freezed == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayTimetableImplCopyWith<$Res>
    implements $DayTimetableCopyWith<$Res> {
  factory _$$DayTimetableImplCopyWith(
          _$DayTimetableImpl value, $Res Function(_$DayTimetableImpl) then) =
      __$$DayTimetableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dateTimetable, List<Subject>? subjects, bool? numerator});
}

/// @nodoc
class __$$DayTimetableImplCopyWithImpl<$Res>
    extends _$DayTimetableCopyWithImpl<$Res, _$DayTimetableImpl>
    implements _$$DayTimetableImplCopyWith<$Res> {
  __$$DayTimetableImplCopyWithImpl(
      _$DayTimetableImpl _value, $Res Function(_$DayTimetableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTimetable = freezed,
    Object? subjects = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_$DayTimetableImpl(
      dateTimetable: freezed == dateTimetable
          ? _value.dateTimetable
          : dateTimetable // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subjects: freezed == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$DayTimetableImpl implements _DayTimetable {
  _$DayTimetableImpl(
      {this.dateTimetable, final List<Subject>? subjects, this.numerator})
      : _subjects = subjects;

  @override
  final DateTime? dateTimetable;
  final List<Subject>? _subjects;
  @override
  List<Subject>? get subjects {
    final value = _subjects;
    if (value == null) return null;
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? numerator;

  @override
  String toString() {
    return 'DayTimetable(dateTimetable: $dateTimetable, subjects: $subjects, numerator: $numerator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayTimetableImpl &&
            (identical(other.dateTimetable, dateTimetable) ||
                other.dateTimetable == dateTimetable) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.numerator, numerator) ||
                other.numerator == numerator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTimetable,
      const DeepCollectionEquality().hash(_subjects), numerator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayTimetableImplCopyWith<_$DayTimetableImpl> get copyWith =>
      __$$DayTimetableImplCopyWithImpl<_$DayTimetableImpl>(this, _$identity);
}

abstract class _DayTimetable implements DayTimetable {
  factory _DayTimetable(
      {final DateTime? dateTimetable,
      final List<Subject>? subjects,
      final bool? numerator}) = _$DayTimetableImpl;

  @override
  DateTime? get dateTimetable;
  @override
  List<Subject>? get subjects;
  @override
  bool? get numerator;
  @override
  @JsonKey(ignore: true)
  _$$DayTimetableImplCopyWith<_$DayTimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
