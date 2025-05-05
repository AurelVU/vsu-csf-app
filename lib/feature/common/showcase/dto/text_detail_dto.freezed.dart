// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextDetailDto _$TextDetailDtoFromJson(Map<String, dynamic> json) {
  return _TextDetailDto.fromJson(json);
}

/// @nodoc
mixin _$TextDetailDto {
  String? get link => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextDetailDtoCopyWith<TextDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextDetailDtoCopyWith<$Res> {
  factory $TextDetailDtoCopyWith(
          TextDetailDto value, $Res Function(TextDetailDto) then) =
      _$TextDetailDtoCopyWithImpl<$Res, TextDetailDto>;
  @useResult
  $Res call({String? link, String? text, String? type});
}

/// @nodoc
class _$TextDetailDtoCopyWithImpl<$Res, $Val extends TextDetailDto>
    implements $TextDetailDtoCopyWith<$Res> {
  _$TextDetailDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$TextDetailDtoImplCopyWith<$Res>
    implements $TextDetailDtoCopyWith<$Res> {
  factory _$$TextDetailDtoImplCopyWith(
          _$TextDetailDtoImpl value, $Res Function(_$TextDetailDtoImpl) then) =
      __$$TextDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? link, String? text, String? type});
}

/// @nodoc
class __$$TextDetailDtoImplCopyWithImpl<$Res>
    extends _$TextDetailDtoCopyWithImpl<$Res, _$TextDetailDtoImpl>
    implements _$$TextDetailDtoImplCopyWith<$Res> {
  __$$TextDetailDtoImplCopyWithImpl(
      _$TextDetailDtoImpl _value, $Res Function(_$TextDetailDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? text = freezed,
    Object? type = freezed,
  }) {
    return _then(_$TextDetailDtoImpl(
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
@JsonSerializable()
class _$TextDetailDtoImpl implements _TextDetailDto {
  const _$TextDetailDtoImpl({this.link, this.text, this.type});

  factory _$TextDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextDetailDtoImplFromJson(json);

  @override
  final String? link;
  @override
  final String? text;
  @override
  final String? type;

  @override
  String toString() {
    return 'TextDetailDto(link: $link, text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextDetailDtoImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, link, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextDetailDtoImplCopyWith<_$TextDetailDtoImpl> get copyWith =>
      __$$TextDetailDtoImplCopyWithImpl<_$TextDetailDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _TextDetailDto implements TextDetailDto {
  const factory _TextDetailDto(
      {final String? link,
      final String? text,
      final String? type}) = _$TextDetailDtoImpl;

  factory _TextDetailDto.fromJson(Map<String, dynamic> json) =
      _$TextDetailDtoImpl.fromJson;

  @override
  String? get link;
  @override
  String? get text;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$TextDetailDtoImplCopyWith<_$TextDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
