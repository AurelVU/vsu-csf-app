import 'package:fkn/domain/teacher/attendance/attendance.dart';
import 'package:fkn/domain/teacher/attendance/attendance_date.dart';
import 'package:fkn/domain/teacher/attendance/attendance_student.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

typedef MarkStudentCallback = bool Function({
  required String type,
  required Attendance attendance,
  int? studentIndex,
});

class AttendanceModalPopup extends StatefulWidget {
  const AttendanceModalPopup({
    super.key,
    this.students,
    required this.startIndex,
    required this.date,
    required this.markStudentCallback,
  });

  final List<AttendanceStudent>? students;
  final int startIndex;
  final MarkStudentCallback markStudentCallback;
  final AttendanceDate date;

  @override
  State<AttendanceModalPopup> createState() => _AttendanceModalPopupState();
}

class _AttendanceModalPopupState extends State<AttendanceModalPopup> {
  final BehaviorSubject<int> currentStudentIndex = BehaviorSubject();

  @override
  void initState() {
    super.initState();
    currentStudentIndex.value = widget.startIndex;
  }

  @override
  void dispose() {
    currentStudentIndex.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final students = widget.students;
    final date = widget.date;
    final markCallback = widget.markStudentCallback;
    return StreamBuilder<int>(
        stream: currentStudentIndex,
        builder: (context, snapshot) {
          final studentIndex = snapshot.data;
          if (studentIndex == null) {
            return Container();
          }
          final student = students?.elementAtOrNull(studentIndex);
          final fullName =
              createFullName(student?.firstName, '', student?.lastName);
          final mark = Attendance(
            studentId: student?.id,
            lessonNumber: date.lessonNumber,
            date: date.date,
          );
          return CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  fullName,
                  style: AppTypography.bold20.copyWith(
                    color: AppColor.black,
                  ),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  final isNext = markCallback(
                    type: 'П',
                    attendance: mark,
                    studentIndex: studentIndex,
                  );
                  if (!isNext) {
                    Navigator.pop(context);
                  }

                  currentStudentIndex.value = currentStudentIndex.value + 1;
                },
                child: Text(
                  'Присутствует',
                  style: AppTypography.normal20.copyWith(
                    color: AppColor.lightBlue,
                  ),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  final isNext = markCallback(
                    type: 'У',
                    attendance: mark,
                    studentIndex: studentIndex,
                  );
                  if (!isNext) {
                    Navigator.pop(context);
                  }
                  currentStudentIndex.value = currentStudentIndex.value + 1;
                },
                child: Text(
                  'Уважительная причина',
                  style: AppTypography.normal20.copyWith(
                    color: AppColor.lightBlue,
                  ),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  final isNext = markCallback(
                    type: 'Н',
                    attendance: mark,
                    studentIndex: studentIndex,
                  );
                  if (!isNext) {
                    Navigator.pop(context);
                  }

                  currentStudentIndex.value = currentStudentIndex.value + 1;
                },
                child: Text(
                  'Отсутствует',
                  style: AppTypography.normal20.copyWith(
                    color: AppColor.absent,
                  ),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(
                  'Отмена',
                  style: AppTypography.semiBold20.copyWith(
                    color: AppColor.lightBlue,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
