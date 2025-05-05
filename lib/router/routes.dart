abstract class Routes {
  static const home = '/student';

  static const noNetwork = '/noNetworkScreen';
  static const auth = 'authScreen';

  static const profile = 'profileScreen';
  static const profileTab = 'profile-tab';

  static const showcaseTab = 'showcase-tab';
  static const showcase = 'showcaseScreen';
  static const newDetail = 'newDetailScreen';
  static const allNews = 'allNewsScreen';

  static const timeTableTab = 'timetable-tab';
  static const timeTable = 'timeTableScreen';
  static const timeTableSubject = 'timeTableSubjectScreen';
  static const timeTableExam = 'timeTableExamScreen';
  static const timeTableRetake = 'timeTableRetakeScreen';

  static const career = 'careerScreen';
  static const careerTab = 'career-tab';
  static const portfolio = '/portfolio';

  static const politic = '/PoliticScreen';
}

abstract class TeacherRoutes {
  static const home = '/teacher';

  static const teacherProfileTab = 'teacher-profile-tab';
  static const teacherJournalProfileTab = 'teacher-journal-tab';
  static const teacherTimetableProfileTab = 'teacher-timetable-tab';
  static const teacherShowcaseProfileTab = 'teacher-showcase-tab';

  static const showcase = 'showcaseScreen';
  static const timetable = 'timeTableScreen';
  static const journal = 'journalScreen';
  static const profile = 'profileScreen';
  static const attendance = 'attendanceScreen';
  static const subjectGrades = 'subjectGradesScreen';
}
