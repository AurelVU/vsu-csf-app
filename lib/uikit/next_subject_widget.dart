import 'package:fkn/domain/showcase/next_subject.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class NextSubjectWidget extends StatelessWidget {
  const NextSubjectWidget({
    super.key,
    this.subject,
    this.padding = const EdgeInsets.all(16.0),
    this.onTap,
  });

  final NextSubject? subject;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final nextSubject = subject;
    if (nextSubject == null) {
      return Container();
    }
    final status = nextSubject.status;
    if (status == null) {
      return Container();
    }
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          key: Keys.nextSubjectWidget,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: status == 'Сейчас идет' ? AppColor.subjectColor : AppColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: status == 'Сейчас идет' ? AppColor.white : AppColor.subjectColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                    child: Text(
                      nextSubject.status ?? '',
                      style: AppTypography.semiBold14.copyWith(
                        color: status == 'Сейчас идет' ? AppColor.black : AppColor.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        nextSubject.subject?.name ?? '',
                        style: AppTypography.medium16.copyWith(
                          color: status == 'Сейчас идет' ? AppColor.white : AppColor.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          (nextSubject.subject?.startTime ?? '').trim(),
                          style: AppTypography.normal14.copyWith(
                            color: status == 'Сейчас идет' ? AppColor.white : AppColor.black,
                          ),
                        ),
                        Text(
                          (nextSubject.subject?.finishTime ?? '').trim(),
                          style: AppTypography.normal14.copyWith(
                            color: status == 'Сейчас идет' ? AppColor.white : AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
