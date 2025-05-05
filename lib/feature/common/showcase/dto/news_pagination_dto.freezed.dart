// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_pagination_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsPaginationDto _$NewsPaginationDtoFromJson(Map<String, dynamic> json) {
  return _NewsPaginationDto.fromJson(json);
}

/// @nodoc
mixin _$NewsPaginationDto {
  int? get count => throw _privateConstructorUsedError;
  List<NewsDto>? get results => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsPaginationDtoCopyWith<NewsPaginationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsPaginationDtoCopyWith<$Res> {
  factory $NewsPaginationDtoCopyWith(
          NewsPaginationDto value, $Res Function(NewsPaginationDto) then) =
      _$NewsPaginationDtoCopyWithImpl<$Res, NewsPaginationDto>;
  @useResult
  $Res call(
      {int? count,
      List<NewsDto>? results,
      String? description,
      String? next,
      String? previous});
}

/// @nodoc
class _$NewsPaginationDtoCopyWithImpl<$Res, $Val extends NewsPaginationDto>
    implements $NewsPaginationDtoCopyWith<$Res> {
  _$NewsPaginationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? results = freezed,
    Object? description = freezed,
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
              as List<NewsDto>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsPaginationDtoImplCopyWith<$Res>
    implements $NewsPaginationDtoCopyWith<$Res> {
  factory _$$NewsPaginationDtoImplCopyWith(_$NewsPaginationDtoImpl value,
          $Res Function(_$NewsPaginationDtoImpl) then) =
      __$$NewsPaginationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      List<NewsDto>? results,
      String? description,
      String? next,
      String? previous});
}

/// @nodoc
class __$$NewsPaginationDtoImplCopyWithImpl<$Res>
    extends _$NewsPaginationDtoCopyWithImpl<$Res, _$NewsPaginationDtoImpl>
    implements _$$NewsPaginationDtoImplCopyWith<$Res> {
  __$$NewsPaginationDtoImplCopyWithImpl(_$NewsPaginationDtoImpl _value,
      $Res Function(_$NewsPaginationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? results = freezed,
    Object? description = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$NewsPaginationDtoImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NewsDto>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsPaginationDtoImpl implements _NewsPaginationDto {
  _$NewsPaginationDtoImpl(
      {this.count,
      final List<NewsDto>? results,
      this.description,
      this.next,
      this.previous})
      : _results = results;

  factory _$NewsPaginationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsPaginationDtoImplFromJson(json);

  @override
  final int? count;
  final List<NewsDto>? _results;
  @override
  List<NewsDto>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  @override
  final String? next;
  @override
  final String? previous;

  @override
  String toString() {
    return 'NewsPaginationDto(count: $count, results: $results, description: $description, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsPaginationDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      count,
      const DeepCollectionEquality().hash(_results),
      description,
      next,
      previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsPaginationDtoImplCopyWith<_$NewsPaginationDtoImpl> get copyWith =>
      __$$NewsPaginationDtoImplCopyWithImpl<_$NewsPaginationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsPaginationDtoImplToJson(
      this,
    );
  }
}

abstract class _NewsPaginationDto implements NewsPaginationDto {
  factory _NewsPaginationDto(
      {final int? count,
      final List<NewsDto>? results,
      final String? description,
      final String? next,
      final String? previous}) = _$NewsPaginationDtoImpl;

  factory _NewsPaginationDto.fromJson(Map<String, dynamic> json) =
      _$NewsPaginationDtoImpl.fromJson;

  @override
  int? get count;
  @override
  List<NewsDto>? get results;
  @override
  String? get description;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(ignore: true)
  _$$NewsPaginationDtoImplCopyWith<_$NewsPaginationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
