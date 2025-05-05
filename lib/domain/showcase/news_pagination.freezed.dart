// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsPagination {
  int? get count => throw _privateConstructorUsedError;
  List<FacultyNews>? get results => throw _privateConstructorUsedError;
  int? get next => throw _privateConstructorUsedError;
  int? get previous => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsPaginationCopyWith<NewsPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsPaginationCopyWith<$Res> {
  factory $NewsPaginationCopyWith(
          NewsPagination value, $Res Function(NewsPagination) then) =
      _$NewsPaginationCopyWithImpl<$Res, NewsPagination>;
  @useResult
  $Res call({int? count, List<FacultyNews>? results, int? next, int? previous});
}

/// @nodoc
class _$NewsPaginationCopyWithImpl<$Res, $Val extends NewsPagination>
    implements $NewsPaginationCopyWith<$Res> {
  _$NewsPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? results = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<FacultyNews>?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsPaginationImplCopyWith<$Res>
    implements $NewsPaginationCopyWith<$Res> {
  factory _$$NewsPaginationImplCopyWith(_$NewsPaginationImpl value,
          $Res Function(_$NewsPaginationImpl) then) =
      __$$NewsPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, List<FacultyNews>? results, int? next, int? previous});
}

/// @nodoc
class __$$NewsPaginationImplCopyWithImpl<$Res>
    extends _$NewsPaginationCopyWithImpl<$Res, _$NewsPaginationImpl>
    implements _$$NewsPaginationImplCopyWith<$Res> {
  __$$NewsPaginationImplCopyWithImpl(
      _$NewsPaginationImpl _value, $Res Function(_$NewsPaginationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? results = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$NewsPaginationImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<FacultyNews>?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$NewsPaginationImpl implements _NewsPagination {
  _$NewsPaginationImpl(
      {this.count, final List<FacultyNews>? results, this.next, this.previous})
      : _results = results;

  @override
  final int? count;
  final List<FacultyNews>? _results;
  @override
  List<FacultyNews>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? next;
  @override
  final int? previous;

  @override
  String toString() {
    return 'NewsPagination(count: $count, results: $results, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsPaginationImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count,
      const DeepCollectionEquality().hash(_results), next, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsPaginationImplCopyWith<_$NewsPaginationImpl> get copyWith =>
      __$$NewsPaginationImplCopyWithImpl<_$NewsPaginationImpl>(
          this, _$identity);
}

abstract class _NewsPagination implements NewsPagination {
  factory _NewsPagination(
      {final int? count,
      final List<FacultyNews>? results,
      final int? next,
      final int? previous}) = _$NewsPaginationImpl;

  @override
  int? get count;
  @override
  List<FacultyNews>? get results;
  @override
  int? get next;
  @override
  int? get previous;
  @override
  @JsonKey(ignore: true)
  _$$NewsPaginationImplCopyWith<_$NewsPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
