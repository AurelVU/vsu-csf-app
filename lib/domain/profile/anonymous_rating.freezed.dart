// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anonymous_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnonymousRating _$AnonymousRatingFromJson(Map<String, dynamic> json) {
  return _AnonymousRating.fromJson(json);
}

/// @nodoc
mixin _$AnonymousRating {
  String? get name => throw _privateConstructorUsedError;
  int? get place => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_current_user')
  bool? get isCurrentUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnonymousRatingCopyWith<AnonymousRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnonymousRatingCopyWith<$Res> {
  factory $AnonymousRatingCopyWith(
          AnonymousRating value, $Res Function(AnonymousRating) then) =
      _$AnonymousRatingCopyWithImpl<$Res, AnonymousRating>;
  @useResult
  $Res call(
      {String? name,
      int? place,
      String? rating,
      @JsonKey(name: 'is_current_user') bool? isCurrentUser});
}

/// @nodoc
class _$AnonymousRatingCopyWithImpl<$Res, $Val extends AnonymousRating>
    implements $AnonymousRatingCopyWith<$Res> {
  _$AnonymousRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? place = freezed,
    Object? rating = freezed,
    Object? isCurrentUser = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnonymousRatingImplCopyWith<$Res>
    implements $AnonymousRatingCopyWith<$Res> {
  factory _$$AnonymousRatingImplCopyWith(_$AnonymousRatingImpl value,
          $Res Function(_$AnonymousRatingImpl) then) =
      __$$AnonymousRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int? place,
      String? rating,
      @JsonKey(name: 'is_current_user') bool? isCurrentUser});
}

/// @nodoc
class __$$AnonymousRatingImplCopyWithImpl<$Res>
    extends _$AnonymousRatingCopyWithImpl<$Res, _$AnonymousRatingImpl>
    implements _$$AnonymousRatingImplCopyWith<$Res> {
  __$$AnonymousRatingImplCopyWithImpl(
      _$AnonymousRatingImpl _value, $Res Function(_$AnonymousRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? place = freezed,
    Object? rating = freezed,
    Object? isCurrentUser = freezed,
  }) {
    return _then(_$AnonymousRatingImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnonymousRatingImpl implements _AnonymousRating {
  _$AnonymousRatingImpl(
      {this.name,
      this.place,
      this.rating,
      @JsonKey(name: 'is_current_user') this.isCurrentUser});

  factory _$AnonymousRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnonymousRatingImplFromJson(json);

  @override
  final String? name;
  @override
  final int? place;
  @override
  final String? rating;
  @override
  @JsonKey(name: 'is_current_user')
  final bool? isCurrentUser;

  @override
  String toString() {
    return 'AnonymousRating(name: $name, place: $place, rating: $rating, isCurrentUser: $isCurrentUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnonymousRatingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, place, rating, isCurrentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnonymousRatingImplCopyWith<_$AnonymousRatingImpl> get copyWith =>
      __$$AnonymousRatingImplCopyWithImpl<_$AnonymousRatingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnonymousRatingImplToJson(
      this,
    );
  }
}

abstract class _AnonymousRating implements AnonymousRating {
  factory _AnonymousRating(
          {final String? name,
          final int? place,
          final String? rating,
          @JsonKey(name: 'is_current_user') final bool? isCurrentUser}) =
      _$AnonymousRatingImpl;

  factory _AnonymousRating.fromJson(Map<String, dynamic> json) =
      _$AnonymousRatingImpl.fromJson;

  @override
  String? get name;
  @override
  int? get place;
  @override
  String? get rating;
  @override
  @JsonKey(name: 'is_current_user')
  bool? get isCurrentUser;
  @override
  @JsonKey(ignore: true)
  _$$AnonymousRatingImplCopyWith<_$AnonymousRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
