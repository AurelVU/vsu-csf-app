// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty_news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FacultyNews {
  List<String?>? get picture => throw _privateConstructorUsedError;
  List<TextDetail>? get text => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get index => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FacultyNewsCopyWith<FacultyNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacultyNewsCopyWith<$Res> {
  factory $FacultyNewsCopyWith(
          FacultyNews value, $Res Function(FacultyNews) then) =
      _$FacultyNewsCopyWithImpl<$Res, FacultyNews>;
  @useResult
  $Res call(
      {List<String?>? picture,
      List<TextDetail>? text,
      String? title,
      String? date,
      String? index,
      String? link,
      String? type});
}

/// @nodoc
class _$FacultyNewsCopyWithImpl<$Res, $Val extends FacultyNews>
    implements $FacultyNewsCopyWith<$Res> {
  _$FacultyNewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = freezed,
    Object? text = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? index = freezed,
    Object? link = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as List<TextDetail>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$FacultyNewsImplCopyWith<$Res>
    implements $FacultyNewsCopyWith<$Res> {
  factory _$$FacultyNewsImplCopyWith(
          _$FacultyNewsImpl value, $Res Function(_$FacultyNewsImpl) then) =
      __$$FacultyNewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String?>? picture,
      List<TextDetail>? text,
      String? title,
      String? date,
      String? index,
      String? link,
      String? type});
}

/// @nodoc
class __$$FacultyNewsImplCopyWithImpl<$Res>
    extends _$FacultyNewsCopyWithImpl<$Res, _$FacultyNewsImpl>
    implements _$$FacultyNewsImplCopyWith<$Res> {
  __$$FacultyNewsImplCopyWithImpl(
      _$FacultyNewsImpl _value, $Res Function(_$FacultyNewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = freezed,
    Object? text = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? index = freezed,
    Object? link = freezed,
    Object? type = freezed,
  }) {
    return _then(_$FacultyNewsImpl(
      picture: freezed == picture
          ? _value._picture
          : picture // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      text: freezed == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as List<TextDetail>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$FacultyNewsImpl implements _FacultyNews {
  _$FacultyNewsImpl(
      {final List<String?>? picture,
      final List<TextDetail>? text,
      this.title,
      this.date,
      this.index,
      this.link,
      this.type})
      : _picture = picture,
        _text = text;

  final List<String?>? _picture;
  @override
  List<String?>? get picture {
    final value = _picture;
    if (value == null) return null;
    if (_picture is EqualUnmodifiableListView) return _picture;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TextDetail>? _text;
  @override
  List<TextDetail>? get text {
    final value = _text;
    if (value == null) return null;
    if (_text is EqualUnmodifiableListView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? title;
  @override
  final String? date;
  @override
  final String? index;
  @override
  final String? link;
  @override
  final String? type;

  @override
  String toString() {
    return 'FacultyNews(picture: $picture, text: $text, title: $title, date: $date, index: $index, link: $link, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacultyNewsImpl &&
            const DeepCollectionEquality().equals(other._picture, _picture) &&
            const DeepCollectionEquality().equals(other._text, _text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_picture),
      const DeepCollectionEquality().hash(_text),
      title,
      date,
      index,
      link,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacultyNewsImplCopyWith<_$FacultyNewsImpl> get copyWith =>
      __$$FacultyNewsImplCopyWithImpl<_$FacultyNewsImpl>(this, _$identity);
}

abstract class _FacultyNews implements FacultyNews {
  factory _FacultyNews(
      {final List<String?>? picture,
      final List<TextDetail>? text,
      final String? title,
      final String? date,
      final String? index,
      final String? link,
      final String? type}) = _$FacultyNewsImpl;

  @override
  List<String?>? get picture;
  @override
  List<TextDetail>? get text;
  @override
  String? get title;
  @override
  String? get date;
  @override
  String? get index;
  @override
  String? get link;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$FacultyNewsImplCopyWith<_$FacultyNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
