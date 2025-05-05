// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allowed_mark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllowedMark {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get markId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllowedMarkCopyWith<AllowedMark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllowedMarkCopyWith<$Res> {
  factory $AllowedMarkCopyWith(
          AllowedMark value, $Res Function(AllowedMark) then) =
      _$AllowedMarkCopyWithImpl<$Res, AllowedMark>;
  @useResult
  $Res call({String? title, String? subtitle, String? markId});
}

/// @nodoc
class _$AllowedMarkCopyWithImpl<$Res, $Val extends AllowedMark>
    implements $AllowedMarkCopyWith<$Res> {
  _$AllowedMarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? markId = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      markId: freezed == markId
          ? _value.markId
          : markId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllowedMarkImplCopyWith<$Res>
    implements $AllowedMarkCopyWith<$Res> {
  factory _$$AllowedMarkImplCopyWith(
          _$AllowedMarkImpl value, $Res Function(_$AllowedMarkImpl) then) =
      __$$AllowedMarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? subtitle, String? markId});
}

/// @nodoc
class __$$AllowedMarkImplCopyWithImpl<$Res>
    extends _$AllowedMarkCopyWithImpl<$Res, _$AllowedMarkImpl>
    implements _$$AllowedMarkImplCopyWith<$Res> {
  __$$AllowedMarkImplCopyWithImpl(
      _$AllowedMarkImpl _value, $Res Function(_$AllowedMarkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? markId = freezed,
  }) {
    return _then(_$AllowedMarkImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      markId: freezed == markId
          ? _value.markId
          : markId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AllowedMarkImpl implements _AllowedMark {
  _$AllowedMarkImpl({this.title, this.subtitle, this.markId});

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? markId;

  @override
  String toString() {
    return 'AllowedMark(title: $title, subtitle: $subtitle, markId: $markId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllowedMarkImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.markId, markId) || other.markId == markId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, markId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllowedMarkImplCopyWith<_$AllowedMarkImpl> get copyWith =>
      __$$AllowedMarkImplCopyWithImpl<_$AllowedMarkImpl>(this, _$identity);
}

abstract class _AllowedMark implements AllowedMark {
  factory _AllowedMark(
      {final String? title,
      final String? subtitle,
      final String? markId}) = _$AllowedMarkImpl;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get markId;
  @override
  @JsonKey(ignore: true)
  _$$AllowedMarkImplCopyWith<_$AllowedMarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
