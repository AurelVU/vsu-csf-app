// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_journal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AttendanceJournalDtoToJson(
    AttendanceJournalDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('students', instance.students);
  writeNotNull('dates', instance.dates);
  writeNotNull('attendances', instance.attendances);
  return val;
}

_$AttendanceJournalDtoImpl _$$AttendanceJournalDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceJournalDtoImpl(
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => AttendanceStudentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: (json['dates'] as List<dynamic>?)
          ?.map((e) => AttendanceDateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      attendances: (json['attendances'] as List<dynamic>?)
          ?.map((e) => AttendanceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AttendanceJournalDtoImplToJson(
        _$AttendanceJournalDtoImpl instance) =>
    <String, dynamic>{
      'students': instance.students,
      'dates': instance.dates,
      'attendances': instance.attendances,
    };
