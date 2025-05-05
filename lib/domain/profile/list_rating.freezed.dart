// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListRating _$ListRatingFromJson(Map<String, dynamic> json) {
  return _ListRating.fromJson(json);
}

/// @nodoc
mixin _$ListRating {
  String? get name => throw _privateConstructorUsedError;
  List<AnonymousRating>? get ratings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListRatingCopyWith<ListRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListRatingCopyWith<$Res> {
  factory $ListRatingCopyWith(
          ListRating value, $Res Function(ListRating) then) =
      _$ListRatingCopyWithImpl<$Res, ListRating>;
  @useResult
  $Res call({String? name, List<AnonymousRating>? ratings});
}

/// @nodoc
class _$ListRatingCopyWithImpl<$Res, $Val extends ListRating>
    implements $ListRatingCopyWith<$Res> {
  _$ListRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? ratings = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<AnonymousRating>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListRatingImplCopyWith<$Res>
    implements $ListRatingCopyWith<$Res> {
  factory _$$ListRatingImplCopyWith(
          _$ListRatingImpl value, $Res Function(_$ListRatingImpl) then) =
      __$$ListRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, List<AnonymousRating>? ratings});
}

/// @nodoc
class __$$ListRatingImplCopyWithImpl<$Res>
    extends _$ListRatingCopyWithImpl<$Res, _$ListRatingImpl>
    implements _$$ListRatingImplCopyWith<$Res> {
  __$$ListRatingImplCopyWithImpl(
      _$ListRatingImpl _value, $Res Function(_$ListRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? ratings = freezed,
  }) {
    return _then(_$ListRatingImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value._ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<AnonymousRating>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListRatingImpl implements _ListRating {
  _$ListRatingImpl({this.name, final List<AnonymousRating>? ratings})
      : _ratings = ratings;

  factory _$ListRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListRatingImplFromJson(json);

  @override
  final String? name;
  final List<AnonymousRating>? _ratings;
  @override
  List<AnonymousRating>? get ratings {
    final value = _ratings;
    if (value == null) return null;
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListRating(name: $name, ratings: $ratings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListRatingImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._ratings, _ratings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_ratings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListRatingImplCopyWith<_$ListRatingImpl> get copyWith =>
      __$$ListRatingImplCopyWithImpl<_$ListRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListRatingImplToJson(
      this,
    );
  }
}

abstract class _ListRating implements ListRating {
  factory _ListRating(
      {final String? name,
      final List<AnonymousRating>? ratings}) = _$ListRatingImpl;

  factory _ListRating.fromJson(Map<String, dynamic> json) =
      _$ListRatingImpl.fromJson;

  @override
  String? get name;
  @override
  List<AnonymousRating>? get ratings;
  @override
  @JsonKey(ignore: true)
  _$$ListRatingImplCopyWith<_$ListRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
