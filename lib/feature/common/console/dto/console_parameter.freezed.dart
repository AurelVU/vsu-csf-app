// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'console_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsoleParameter _$ConsoleParameterFromJson(Map<String, dynamic> json) {
  return _ConsoleParameter.fromJson(json);
}

/// @nodoc
mixin _$ConsoleParameter {
  String? get name => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  bool? get enable => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsoleParameterCopyWith<ConsoleParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsoleParameterCopyWith<$Res> {
  factory $ConsoleParameterCopyWith(
          ConsoleParameter value, $Res Function(ConsoleParameter) then) =
      _$ConsoleParameterCopyWithImpl<$Res, ConsoleParameter>;
  @useResult
  $Res call({String? name, String? value, bool? enable, String? comment});
}

/// @nodoc
class _$ConsoleParameterCopyWithImpl<$Res, $Val extends ConsoleParameter>
    implements $ConsoleParameterCopyWith<$Res> {
  _$ConsoleParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? enable = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: freezed == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsoleParameterImplCopyWith<$Res>
    implements $ConsoleParameterCopyWith<$Res> {
  factory _$$ConsoleParameterImplCopyWith(_$ConsoleParameterImpl value,
          $Res Function(_$ConsoleParameterImpl) then) =
      __$$ConsoleParameterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? value, bool? enable, String? comment});
}

/// @nodoc
class __$$ConsoleParameterImplCopyWithImpl<$Res>
    extends _$ConsoleParameterCopyWithImpl<$Res, _$ConsoleParameterImpl>
    implements _$$ConsoleParameterImplCopyWith<$Res> {
  __$$ConsoleParameterImplCopyWithImpl(_$ConsoleParameterImpl _value,
      $Res Function(_$ConsoleParameterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? enable = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$ConsoleParameterImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: freezed == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsoleParameterImpl implements _ConsoleParameter {
  _$ConsoleParameterImpl({this.name, this.value, this.enable, this.comment});

  factory _$ConsoleParameterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsoleParameterImplFromJson(json);

  @override
  final String? name;
  @override
  final String? value;
  @override
  final bool? enable;
  @override
  final String? comment;

  @override
  String toString() {
    return 'ConsoleParameter(name: $name, value: $value, enable: $enable, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsoleParameterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, enable, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsoleParameterImplCopyWith<_$ConsoleParameterImpl> get copyWith =>
      __$$ConsoleParameterImplCopyWithImpl<_$ConsoleParameterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsoleParameterImplToJson(
      this,
    );
  }
}

abstract class _ConsoleParameter implements ConsoleParameter {
  factory _ConsoleParameter(
      {final String? name,
      final String? value,
      final bool? enable,
      final String? comment}) = _$ConsoleParameterImpl;

  factory _ConsoleParameter.fromJson(Map<String, dynamic> json) =
      _$ConsoleParameterImpl.fromJson;

  @override
  String? get name;
  @override
  String? get value;
  @override
  bool? get enable;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$ConsoleParameterImplCopyWith<_$ConsoleParameterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
