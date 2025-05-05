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

AllowedMarkDto _$AllowedMarkDtoFromJson(Map<String, dynamic> json) {
  return _AllowedMarkDto.fromJson(json);
}

/// @nodoc
mixin _$AllowedMarkDto {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'mark_id')
  String? get markId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllowedMarkDtoCopyWith<AllowedMarkDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllowedMarkDtoCopyWith<$Res> {
  factory $AllowedMarkDtoCopyWith(
          AllowedMarkDto value, $Res Function(AllowedMarkDto) then) =
      _$AllowedMarkDtoCopyWithImpl<$Res, AllowedMarkDto>;
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      @JsonKey(name: 'mark_id') String? markId});
}

/// @nodoc
class _$AllowedMarkDtoCopyWithImpl<$Res, $Val extends AllowedMarkDto>
    implements $AllowedMarkDtoCopyWith<$Res> {
  _$AllowedMarkDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$AllowedMarkDtoImplCopyWith<$Res>
    implements $AllowedMarkDtoCopyWith<$Res> {
  factory _$$AllowedMarkDtoImplCopyWith(_$AllowedMarkDtoImpl value,
          $Res Function(_$AllowedMarkDtoImpl) then) =
      __$$AllowedMarkDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      @JsonKey(name: 'mark_id') String? markId});
}

/// @nodoc
class __$$AllowedMarkDtoImplCopyWithImpl<$Res>
    extends _$AllowedMarkDtoCopyWithImpl<$Res, _$AllowedMarkDtoImpl>
    implements _$$AllowedMarkDtoImplCopyWith<$Res> {
  __$$AllowedMarkDtoImplCopyWithImpl(
      _$AllowedMarkDtoImpl _value, $Res Function(_$AllowedMarkDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? markId = freezed,
  }) {
    return _then(_$AllowedMarkDtoImpl(
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
@JsonSerializable()
class _$AllowedMarkDtoImpl implements _AllowedMarkDto {
  const _$AllowedMarkDtoImpl(
      {this.title, this.subtitle, @JsonKey(name: 'mark_id') this.markId});

  factory _$AllowedMarkDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllowedMarkDtoImplFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  @JsonKey(name: 'mark_id')
  final String? markId;

  @override
  String toString() {
    return 'AllowedMarkDto(title: $title, subtitle: $subtitle, markId: $markId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllowedMarkDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.markId, markId) || other.markId == markId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, markId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllowedMarkDtoImplCopyWith<_$AllowedMarkDtoImpl> get copyWith =>
      __$$AllowedMarkDtoImplCopyWithImpl<_$AllowedMarkDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllowedMarkDtoImplToJson(
      this,
    );
  }
}

abstract class _AllowedMarkDto implements AllowedMarkDto {
  const factory _AllowedMarkDto(
      {final String? title,
      final String? subtitle,
      @JsonKey(name: 'mark_id') final String? markId}) = _$AllowedMarkDtoImpl;

  factory _AllowedMarkDto.fromJson(Map<String, dynamic> json) =
      _$AllowedMarkDtoImpl.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  @JsonKey(name: 'mark_id')
  String? get markId;
  @override
  @JsonKey(ignore: true)
  _$$AllowedMarkDtoImplCopyWith<_$AllowedMarkDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
