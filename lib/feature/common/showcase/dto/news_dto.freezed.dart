// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) {
  return _NewsDto.fromJson(json);
}

/// @nodoc
mixin _$NewsDto {
  List<TextDetailDto>? get text => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  List<String>? get pictures => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsDtoCopyWith<NewsDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDtoCopyWith<$Res> {
  factory $NewsDtoCopyWith(NewsDto value, $Res Function(NewsDto) then) =
      _$NewsDtoCopyWithImpl<$Res, NewsDto>;
  @useResult
  $Res call(
      {List<TextDetailDto>? text,
      String? title,
      DateTime? date,
      List<String>? pictures,
      String? link,
      String? type});
}

/// @nodoc
class _$NewsDtoCopyWithImpl<$Res, $Val extends NewsDto>
    implements $NewsDtoCopyWith<$Res> {
  _$NewsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? pictures = freezed,
    Object? link = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as List<TextDetailDto>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pictures: freezed == pictures
          ? _value.pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDtoImplCopyWith<$Res> implements $NewsDtoCopyWith<$Res> {
  factory _$$NewsDtoImplCopyWith(
          _$NewsDtoImpl value, $Res Function(_$NewsDtoImpl) then) =
      __$$NewsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TextDetailDto>? text,
      String? title,
      DateTime? date,
      List<String>? pictures,
      String? link,
      String? type});
}

/// @nodoc
class __$$NewsDtoImplCopyWithImpl<$Res>
    extends _$NewsDtoCopyWithImpl<$Res, _$NewsDtoImpl>
    implements _$$NewsDtoImplCopyWith<$Res> {
  __$$NewsDtoImplCopyWithImpl(
      _$NewsDtoImpl _value, $Res Function(_$NewsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? pictures = freezed,
    Object? link = freezed,
    Object? type = freezed,
  }) {
    return _then(_$NewsDtoImpl(
      text: freezed == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as List<TextDetailDto>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pictures: freezed == pictures
          ? _value._pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
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
class _$NewsDtoImpl implements _NewsDto {
  const _$NewsDtoImpl(
      {final List<TextDetailDto>? text,
      this.title,
      this.date,
      final List<String>? pictures,
      this.link,
      this.type})
      : _text = text,
        _pictures = pictures;

  factory _$NewsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsDtoImplFromJson(json);

  final List<TextDetailDto>? _text;
  @override
  List<TextDetailDto>? get text {
    final value = _text;
    if (value == null) return null;
    if (_text is EqualUnmodifiableListView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? title;
  @override
  final DateTime? date;
  final List<String>? _pictures;
  @override
  List<String>? get pictures {
    final value = _pictures;
    if (value == null) return null;
    if (_pictures is EqualUnmodifiableListView) return _pictures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? link;
  @override
  final String? type;

  @override
  String toString() {
    return 'NewsDto(text: $text, title: $title, date: $date, pictures: $pictures, link: $link, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDtoImpl &&
            const DeepCollectionEquality().equals(other._text, _text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._pictures, _pictures) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_text),
      title,
      date,
      const DeepCollectionEquality().hash(_pictures),
      link,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDtoImplCopyWith<_$NewsDtoImpl> get copyWith =>
      __$$NewsDtoImplCopyWithImpl<_$NewsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsDtoImplToJson(
      this,
    );
  }
}

abstract class _NewsDto implements NewsDto {
  const factory _NewsDto(
      {final List<TextDetailDto>? text,
      final String? title,
      final DateTime? date,
      final List<String>? pictures,
      final String? link,
      final String? type}) = _$NewsDtoImpl;

  factory _NewsDto.fromJson(Map<String, dynamic> json) = _$NewsDtoImpl.fromJson;

  @override
  List<TextDetailDto>? get text;
  @override
  String? get title;
  @override
  DateTime? get date;
  @override
  List<String>? get pictures;
  @override
  String? get link;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$NewsDtoImplCopyWith<_$NewsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
