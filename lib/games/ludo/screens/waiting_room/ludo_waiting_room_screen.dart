import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/ludo/components/cut_edge_container.dart';

class LudoWaitingRoomScreen extends ConsumerStatefulWidget {
  const LudoWaitingRoomScreen({super.key});

  @override
  ConsumerState<LudoWaitingRoomScreen> createState() =>
      _LudoWaitingRoomScreenState();
}

class _LudoWaitingRoomScreenState extends ConsumerState<LudoWaitingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _waitingRoomTopBar(),
          const SizedBox(height: 59),
          _roomID(),
          const SizedBox(height: 20),
          _starkTonMenu(),
          const SizedBox(height: 32),
          _players(),
          const SizedBox(height: 20),
          _playesrDetailsList(),
          const Spacer(),
          _bottom(),
          const SizedBox(height: 62),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {},
        disabledColor: Colors.grey,
        icon: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Center(
              child: SvgPicture.asset("assets/svg/ludo_elevated_button.svg"),
            ),
            const Center(
              child: Text(
                'Waiting for players',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _playesrDetailsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _playersDetails(
            Colors.yellow,
            'https://s3-alpha-sig.figma.com/img/4f51/1832/f2c9ae301cd29cb69c6ba2968aa76f38?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fw5Ahe0upvgZcRomM-jzqHFoemcqSqtRD5nR6mFKjM36eXTn0NaqljRL35fITwm0bqgJQa5vLBWXlB0CYLCjbdBuCaPwaESwUN1BnACsCohspGh0Me~vmqXQM1VUvkfWIWOAdDB2jDA3YZixrxWqtTQECd1u-EgF4hBZvGsHCevsRIm9439YOT6K-LcQRJ0GaK2c9w6VVi45oaXNtGfddupM-w45NJ2PUf2XyAVHQfU5JxY4BnbOkEoyFqnpYVLsGrMYcMI86BM39Teyi-UOJR4aMXqpXhVB7sBRwYzPnudv9ryGkEtvw0mwWO8puWMuY8o3zKtHqaMwEA~hb7hrnA__',
            'Mehdi',
          ),
          _playersDetails(
            const Color(0XFF00ECFF).withOpacity(0.7),
            'https://s3-alpha-sig.figma.com/img/f2bc/272a/66ad1598b5cc5135feae7ce65a57e738?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=A3RJZPmc-mZzgEOOpl8fErS~bWzvd1CKi2dKriFEqfG66Wbb8fxgEk7hFlF6NOqOQim1yAjxCswAh64uguieKZJdKovNzb3apyGZx6~6-LwEZ75deQhrZjgWCFXkeNWN4VhxEoFwhSg72O5KKg~HvgdXggWi62MtQILbYHiB9Q-vHGsSugkiqv1yPGfHDhZmAyFT-2oRBQmsUyzCSmwWzw0X1vz5~dtwYCkvsIg~JyEydmbqUfwa-7rgmLcFpaixc0Qh9rLs-GP-xiS6qhjQx8Oaw87MKLjTXg7IL26qqlHGOFVbUxvMJW7K~l1Me9ZLgPxqgMgjQk64mSu4BUxGAA__',
            'Jupeng',
          ),
          _playersDetails(
            const Color.fromARGB(255, 200, 115, 215),
            'https://s3-alpha-sig.figma.com/img/aee3/aeb8/522a3f80f40cb42a16f5be572eee19ef?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j90L0Wdq8CuA-fZcwiyAhBTnrlqvZUFvQUdcGUsKx-ejq7805HOYJUeJKbixH86yf4D1V6JNgM3M72c2k9Xuj~aGg3T-S15wGAGRsG8C6KgDvDQL5kk10C3bYRolSiKkdHkzUKLYdTQt9hGoxV3Xw4MSlNyqLCG1uSwI1RSWEkyYD2~Q-XKvZAOGH9X44rHrGWG~a7jeeSWp7xiMZbdy~G80bhQ3RVCc8Sqk7JMhfuqhSMViv09HFOWXYYGqkuLjbtTYz~mfnNHajP38SCoePvExZJ41QucncJqRDEacivY6X~EwHLgfh1FXqjaSwR~MOjTeYgPs5uZU8y2O5rPGbw__',
            'Vy123...',
          ),
          _invitePlayer()
        ],
      ),
    );
  }

  Widget _playersDetails(Color color, String image, String name) {
    return Column(
      children: [
        Container(
          height: 73,
          width: 73,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: const Color(0XFF00ECFF),
              ),
              color: color),
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl: image,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _invitePlayer() {
    return Column(
      children: [
        Container(
          height: 73,
          width: 73,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
              color: const Color(0XFF00ECFF),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'assets/svg/invite.svg',
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 25,
          width: 74,
          decoration: BoxDecoration(
              color: const Color(0XFF00ECFF),
              borderRadius: BorderRadius.circular(5)),
          child: const Center(
            child: Text(
              'Invite',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _players() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25,
            width: 110,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0XFF00ECFF).withOpacity(0.6),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Players',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: const Color(0XFF00ECFF),
          ),
        ],
      ),
    );
  }

  Widget _starkTonMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _starkTokens(
            "Play Amount",
            "100",
            Colors.black,
          ),
          _starkTokens(
            "Total Prize",
            "400",
            const Color(0XFF00ECFF).withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _starkTokens(String text, String amount, Color color) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0XFF00ECFF),
            ),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/starknet.svg'),
              const SizedBox(width: 5),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _roomID() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            "Room ID",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 30,
          width: 97,
          color: Colors.grey.withOpacity(0.3),
          child: const Center(
            child: Text(
              "A028",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _waitingRoomTopBar() {
    return Column(
      children: [
        const SizedBox(height: 103),
        Padding(
          padding: const EdgeInsets.only(left: 27, right: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "wAITING ROOM",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset('assets/svg/card.svg'),
                  const Positioned(
                    left: 8,
                    child: Text(
                      "MENU",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const CutEdgesContainer(),
      ],
    );
  }
}
