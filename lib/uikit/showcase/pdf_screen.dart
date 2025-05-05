import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class PdfScreen extends StatelessWidget {
  const PdfScreen({
    super.key,
    required this.facultyNews,
  });

  final FacultyNews facultyNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        facultyNews.link ?? '',
      ),
    );
  }
}
