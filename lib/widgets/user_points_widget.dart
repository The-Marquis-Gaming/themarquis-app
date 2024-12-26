import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/dialog/auth_dialog.dart';
import 'package:marquis_v2/widgets/ui_widgets.dart';

import '../providers/user.dart';
import 'gradient_separator.dart';

class UserPointsWidget extends ConsumerStatefulWidget {
  const UserPointsWidget({super.key});

  @override
  ConsumerState<UserPointsWidget> createState() => _UserPointsWidgetState();
}

class _UserPointsWidgetState extends ConsumerState<UserPointsWidget> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return GestureDetector(
      onTap: user == null
          ? () {
              showDialog(context: context, useRootNavigator: false, builder: (c) => const AuthDialog());
            }
          : () {
              //go to profile page
            },
      child: Row(
        children: [
          user == null
              ? const Icon(
                  Icons.person,
                  size: 25,
                )
              : const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(
                    'assets/images/avatar.png',
                  ), // Add your avatar image in assets folder
                  backgroundColor: Colors.transparent,
                ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user == null ? "LOGIN" : user.email.split("@").first,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
              ),
              user == null
                  ? Container()
                  : Row(
                      children: [
                        SizedBox(
                          width: 12,
                          child: Image.asset('assets/images/member.png'),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${user.points.toString()} Pts.',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          horizontalSpace(8.0),
          user == null ? Container() : const GradientSeparator(),
        ],
      ),
    );
  }
}
