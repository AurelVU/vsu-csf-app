// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Subject {
  String? get startTime => throw _privateConstructorUsedError;
  String? get finishTime => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get classroom => throw _privateConstructorUsedError;
  String? get teacher => throw _privateConstructorUsedError;
  bool? get isDistant => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call(
      {String? startTime,
      String? finishTime,
      String? name,
      String? classroom,
      String? teacher,
      bool? isDistant,
      int? id});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? finishTime = freezed,
    Object? name = freezed,
    Object? classroom = freezed,
    Object? teacher = freezed,
    Object? isDistant = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      finishTime: freezed == finishTime
          ? _value.finishTime
          : finishTime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      isDistant: freezed == isDistant
          ? _value.isDistant
          : isDistant // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
          _$SubjectImpl value, $Res Function(_$SubjectImpl) then) =
      __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? startTime,
      String? finishTime,
      String? name,
      String? classroom,
      String? teacher,
      bool? isDistant,
      int? id});
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
      _$SubjectImpl _value, $Res Function(_$SubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? finishTime = freezed,
    Object? name = freezed,
    Object? classroom = freezed,
    Object? teacher = freezed,
    Object? isDistant = freezed,
    Object? id = freezed,
  }) {
    return _then(_$SubjectImpl(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      finishTime: freezed == finishTime
          ? _value.finishTime
          : finishTime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      isDistant: freezed == isDistant
          ? _value.isDistant
          : isDistant // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SubjectImpl implements _Subject {
  _$SubjectImpl(
      {this.startTime,
      this.finishTime,
      this.name,
      this.classroom,
      this.teacher,
      this.isDistant,
      this.id});

  @override
  final String? startTime;
  @override
  final String? finishTime;
  @override
  final String? name;
  @override
  final String? classroom;
  @override
  final String? teacher;
  @override
  final bool? isDistant;
  @override
  final int? id;

  @override
  String toString() {
    return 'Subject(startTime: $startTime, finishTime: $finishTime, name: $name, classroom: $classroom, teacher: $teacher, isDistant: $isDistant, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.finishTime, finishTime) ||
                other.finishTime == finishTime) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.isDistant, isDistant) ||
                other.isDistant == isDistant) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, finishTime, name,
      classroom, teacher, isDistant, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);
}

abstract class _Subject implements Subject {
  factory _Subject(
      {final String? startTime,
      final String? finishTime,
      final String? name,
      final String? classroom,
      final String? teacher,
      final bool? isDistant,
      final int? id}) = _$SubjectImpl;

  @override
  String? get startTime;
  @override
  String? get finishTime;
  @override
  String? get name;
  @override
  String? get classroom;
  @override
  String? get teacher;
  @override
  bool? get isDistant;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
