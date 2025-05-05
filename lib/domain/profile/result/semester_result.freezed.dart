// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semester_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SemesterResult {
  List<SubjectResult>? get results => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SemesterResultCopyWith<SemesterResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SemesterResultCopyWith<$Res> {
  factory $SemesterResultCopyWith(
          SemesterResult value, $Res Function(SemesterResult) then) =
      _$SemesterResultCopyWithImpl<$Res, SemesterResult>;
  @useResult
  $Res call({List<SubjectResult>? results, int? number, String? year});
}

/// @nodoc
class _$SemesterResultCopyWithImpl<$Res, $Val extends SemesterResult>
    implements $SemesterResultCopyWith<$Res> {
  _$SemesterResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? number = freezed,
    Object? year = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SubjectResult>?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SemesterResultImplCopyWith<$Res>
    implements $SemesterResultCopyWith<$Res> {
  factory _$$SemesterResultImplCopyWith(_$SemesterResultImpl value,
          $Res Function(_$SemesterResultImpl) then) =
      __$$SemesterResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SubjectResult>? results, int? number, String? year});
}

/// @nodoc
class __$$SemesterResultImplCopyWithImpl<$Res>
    extends _$SemesterResultCopyWithImpl<$Res, _$SemesterResultImpl>
    implements _$$SemesterResultImplCopyWith<$Res> {
  __$$SemesterResultImplCopyWithImpl(
      _$SemesterResultImpl _value, $Res Function(_$SemesterResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? number = freezed,
    Object? year = freezed,
  }) {
    return _then(_$SemesterResultImpl(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SubjectResult>?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SemesterResultImpl implements _SemesterResult {
  _$SemesterResultImpl(
      {final List<SubjectResult>? results, this.number, this.year})
      : _results = results;

  final List<SubjectResult>? _results;
  @override
  List<SubjectResult>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? number;
  @override
  final String? year;

  @override
  String toString() {
    return 'SemesterResult(results: $results, number: $number, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SemesterResultImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), number, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SemesterResultImplCopyWith<_$SemesterResultImpl> get copyWith =>
      __$$SemesterResultImplCopyWithImpl<_$SemesterResultImpl>(
          this, _$identity);
}

abstract class _SemesterResult implements SemesterResult {
  factory _SemesterResult(
      {final List<SubjectResult>? results,
      final int? number,
      final String? year}) = _$SemesterResultImpl;

  @override
  List<SubjectResult>? get results;
  @override
  int? get number;
  @override
  String? get year;
  @override
  @JsonKey(ignore: true)
  _$$SemesterResultImplCopyWith<_$SemesterResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
