import 'package:fkn/domain/timetable/subject.dart';
import 'package:fkn/feature/student/timetable/presentation/components/custom_vertical_stepper.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectInfoCard extends StatefulWidget {
  final bool enableAttandanceMark;

  const SubjectInfoCard({
    super.key,
    required this.subject,
    required this.color,
    this.isExam = false,
    this.enableAttandanceMark = true,
  });

  final Subject subject;
  final Color color;
  final bool isExam;

  @override
  State<SubjectInfoCard> createState() => _SubjectInfoCardState();
}

class _SubjectInfoCardState extends State<SubjectInfoCard> {
  @override
  Widget build(BuildContext context) {
    final presenter = context.read<TimeTableScreenPresenter>();
    return StreamBuilder(
        stream: presenter.timetableManager.nextSubjectStream,
        builder: (context, snapshot) {
          final nextSubject = snapshot.data;
          // Для тестирования. Ниже боевая версия
          // final isNow = true;
          final isNow = ((widget.subject == nextSubject?.subject &&
                      isDateEqual(DateTime.now(),
                          presenter.selectedDateStream.valueOrNull)) &&
                  nextSubject?.status == 'Сейчас идет') ||
              widget.isExam;
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CustomVerticalStep(
                    color: AppColor.subjectColor,
                    isComingNow: isNow,
                  ),
                ),
                SizedBox(
                  width: widget.isExam ? 16 : 12,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      key: Keys.subjectInfoCardContainer,
                      decoration: BoxDecoration(
                        color: isNow ? widget.color : AppColor.appBar,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: widget.isExam
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.subject.name ?? '',
                                  textAlign: TextAlign.left,
                                  style: AppTypography.medium14.copyWith(
                                    color:
                                        isNow ? AppColor.white : AppColor.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${widget.subject.startTime?.trim()}\n${widget.subject.finishTime?.trim() ?? ''}',
                                style: AppTypography.normal14.copyWith(
                                  color:
                                      isNow ? AppColor.white : AppColor.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: widget.isExam
                                      ? EdgeInsets.zero
                                      : const EdgeInsets.only(
                                          top: 16.0,
                                          right: 20,
                                        ),
                                  child: Text(
                                    widget.subject.teacher ?? '',
                                    style: AppTypography.normal14.copyWith(
                                      color: isNow
                                          ? AppColor.white
                                          : AppColor.black,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                widget.subject.isDistant == true
                                    ? 'ДО'
                                    : widget.subject.classroom?.isEmpty == true
                                        ? ''
                                        : 'к.${widget.subject.classroom}',
                                style: AppTypography.normal14.copyWith(
                                  color:
                                      isNow ? AppColor.white : AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
