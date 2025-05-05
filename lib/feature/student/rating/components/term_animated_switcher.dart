import 'package:fkn/domain/profile/result/semester_result.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../../../../startup/app_typography.dart';

class TermAnimatedSwitcher extends StatelessWidget {
  const TermAnimatedSwitcher({
    super.key,
    this.pageAnimatedController,
    required this.scrollController,
    required this.onTap,
    required this.firstColor,
    required this.secondColor,
    required this.results,
  });

  final BehaviorSubject<double?>? pageAnimatedController;
  final ScrollController scrollController;
  final ValueSetter<int> onTap;
  final Color firstColor;
  final Color secondColor;
  final List<SemesterResult> results;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          final semester = results[index];
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: StreamBuilder<double?>(
                stream: pageAnimatedController,
                builder: (context, snapshot) {
                  final currentPage = pageAnimatedController?.valueOrNull ?? 0;
                  final pageOffset = currentPage - index;
                  final offset =
                      pageOffset > 1 || pageOffset < -1 ? 1.0 : pageOffset;
                  print(offset);
                  return Container(
                    key: Keys.allSemester,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color.lerp(
                        secondColor,
                        firstColor,
                        offset.abs(),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Text(
                          '${semester.number} семестр',
                          style: AppTypography.medium14.copyWith(
                            color: Color.lerp(
                              firstColor,
                              secondColor,
                              // AppColor.pinkText,
                              // AppColor.white,
                              offset.abs(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
        itemCount: results.length ?? 0,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
