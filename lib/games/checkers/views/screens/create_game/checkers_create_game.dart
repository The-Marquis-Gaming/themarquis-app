import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquis_v2/games/checkers/core/game/checkers_game_controller.dart';
import 'package:marquis_v2/games/checkers/views/widgets/checkers_radio.dart';
import 'package:marquis_v2/games/ludo/widgets/chevron_border.dart';
import 'package:marquis_v2/games/ludo/widgets/divider_shape.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/providers/user.dart';

import '../../../../ludo/widgets/vertical_stepper.dart';

class CheckersCreateGame extends ConsumerStatefulWidget {
  final CheckersGameController _gameController;
  @override
  ConsumerState<CheckersCreateGame> createState() => _CheckersCreateGameState();

  const CheckersCreateGame(this._gameController, {super.key});
}

class _CheckersCreateGameState extends ConsumerState<CheckersCreateGame> {
  int _activeTab = 0;
  int? _selectedCharacterIndex;
  double _selectedTokenBalance = 0;
  GameMode? _gameMode;
  String? _selectedTokenAddress;

  final Map<String, String> _supportedTokens = {};
  final _tokenAmountController = TextEditingController();

  double? _selectedTokenAmount;
  final bool _isLoading = false;
  bool _shouldRetrieveBalance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        double scaledHeight(double height) => (height / 717) * constraints.maxHeight;
        return SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 7,
                      top: scaledHeight(40),
                      bottom: scaledHeight(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('CREATE GAME', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white)),
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Container(
                            decoration: ShapeDecoration(color: Colors.white, shape: ChevronBorder()),
                            padding: EdgeInsets.only(top: scaledHeight(1), left: 8, bottom: scaledHeight(1), right: 31),
                            child: const Text('MENU', style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: scaledHeight(10),
                    decoration: const ShapeDecoration(color: Color(0xFFF3B46E), shape: DividerShape(Color(0xFFF3B46E))),
                  ),
                ],
              ),
              SizedBox(height: 31),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: (_activeTab == 2 && _gameMode == GameMode.free) ? 0 : 12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 32,
                            child: (_activeTab == 2 && _gameMode == GameMode.free)
                                ? SizedBox()
                                : (_activeTab == 3 && _gameMode == GameMode.token)
                                    ? const SizedBox()
                                    : VerticalStepper(activeTab: _activeTab, numberOfSteps: _numberOfTabs, activeColor: Color(0xFFF3B46E))),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Container(
                            height: scaledHeight(462),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF21262B),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_activeTab == 0) _selectGame(scaledHeight),
                                if (_activeTab == 1 && _gameMode == GameMode.token) _selectPlayAmount(scaledHeight),
                                if ((_activeTab == 1 && _gameMode == GameMode.free) || _activeTab == 2) _selectCharacter(scaledHeight),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: scaledHeight(20)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    if (_activeTab > 0) ...[
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: Size(
                              double.infinity,
                              43,
                            ),
                            side: const BorderSide(
                              color: Color(0xFFF3B46E),
                            ),
                            foregroundColor: const Color(0xFFF3B46E),
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: _switchToPreviousTab,
                          child: const Text('Back'),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          minimumSize: Size(double.infinity, 43),
                          disabledBackgroundColor: const Color(0xFF32363A),
                          backgroundColor: const Color(0xFFF3B46E),
                          disabledForegroundColor: const Color(0xFF939393),
                          foregroundColor: const Color(0xFF000000),
                          textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        onPressed: _isNextEnabled ? _switchToNextTab : null,
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                (_activeTab == 1 && _gameMode == GameMode.free) || (_activeTab == 2 && _gameMode == GameMode.token) ? 'Create Game' : 'Next',
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }

  Column _selectGame(double Function(double height) scaledHeight) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Select Game Mode', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        SizedBox(width: 12, height: scaledHeight(12)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckersRadio(
              width: 110,
              padding: const EdgeInsets.symmetric(vertical: 5),
              value: GameMode.free,
              globalValue: _gameMode,
              onTap: _selectGameMode,
              selectedBackgroundColor: const Color(0x1200ECFF),
              unSelectedBackgroundColor: Colors.transparent,
              borderColor: const Color(0xFFF3B46E),
              child: const Text(
                'Free',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFF3B46E)),
              ),
            ),
            const SizedBox(width: 8),
            CheckersRadio(
              width: 110,
              padding: const EdgeInsets.symmetric(vertical: 5),
              value: GameMode.token,
              globalValue: _gameMode,
              onTap: _selectGameMode,
              selectedBackgroundColor: const Color(0x1200ECFF),
              unSelectedBackgroundColor: Colors.transparent,
              borderColor: const Color(0xFFF3B46E),
              child: const Text(
                'Token',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFF3B46E)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _selectPlayAmount(double Function(double height) scaledHeight) {
    return FutureBuilder(
      future: _supportedTokens.isEmpty ? ref.read(userProvider.notifier).getSupportedTokens() : null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFF3B46E)),
          );
        }
        if (snapshot.hasData) {
          _supportedTokens.clear();
          for (var item in snapshot.data!) {
            _supportedTokens.addAll({item["tokenName"]!: item["tokenAddress"]!});
          }
        }
        if (_supportedTokens.isEmpty) {
          return Center(
            child: TextButton(
              onPressed: () => setState(() {}),
              child: const Text('retry'),
            ),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Play Amount',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: scaledHeight(8)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckersRadio(
                  value: _supportedTokens["STRK"],
                  globalValue: _selectedTokenAddress,
                  onTap: _selectTokenAddress,
                  selectedBackgroundColor: const Color(0x1200ECFF),
                  unSelectedBackgroundColor: Colors.transparent,
                  borderColor: const Color(0xFFF3B46E),
                  width: 130,
                  padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                  child: Row(
                    children: [
                      Image.asset('assets/images/STRK_logo.png'),
                      const SizedBox(width: 4),
                      Text(
                        'STRK',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: const Color(0xFFF3B46E)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                CheckersRadio(
                  value: _supportedTokens["ETH"],
                  globalValue: _selectedTokenAddress,
                  onTap: _selectTokenAddress,
                  selectedBackgroundColor: const Color(0x1200ECFF),
                  unSelectedBackgroundColor: Colors.transparent,
                  borderColor: const Color(0xFFF3B46E),
                  width: 130,
                  padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                  child: Row(
                    children: [
                      Image.asset('assets/images/eth_icon.png'),
                      const SizedBox(width: 4),
                      Text(
                        'ETH',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: const Color(0xFFF3B46E)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: scaledHeight(8)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckersRadio(
                  value: _supportedTokens["LORDS"],
                  globalValue: _selectedTokenAddress,
                  onTap: _selectTokenAddress,
                  selectedBackgroundColor: const Color(0x1200ECFF),
                  unSelectedBackgroundColor: Colors.transparent,
                  borderColor: const Color(0xFFF3B46E),
                  width: 130,
                  padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                  child: Row(
                    children: [
                      Image.asset('assets/images/lords_icon.png'),
                      const SizedBox(width: 4),
                      Text(
                        'LORDS',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: const Color(0xFFF3B46E)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                CheckersRadio(
                  value: _supportedTokens["BROTHER"],
                  globalValue: _selectedTokenAddress,
                  onTap: _selectTokenAddress,
                  selectedBackgroundColor: const Color(0x1200ECFF),
                  unSelectedBackgroundColor: Colors.transparent,
                  borderColor: const Color(0xFFF3B46E),
                  width: 130,
                  padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                  child: Row(
                    children: [
                      Image.asset('assets/images/brother_icon.png'),
                      const SizedBox(width: 4),
                      Text(
                        'BROTHER',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: const Color(0xFFF3B46E)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: scaledHeight(8)),
            FutureBuilder(
              future: !_shouldRetrieveBalance
                  ? null
                  : ref.read(userProvider.notifier).getTokenBalance(_selectedTokenAddress!).whenComplete(() => _shouldRetrieveBalance = false),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFFF3B46E)),
                  );
                }
                if (snapshot.hasData) {
                  _selectedTokenBalance = snapshot.data!.toDouble();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: scaledHeight(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amount", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                          SizedBox(height: scaledHeight(4)),
                          SizedBox(
                            height: 41,
                            child: TextField(
                              controller: _tokenAmountController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                                filled: true,
                                fillColor: Color(0xFF363D43),
                                hintText: "Enter Amount",
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF363D43))),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF363D43))),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF363D43))),
                              ),
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[.0-9]"))],
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                if (double.tryParse(value) == null || double.parse(value) > (_selectedTokenBalance / 1e18) || double.parse(value) == 0) {
                                  setState(() {
                                    _selectedTokenAmount = null;
                                  });
                                  return;
                                }
                                _selectTokenAmount(double.parse(value) * 1e18);
                              },
                            ),
                          ),
                          SizedBox(height: scaledHeight(10)),
                          Slider(
                            min: 0,
                            thumbColor: Colors.white,
                            divisions: 100,
                            inactiveColor: Colors.white,
                            activeColor: const Color(0xFFF3B46E),
                            label: ((_selectedTokenAmount ?? 0) / 1e18).toStringAsFixed(7),
                            // secondaryActiveColor: const Color(0xFFF3B46E),
                            allowedInteraction: SliderInteraction.slideThumb,
                            max: _selectedTokenBalance.toDouble(),
                            value: _selectedTokenAmount ?? 0,
                            onChanged: _selectTokenAmount,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Min',
                                    style: GoogleFonts.montserrat(fontSize: 10, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 13),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      ((_selectedTokenAmount ?? 0) / 1e18).toStringAsFixed(7),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Max',
                                    style: GoogleFonts.montserrat(fontSize: 10, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 13),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Balance\t\t',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        (_selectedTokenBalance.toDouble() / 1e18).toStringAsFixed(7),
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _selectCharacter(double Function(double height) scaledHeight) {
    final characterAssets = [
      'assets/images/jason.png',
      'assets/images/desire.png',
      'assets/images/esther.png',
      'assets/images/olivia.png',
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Choose a character', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        SizedBox(height: scaledHeight(12)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            characterAssets.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCharacterIndex = index;
                });
              },
              child: Container(
                height: scaledHeight(62),
                width: scaledHeight(62),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF3B46E),
                  border: Border.all(
                    color: _selectedCharacterIndex == index ? Colors.white : Colors.transparent,
                    width: 3,
                  ),
                  boxShadow: _selectedCharacterIndex == index
                      ? [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ]
                      : [],
                ),
                child: Center(child: Image.asset(characterAssets[index], width: 91, height: 91)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _selectGameMode(GameMode gameMode) {
    setState(() {
      _gameMode = gameMode;
      _selectedTokenAddress = null;
      _selectedTokenAmount = null;
    });
  }

  void _selectTokenAddress(String tokenAddress) {
    setState(() {
      _selectedTokenAmount = null;
      _selectedTokenAddress = tokenAddress;
      _selectedTokenBalance = 0;
      _shouldRetrieveBalance = true;
    });
  }

  void _selectTokenAmount(double amount) {
    _tokenAmountController.text = amount == 0 ? "0" : "${amount / 1e18}";
    setState(() {
      _selectedTokenAmount = amount;
    });
  }

  void _switchToNextTab() async {
    if (_activeTab == _numberOfTabs - 1) {
      Navigator.of(context).pop();
      await widget._gameController.updatePlayState(PlayState.waiting);
    }
    setState(() {
      _activeTab++;
    });
  }

  void _switchToPreviousTab() {
    setState(() => _activeTab -= 1);
  }

  bool get _isNextEnabled {
    if (_activeTab == 0) return _gameMode != null;
    if (_activeTab == 1 && _gameMode == GameMode.token) return _selectedTokenAddress != null && _selectedTokenAmount != null;
    if ((_activeTab == 1 && _gameMode == GameMode.free) || _activeTab == 2) return _selectedCharacterIndex != null;
    return false;
  }

  int get _numberOfTabs => _gameMode == GameMode.token ? 3 : 2;
}
