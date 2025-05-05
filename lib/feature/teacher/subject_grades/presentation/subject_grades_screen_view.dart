import 'dart:async';
import 'dart:math';

import 'package:fkn/domain/teacher/subject_marks/allowed_mark.dart';
import 'package:fkn/feature/teacher/subject_grades/presentation/subject_grades_screen_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/subject_grades_utils.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:measure_size/measure_size.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'components/student_grades.dart';

class SubjectGradesScreenView extends StatelessWidget {
  const SubjectGradesScreenView({
    super.key,
    required this.lessonName,
    required this.title,
    required this.markType,
  });

  final String lessonName;
  final String title;

  final String markType;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final presenter = context.read<SubjectGradesScreenPresenter>();
    final hideKeyboard = MediaQuery.of(context).viewInsets.bottom == 0;

    final safeAreaHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            presenter.openHorizontalScroll();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Image.asset(
                    'assets/image/teacher_timetable.png',
                    height: height * 0.20 + safeAreaHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: safeAreaHeight,
                    height: height * 0.125,
                    left: 16,
                    right: 16,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: presenter.goToBack,
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppColor.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: AppTypography.semiBold20.copyWith(
                                  fontSize: 24,
                                  color: AppColor.white,
                                  height: 1.28,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                top: height * 0.15 + safeAreaHeight,
                child: Container(
                  key: Keys.gradesPage,
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: StreamBuilder(
                    stream: presenter.subjectGradesManager.subjectGrades,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final students = snapshot.data?.students ?? [];
                      final allowedMarks = snapshot.data?.allowedMarks ?? [];
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              lessonName,
                              style: AppTypography.medium16.copyWith(color: AppColor.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                markType,
                                style: AppTypography.normal14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          if (allowedMarks.isNotEmpty)
                            _Attestation(
                              allowedMarks: allowedMarks,
                              groupController: presenter.groupController,
                            ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          if (students.isNotEmpty)
                            Expanded(
                              child: _StudentGrades(),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              StreamBuilder(
                stream: presenter.assignedGradesStream,
                builder: (context, snapshot) {
                  final assignedGrades = snapshot.data ?? [];
                  return Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Visibility(
                      visible: hideKeyboard && assignedGrades.isNotEmpty,
                      child: Container(
                        color: AppColor.white,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: OutlinedButton(
                          onPressed: presenter.saveStudentGrades,
                          child: const Center(
                            child: Text(
                              'Сохранить',
                              style: TextStyle(color: AppColor.newBlue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Attestation extends StatefulWidget {
  const _Attestation({
    required this.groupController,
    required this.allowedMarks,
  });

  final LinkedScrollControllerGroup groupController;
  final List<AllowedMark> allowedMarks;

  @override
  State<_Attestation> createState() => _AttestationState();
}

class _AttestationState extends State<_Attestation> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = widget.groupController.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<SubjectGradesScreenPresenter>();
    final marks = widget.allowedMarks;
    double? firstElementHeight;
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...marks.mapIndexed((index, e) {
          return StreamBuilder(
            stream: presenter.selectedGradeStream,
            builder: (context, snapshot) {
              final mark = marks[index];
              final selected = presenter.isSelectedAllowedMark(mark);
              return GestureDetector(
                onTap: () => presenter.setSelectedGrade(mark),
                child: MeasureSize(
                  onChange: (size ) {
                    if (index == 0){
                      firstElementHeight = size.height;
                    }
                  },
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 90,
                      maxHeight: 180,
                    ),
                    child: Container(
                      key: Keys.attName,

                      decoration: BoxDecoration(
                        color: selected ? AppColor.subjectColor : AppColor.inactive,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: max(32.6 * scaleFactor + 16, 68),
                      height: firstElementHeight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(
                              child: Text(
                                mark.title ?? '',
                                style: AppTypography.normal14.copyWith(
                                  color: selected ? AppColor.white : AppColor.black,
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                mark.subtitle ?? '',
                                style: AppTypography.semiBold26.copyWith(
                                  color: selected ? AppColor.white : AppColor.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList()
      ]),
    );
  }
}

class _StudentGrades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = context.read<SubjectGradesScreenPresenter>();

    return StreamBuilder(
      stream: presenter.studentGradesStream,
      builder: (context, snapshot) {
        final students = snapshot.data;
        if (!snapshot.hasData || students == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomScrollView(
          key: Keys.attList,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == students.length) {
                    return const SizedBox(height: 70);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _StudentInfo(
                        student: students[index],
                      ),
                      const Divider(
                        height: 1,
                        color: AppColor.gray,
                      ),
                      _StudentsMarks(
                        groupController: presenter.groupController,
                        studentMark: students[index].grades,
                      ),
                    ],
                  );
                },
                childCount: students.length + 1,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StudentInfo extends StatelessWidget {
  const _StudentInfo({required this.student});

  final StudentGrades student;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key: Keys.gradesName,
            student.fullName,
            style: AppTypography.medium18.copyWith(
              color: AppColor.black,
            ),
          ),
          if (student.avgBall != null)
            Text(
              'ср. взвеш ${student.avgBall}',
              style: AppTypography.medium18.copyWith(
                color: AppColor.grey,
              ),
            ),
        ],
      ),
    );
  }
}

class _StudentsMarks extends StatefulWidget {
  const _StudentsMarks({
    required this.groupController,
    required this.studentMark,
  });

  final LinkedScrollControllerGroup groupController;
  final List<ModifiableMark> studentMark;

  @override
  State<_StudentsMarks> createState() => _StudentsMarksState();
}

class _StudentsMarksState extends State<_StudentsMarks> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = widget.groupController.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<SubjectGradesScreenPresenter>();

    return SizedBox(
      height: 50,
      child: ListView.builder(
        key: Keys.attPerson,
        itemCount: widget.studentMark.length,
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final mark = widget.studentMark[index];
          final scaleFactor = MediaQuery.textScaleFactorOf(context);
          return SizedBox(
            width: max(32.6 * scaleFactor + 16, 68),
            child: _StudentMark(
              studentMark: mark,
              index: index,
              changeValue: presenter.changeStudentGrade,
            ),
          );
        },
      ),
    );
  }
}

class _StudentMark extends StatefulWidget {
  const _StudentMark({
    required this.studentMark,
    required this.index,
    required this.changeValue,
  });

  final ModifiableMark studentMark;
  final int index;
  final Function(ModifiableMark, String) changeValue;

  @override
  State<_StudentMark> createState() => _StudentMarkState();
}

class _StudentMarkState extends State<_StudentMark> with AutomaticKeepAliveClientMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _markFocus = FocusNode();
  final BehaviorSubject<Color> _colorStream = BehaviorSubject();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _controller.text = widget.studentMark.initialMark;
    _setInitialColor();
    _controller.addListener(_markListener);
    _markFocus.addListener(_focusListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_markListener);
    _markFocus.removeListener(_focusListener);
    _controller.clear();
    _markFocus.dispose();
    super.dispose();
  }

  void _markListener() {
    _colorStream.value = getColorByMark(
      mark: widget.studentMark,
      value: _controller.text,
      index: widget.index,
    );
  }

  void _focusListener() {
    if (!_markFocus.hasFocus) {
      widget.changeValue(widget.studentMark, _controller.text);
    }
  }

  void _setInitialColor() {
    _colorStream.value = getColorByMark(
      mark: widget.studentMark,
      value: _controller.text,
      index: widget.index,
      initial: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<SubjectGradesScreenPresenter>();

    return StreamBuilder(
      stream: presenter.selectedGradeStream,
      builder: (context, snapshot) {
        final selected = presenter.isSelectedMark(widget.studentMark);
        final maxValue = getMaxValue(widget.studentMark);
        return StreamBuilder(
          stream: _colorStream,
          builder: (context, colorSnapshot) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (widget.studentMark.canEdit) {
                  presenter.hideHorizontalScroll();
                  Timer(
                    const Duration(milliseconds: 100),
                    () {
                      _markFocus.requestFocus();
                    },
                  );
                }
              },
              child: StreamBuilder(
                stream: presenter.horizontalScrollStream,
                builder: (context, snapshot) {
                  final ignoring = snapshot.data ?? true;
                  return AbsorbPointer(
                    absorbing: ignoring,
                    child: TextField(
                      key: Keys.inAtt,
                      focusNode: _markFocus,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      controller: _controller,
                      autofocus: false,
                      style: AppTypography.medium18,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColor.black,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp("[0-9]"),
                        ),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          if (newValue.text.isEmpty) {
                            return newValue;
                          }
                          final value = int.parse(newValue.text);
                          // очень хочется написать нормально но я не шарю в регулярках (
                          final zeroValue = newValue.text.startsWith('0') && newValue.text.length > 1;
                          if (value <= maxValue && !zeroValue) {
                            return newValue;
                          }
                          return oldValue;
                        }),
                      ],
                      readOnly: !(widget.studentMark.canEdit),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.zero,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.zero,
                        ),
                        fillColor: selected ? AppColor.selectedGradeColor : colorSnapshot.data,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
