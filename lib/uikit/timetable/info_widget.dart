
import 'package:fkn/uikit/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/subjects.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.isOverlayShow,
    required this.groupsString,
  });

  final BehaviorSubject<bool> isOverlayShow;
  final String groupsString;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: isOverlayShow,
        builder: (context, snapshot) {
          return PortalTarget(
            visible: isOverlayShow.value,
            anchor: const Aligned(
              follower: Alignment.topCenter,
              target: Alignment.centerRight,
              offset: Offset(0, 10),
            ),
            portalFollower: TapRegion(
              onTapInside: (_) {
                isOverlayShow.value = !isOverlayShow.value;
              },
              onTapOutside: (_) {
                isOverlayShow.value = false;
              },
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200,
                  minHeight: 40,
                  maxHeight: 300,
                ),
                child: CardContainer(
                  borderRadius: 6,
                  useShadow: true,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(groupsString),
                  ),
                ),
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/svg/group_info.svg',
              ),
              onPressed: () {
                if (isOverlayShow.value == false) {
                  isOverlayShow.value = true;
                }
              },
            ),
          );
        });
  }
}