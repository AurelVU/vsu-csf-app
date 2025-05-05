// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttendanceJournal {
  List<AttendanceStudent>? get students => throw _privateConstructorUsedError;
  List<AttendanceDate>? get dates => throw _privateConstructorUsedError;
  List<Attendance>? get attendances => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceJournalCopyWith<AttendanceJournal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceJournalCopyWith<$Res> {
  factory $AttendanceJournalCopyWith(
          AttendanceJournal value, $Res Function(AttendanceJournal) then) =
      _$AttendanceJournalCopyWithImpl<$Res, AttendanceJournal>;
  @useResult
  $Res call(
      {List<AttendanceStudent>? students,
      List<AttendanceDate>? dates,
      List<Attendance>? attendances});
}

/// @nodoc
class _$AttendanceJournalCopyWithImpl<$Res, $Val extends AttendanceJournal>
    implements $AttendanceJournalCopyWith<$Res> {
  _$AttendanceJournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = freezed,
    Object? dates = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_value.copyWith(
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<AttendanceStudent>?,
      dates: freezed == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDate>?,
      attendances: freezed == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceJournalImplCopyWith<$Res>
    implements $AttendanceJournalCopyWith<$Res> {
  factory _$$AttendanceJournalImplCopyWith(_$AttendanceJournalImpl value,
          $Res Function(_$AttendanceJournalImpl) then) =
      __$$AttendanceJournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AttendanceStudent>? students,
      List<AttendanceDate>? dates,
      List<Attendance>? attendances});
}

/// @nodoc
class __$$AttendanceJournalImplCopyWithImpl<$Res>
    extends _$AttendanceJournalCopyWithImpl<$Res, _$AttendanceJournalImpl>
    implements _$$AttendanceJournalImplCopyWith<$Res> {
  __$$AttendanceJournalImplCopyWithImpl(_$AttendanceJournalImpl _value,
      $Res Function(_$AttendanceJournalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = freezed,
    Object? dates = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_$AttendanceJournalImpl(
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<AttendanceStudent>?,
      dates: freezed == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDate>?,
      attendances: freezed == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>?,
    ));
  }
}

/// @nodoc

class _$AttendanceJournalImpl implements _AttendanceJournal {
  _$AttendanceJournalImpl(
      {final List<AttendanceStudent>? students,
      final List<AttendanceDate>? dates,
      final List<Attendance>? attendances})
      : _students = students,
        _dates = dates,
        _attendances = attendances;

  final List<AttendanceStudent>? _students;
  @override
  List<AttendanceStudent>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AttendanceDate>? _dates;
  @override
  List<AttendanceDate>? get dates {
    final value = _dates;
    if (value == null) return null;
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Attendance>? _attendances;
  @override
  List<Attendance>? get attendances {
    final value = _attendances;
    if (value == null) return null;
    if (_attendances is EqualUnmodifiableListView) return _attendances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AttendanceJournal(students: $students, dates: $dates, attendances: $attendances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceJournalImpl &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality()
                .equals(other._attendances, _attendances));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_attendances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceJournalImplCopyWith<_$AttendanceJournalImpl> get copyWith =>
      __$$AttendanceJournalImplCopyWithImpl<_$AttendanceJournalImpl>(
          this, _$identity);
}

abstract class _AttendanceJournal implements AttendanceJournal {
  factory _AttendanceJournal(
      {final List<AttendanceStudent>? students,
      final List<AttendanceDate>? dates,
      final List<Attendance>? attendances}) = _$AttendanceJournalImpl;

  @override
  List<AttendanceStudent>? get students;
  @override
  List<AttendanceDate>? get dates;
  @override
  List<Attendance>? get attendances;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceJournalImplCopyWith<_$AttendanceJournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
