import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/dialog/auth_dialog.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/widgets/ui_widgets.dart';

class LockedGameWidget extends ConsumerStatefulWidget {
  const LockedGameWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.showIconButton = false,
  });

  final String title, subTitle, image;
  final bool showIconButton;

  @override
  ConsumerState<LockedGameWidget> createState() => LockedGameWidgetState();
}

class LockedGameWidgetState extends ConsumerState<LockedGameWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.fitWidth,
                  width: 78,
                ),
              ),
              horizontalSpace(16.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.subTitle,
                    style: const TextStyle(fontSize: 10, color: Color(0xff868686)),
                  ),
                ],
              ),
            ],
          ),
          widget.showIconButton
              ? IconButton(
                  onPressed: () {
                    if (!ref.read(appStateProvider).isAuth) {
                      showDialog(context: context,useRootNavigator: false, builder: (ctx) => const AuthDialog());
                      return;
                    }
                    ref.read(appStateProvider.notifier).selectGame("checkers");
                  },
                  icon: const Icon(Icons.arrow_forward, size: 32),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withAlpha(100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
