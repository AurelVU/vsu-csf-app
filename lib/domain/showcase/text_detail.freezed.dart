// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextDetail {
  String? get link => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextDetailCopyWith<TextDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextDetailCopyWith<$Res> {
  factory $TextDetailCopyWith(
          TextDetail value, $Res Function(TextDetail) then) =
      _$TextDetailCopyWithImpl<$Res, TextDetail>;
  @useResult
  $Res call({String? link, String? text, String? type});
}

/// @nodoc
class _$TextDetailCopyWithImpl<$Res, $Val extends TextDetail>
    implements $TextDetailCopyWith<$Res> {
  _$TextDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? text = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextDetailImplCopyWith<$Res>
    implements $TextDetailCopyWith<$Res> {
  factory _$$TextDetailImplCopyWith(
          _$TextDetailImpl value, $Res Function(_$TextDetailImpl) then) =
      __$$TextDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? link, String? text, String? type});
}

/// @nodoc
class __$$TextDetailImplCopyWithImpl<$Res>
    extends _$TextDetailCopyWithImpl<$Res, _$TextDetailImpl>
    implements _$$TextDetailImplCopyWith<$Res> {
  __$$TextDetailImplCopyWithImpl(
      _$TextDetailImpl _value, $Res Function(_$TextDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? text = freezed,
    Object? type = freezed,
  }) {
    return _then(_$TextDetailImpl(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TextDetailImpl implements _TextDetail {
  const _$TextDetailImpl({this.link, this.text, this.type});

  @override
  final String? link;
  @override
  final String? text;
  @override
  final String? type;

  @override
  String toString() {
    return 'TextDetail(link: $link, text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextDetailImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextDetailImplCopyWith<_$TextDetailImpl> get copyWith =>
      __$$TextDetailImplCopyWithImpl<_$TextDetailImpl>(this, _$identity);
}

abstract class _TextDetail implements TextDetail {
  const factory _TextDetail(
      {final String? link,
      final String? text,
      final String? type}) = _$TextDetailImpl;

  @override
  String? get link;
  @override
  String? get text;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$TextDetailImplCopyWith<_$TextDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
