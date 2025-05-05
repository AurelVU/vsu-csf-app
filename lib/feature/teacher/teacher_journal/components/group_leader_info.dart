import 'package:fkn/domain/teacher/timetable/group_leader.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupLeaderInfo extends StatelessWidget {
  const GroupLeaderInfo({
    super.key,
    required this.title,
    required this.groupLeader,
  });

  final String title;
  final GroupLeader? groupLeader;

  @override
  Widget build(BuildContext context) {
    final fullName = createFullName(
        groupLeader?.firstName, groupLeader?.middleName, groupLeader?.lastName);
    final email = groupLeader?.email ?? '';
    final phone = groupLeader?.phone ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(

              child: Text(
                title,
                style: AppTypography.medium16.copyWith(
                  color: AppColor.newBlue,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            if (fullName.isNotEmpty)
              Flexible(
                flex: 2,
                child: Text(
                  fullName,
                  style: AppTypography.semiBold16,
                  textAlign: TextAlign.right,
                ),
              ),
          ],
        ),
        if (phone.isNotEmpty) ...[
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              // Android
              final url = Uri(scheme: 'tel', host: '+$phone');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                // iOS
                final url = Uri(scheme: 'tel', host: '00$phone');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              }
            },
            child: Text(
              phone,
              style: AppTypography.semiBold16.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
        if (email.isNotEmpty) ...[
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: email,
              );
              launchUrl(emailLaunchUri);
            },
            child: Text(
              email,
              style: AppTypography.semiBold16.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
