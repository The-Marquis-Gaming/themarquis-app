import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/services/snackbar_service.dart';

class ReferralField extends StatelessWidget {
  const ReferralField({super.key, required this.label, required this.value});

  final String label, value;
  @override
  Widget build(BuildContext context) {
    final snackBarService = SnackbarService();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                '$label    $value',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: value));
                snackBarService.displaySnackbar('Copied to clipboard');
              },
              child: SvgPicture.asset('assets/svg/copy_icon.svg')),
        ],
      ),
    );
  }
}
