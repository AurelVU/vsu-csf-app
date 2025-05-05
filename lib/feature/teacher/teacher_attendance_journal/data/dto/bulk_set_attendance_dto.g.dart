// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_set_attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$BulkSetAttendanceDtoToJson(
    BulkSetAttendanceDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dates', instance.dates);
  writeNotNull('attendances', instance.attendances);
  return val;
}

_$BulkSetAttendanceDtoImpl _$$BulkSetAttendanceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BulkSetAttendanceDtoImpl(
      dates: json['dates'] == null
          ? null
          : AttendanceDateDto.fromJson(json['dates'] as Map<String, dynamic>),
      attendances: (json['attendances'] as List<dynamic>?)
          ?.map((e) => AttendanceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BulkSetAttendanceDtoImplToJson(
        _$BulkSetAttendanceDtoImpl instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'attendances': instance.attendances,
    };
