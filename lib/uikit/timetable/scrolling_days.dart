import 'package:fkn/feature/student/timetable/presentation/components/week_day_card.dart';
import 'package:fkn/utils/custom_collection.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:measure_size/measure_size.dart';
import 'package:rxdart/rxdart.dart';

class ScrollingDays extends StatelessWidget {
  const ScrollingDays({
    super.key,
    required this.itemBgColor,
    required this.itemTextColor,
    required this.selectedItemBgColor,
    required this.selectedItemTextColor,
    this.onTap,
    required this.dates,
    required this.selectedDate,
    required this.controller,
    this.pageAnimatedController,
    this.onCardCreate,
  });

  final Color itemBgColor;
  final Color itemTextColor;
  final Color selectedItemBgColor;
  final Color selectedItemTextColor;


  /// колбек при нажатии на карточку дня
  final Function(DateTime)? onTap;

  /// колбек для получения размера первой карточки
  /// необходим для корректной работы скролла
  final Function(Size)? onCardCreate;

  /// даты, по которым строится весь список карточек
  final List<DateTime>? dates;

  /// выбранная дата
  final DateTime? selectedDate;

  final ScrollController controller;

  final BehaviorSubject<double?>? pageAnimatedController;

  @override
  Widget build(BuildContext context) {
    if (dates == null || dates?.isEmpty == true) {
      return const SizedBox(
        height: 88,
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 16.0),
      child: IntrinsicHeight(
        child: Row(
            children: mapIndexed(dates ?? <DateTime>[], (index, day) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: StreamBuilder<double?>(
                stream: pageAnimatedController,
                builder: (context, snapshot) {
                  final currentPage = (pageAnimatedController?.valueOrNull ?? 0);
                  final pageOffset = currentPage - index;
                  final offset = pageOffset > 1 || pageOffset < -1 ? 1.0 : pageOffset;
                  final month = getMonth(day);
                  if (index == 0 && onCardCreate != null) {
                    return MeasureSize(
                      onChange: onCardCreate!,
                      child: AnimatedWeekDayCard(
                        month: month,
                        onTap: onTap,
                        selectedItemBgColor: selectedItemBgColor,
                        itemBgColor: itemBgColor,
                        offset: offset,
                        selectedItemTextColor: selectedItemTextColor,
                        itemTextColor: itemTextColor,
                        day: day,
                      ),
                    );
                  }
                  return AnimatedWeekDayCard(
                    month: month,
                    onTap: onTap,
                    selectedItemBgColor: selectedItemBgColor,
                    itemBgColor: itemBgColor,
                    offset: offset,
                    selectedItemTextColor: selectedItemTextColor,
                    itemTextColor: itemTextColor,
                    day: day,
                  );
                }),
          );
        }).toList()),
      ),
    );
  }
}

class AnimatedWeekDayCard extends StatelessWidget {
  const AnimatedWeekDayCard({
    super.key,
    required this.month,
    required this.onTap,
    required this.selectedItemBgColor,
    required this.itemBgColor,
    required this.offset,
    required this.selectedItemTextColor,
    required this.itemTextColor,
    required this.day,
  });

  final DateTime day;
  final String month;
  final Function(DateTime p1)? onTap;
  final Color selectedItemBgColor;
  final Color itemBgColor;
  final double offset;
  final Color selectedItemTextColor;
  final Color itemTextColor;

  @override
  Widget build(BuildContext context) {
    return WeekDayCard(
      number: day.day.toString(),
      month: month,
      dayOfWeek: day.weekday.getDayByWeekNumber(),
      onTap: () {
        final callback = onTap;
        if (callback != null) {
          callback(day);
        }
      },
      itemBgColor: Color.lerp(
        selectedItemBgColor,
        itemBgColor,
        offset.abs(),
      ),
      itemTextColor: Color.lerp(
        selectedItemTextColor,
        itemTextColor,
        offset.abs(),
      ),
    );
  }
}
