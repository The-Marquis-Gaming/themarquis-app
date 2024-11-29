import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquis_v2/games/ludo/ludo_game.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/widgets/chevron_border.dart';
import 'package:marquis_v2/games/ludo/widgets/divider_shape.dart';
import 'package:marquis_v2/games/ludo/widgets/pin_color_option.dart';
import 'package:marquis_v2/games/ludo/widgets/radio_option.dart';
import 'package:marquis_v2/games/ludo/widgets/vertical_stepper.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/widgets/error_dialog.dart';

import '../../../widgets/balance_appbar.dart';

enum NumberOfPlayers {
  two,
  four;
}

enum GameMode {
  free,
  token;
}

class CreateGameScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<CreateGameScreen> createState() => _CreateGameScreenState();

  const CreateGameScreen({super.key});
}

class _CreateGameScreenState extends ConsumerState<CreateGameScreen> {
  int _activeTab = 0;
  double _selectedTokenBalance = 0;
  NumberOfPlayers? _numberOfPlayers;
  GameMode? _gameMode;
  String? _selectedTokenAddress;

  double? _selectedTokenAmount;
  String? _playerColor;
  bool _isLoading = false;
  final Map<String, String> _supportedTokens = {};

  void _selectNumberOfPlayers(NumberOfPlayers numberOfPlayers) {
    setState(() {
      _numberOfPlayers = numberOfPlayers;
    });
  }

  void _selectGameMode(GameMode gameMode) {
    setState(() {
      _gameMode = gameMode;
      _selectedTokenAddress = null;
      _selectedTokenAmount = null;
    });
  }

  void _selectPinColor(String pinColor) {
    setState(() {
      _playerColor = pinColor;
    });
  }

  void _selectTokenAddress(String tokenAddress) {
    setState(() {
      _selectedTokenAmount = null;
      _selectedTokenAddress = tokenAddress;
      _selectedTokenBalance = 0;
    });
  }

  void _selectTokenAmount(double amount) {
    if (amount == 0) {
      _selectedTokenAmount = amount;
      return;
    }
    setState(() {
      _selectedTokenAmount = amount;
    });
  }

  void _switchToNextTab() {
    setState(() {
      _activeTab++;
    });
  }

  void _switchToPreviousTab() {
    if (_playerColor == null) {
      setState(() {
        _activeTab -= 1;
      });
    } else {
      setState(() {
        _playerColor = null;
      });
    }
  }

  bool get _isNextEnabled {
    if (_activeTab == 0) return _gameMode != null;
    if (_activeTab == 1) return _numberOfPlayers != null;
    if (_activeTab == 2 && _gameMode == GameMode.token) return _selectedTokenAddress != null && _selectedTokenAmount != null;
    if (_activeTab == 2 && _gameMode == GameMode.free) return _playerColor != null;
    if (_activeTab == 3) return _playerColor != null;
    return false;
  }

  int get _numberOfTabs => _gameMode == GameMode.token ? 4 : 3;

  Future<void> _createGame() async {
    final game = ModalRoute.of(context)!.settings.arguments as LudoGame;
    final color = _playerColor!.split("/").last.split(".").first.split("_").first;
    try {
      setState(() {
        _isLoading = true;
      });
      await ref.read(ludoSessionProvider.notifier).createSession(
            _gameMode == GameMode.free ? '0' : '$_selectedTokenAmount',
            color,
            _selectedTokenAddress ?? "0",
          );
      if (!mounted) return;
      Navigator.of(context).pop();
      game.playState = PlayState.waiting;
    } catch (e) {
      if (!context.mounted) return;
      showErrorDialog(e.toString(), context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const BalanceAppBar(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double scaledHeight(double height) {
            return (height / 717) * constraints.maxHeight;
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 7, top: 17, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('CREATE GAME', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white)),
                    GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Container(
                        decoration: ShapeDecoration(color: Colors.white, shape: ChevronBorder()),
                        padding: const EdgeInsets.only(top: 1, left: 8, bottom: 1, right: 31),
                        child: const Text('MENU', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //width: double.infinity,
                height: scaledHeight(10),
                decoration: const ShapeDecoration(color: Color(0xFF00ECFF), shape: DividerShape(Color(0xFF00ECFF))),
              ),
              SizedBox(height: _activeTab == _numberOfTabs - 1 ? 31 : 21),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if ((_activeTab != _numberOfTabs - 1 && _playerColor == null) ||
                        ((((_activeTab == 2 && _gameMode == GameMode.free) || _activeTab == 3) && _playerColor == null))) ...[
                      SizedBox(
                        width: 32,
                        child: VerticalStepper(activeTab: _activeTab, numberOfSteps: _numberOfTabs),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Container(
                          height: scaledHeight(462),
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFF21262B)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_activeTab == 0)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Select Game Mode', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                    SizedBox(height: scaledHeight(12)),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioOption(
                                          width: 110,
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          value: GameMode.free,
                                          globalValue: _gameMode,
                                          onTap: _selectGameMode,
                                          selectedBackgroundColor: const Color(0x1200ECFF),
                                          unSelectedBackgroundColor: Colors.transparent,
                                          borderColor: const Color(0xFF00ECFF),
                                          activeShadow:
                                              const BoxShadow(blurStyle: BlurStyle.inner, blurRadius: 21.5, spreadRadius: 1, color: Color(0xFF00ECFF)),
                                          child: const Text('Free', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF00ECFF))),
                                        ),
                                        const SizedBox(width: 8),
                                        RadioOption(
                                          width: 110,
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          value: GameMode.token,
                                          globalValue: _gameMode,
                                          onTap: _selectGameMode,
                                          selectedBackgroundColor: const Color(0x1200ECFF),
                                          unSelectedBackgroundColor: Colors.transparent,
                                          borderColor: const Color(0xFF00ECFF),
                                          activeShadow:
                                              const BoxShadow(blurStyle: BlurStyle.inner, blurRadius: 21.5, spreadRadius: 1, color: Color(0xFF00ECFF)),
                                          child: const Text('Token', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF00ECFF))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (_activeTab == 1)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Number of players', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                    SizedBox(height: scaledHeight(12)),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioOption(
                                          width: 110,
                                          padding: EdgeInsets.symmetric(vertical: scaledHeight(5)),
                                          value: NumberOfPlayers.two,
                                          globalValue: _numberOfPlayers,
                                          onTap: _selectNumberOfPlayers,
                                          selectedBackgroundColor: const Color(0x1200ECFF),
                                          unSelectedBackgroundColor: Colors.transparent,
                                          borderColor: const Color(0xFF00ECFF),
                                          activeShadow:
                                              const BoxShadow(blurStyle: BlurStyle.inner, blurRadius: 21.5, spreadRadius: 1, color: Color(0xFF00ECFF)),
                                          child: const Text('2 Players', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF00ECFF))),
                                        ),
                                        const SizedBox(width: 8),
                                        RadioOption(
                                          width: 110,
                                          padding: EdgeInsets.symmetric(vertical: scaledHeight(5)),
                                          value: NumberOfPlayers.four,
                                          globalValue: _numberOfPlayers,
                                          onTap: _selectNumberOfPlayers,
                                          selectedBackgroundColor: const Color(0x1200ECFF),
                                          unSelectedBackgroundColor: Colors.transparent,
                                          borderColor: const Color(0xFF00ECFF),
                                          activeShadow:
                                              const BoxShadow(blurStyle: BlurStyle.inner, blurRadius: 21.5, spreadRadius: 1, color: Color(0xFF00ECFF)),
                                          child: const Text('4 Players', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF00ECFF))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (_activeTab == 2 && _gameMode == GameMode.token)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 28),
                                  child: FutureBuilder(
                                    future: _supportedTokens.isEmpty ? ref.read(userProvider.notifier).getSupportedTokens() : null,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                                      if (snapshot.hasData) {
                                        _supportedTokens.clear();
                                        for (var item in snapshot.data!) {
                                          _supportedTokens.addAll({item["tokenName"]!: item["tokenAddress"]!});
                                        }
                                      }
                                      if (_supportedTokens.isEmpty) {
                                        return Center(child: TextButton(onPressed: () => setState(() {}), child: const Text('retry')));
                                      }
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('Play Amount', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              RadioOption(
                                                value: _supportedTokens["STRK"],
                                                globalValue: _selectedTokenAddress,
                                                onTap: _selectTokenAddress,
                                                activeShadow:
                                                    const BoxShadow(color: Color(0xFF00ECFF), blurStyle: BlurStyle.inner, spreadRadius: 1, blurRadius: 21),
                                                selectedBackgroundColor: const Color(0x1200ECFF),
                                                unSelectedBackgroundColor: Colors.transparent,
                                                borderColor: const Color(0xFF00ECFF),
                                                width: 130,
                                                padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset('assets/images/STRK_logo.png'),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'STRK',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: _selectedTokenAddress == _supportedTokens["STRK"] ? Colors.black : const Color(0xFF00ECFF)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              RadioOption(
                                                value: _supportedTokens["ETH"],
                                                globalValue: _selectedTokenAddress,
                                                onTap: _selectTokenAddress,
                                                activeShadow:
                                                    const BoxShadow(color: Color(0xFF00ECFF), blurStyle: BlurStyle.inner, spreadRadius: 1, blurRadius: 21),
                                                selectedBackgroundColor: const Color(0x1200ECFF),
                                                unSelectedBackgroundColor: Colors.transparent,
                                                borderColor: const Color(0xFF00ECFF),
                                                width: 130,
                                                padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset('assets/images/eth_icon.png'),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'ETH',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: _selectedTokenAddress == _supportedTokens["ETH"] ? Colors.black : const Color(0xFF00ECFF)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              RadioOption(
                                                value: _supportedTokens["LORDS"],
                                                globalValue: _selectedTokenAddress,
                                                onTap: _selectTokenAddress,
                                                activeShadow:
                                                    const BoxShadow(color: Color(0xFF00ECFF), blurStyle: BlurStyle.inner, spreadRadius: 1, blurRadius: 21),
                                                selectedBackgroundColor: const Color(0x1200ECFF),
                                                unSelectedBackgroundColor: Colors.transparent,
                                                borderColor: const Color(0xFF00ECFF),
                                                width: 130,
                                                padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset('assets/images/lords_icon.png'),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'LORDS',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: _selectedTokenAddress == "" ? Colors.black : const Color(0xFF00ECFF)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              RadioOption(
                                                value: _supportedTokens["BROTHER"],
                                                globalValue: _selectedTokenAddress,
                                                onTap: _selectTokenAddress,
                                                activeShadow:
                                                    const BoxShadow(color: Color(0xFF00ECFF), blurStyle: BlurStyle.inner, spreadRadius: 1, blurRadius: 21),
                                                selectedBackgroundColor: const Color(0x1200ECFF),
                                                unSelectedBackgroundColor: Colors.transparent,
                                                borderColor: const Color(0xFF00ECFF),
                                                width: 130,
                                                padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset('assets/images/brother_icon.png'),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'BROTHER',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: _selectedTokenAddress == "" ? Colors.black : const Color(0xFF00ECFF)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          FutureBuilder(
                                            future: _selectedTokenAddress == null || ((_selectedTokenAmount ?? 0)) > 0
                                                ? null
                                                : ref.read(userProvider.notifier).getTokenBalance(_selectedTokenAddress!),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                                              if (snapshot.hasData) {
                                                _selectedTokenBalance = snapshot.data!.toDouble();
                                              }
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Slider(
                                                    min: 0,
                                                    divisions: 100,
                                                    activeColor: Colors.white,
                                                    label: ((_selectedTokenAmount ?? 0) / 1e18).toStringAsFixed(7),
                                                    secondaryActiveColor: Colors.cyan,
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
                                                            style: GoogleFonts.montserrat(
                                                                fontSize: 10, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w400),
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
                                                            style: GoogleFonts.montserrat(
                                                                fontSize: 10, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w400),
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
                                                      )
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              if (((_activeTab == 2 && _gameMode == GameMode.free) || _activeTab == 3) && _playerColor == null)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Pin Color', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        PinColorOption(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [Color(0xFF005C30), Color(0x730C3823), Color(0xFF005C30)],
                                          ),
                                          svgPath: 'assets/svg/chess-and-bg/green_chess.svg',
                                          selectedPinColor: _playerColor,
                                          onTap: _selectPinColor,
                                        ),
                                        SizedBox(width: scaledHeight(12)),
                                        PinColorOption(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [Color(0xC700CEDB), Color(0x73145559), Color(0x9E00CEDB)],
                                          ),
                                          svgPath: 'assets/svg/chess-and-bg/blue_chess.svg',
                                          selectedPinColor: _playerColor,
                                          onTap: _selectPinColor,
                                        ),
                                        const SizedBox(width: 8),
                                        PinColorOption(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [Color(0xC7DB0000), Color(0x73591414), Color(0x9EDB0000)],
                                          ),
                                          svgPath: 'assets/svg/chess-and-bg/red_chess.svg',
                                          selectedPinColor: _playerColor,
                                          onTap: _selectPinColor,
                                        ),
                                        const SizedBox(width: 8),
                                        PinColorOption(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [Color(0xC7DBD200), Color(0x73595214), Color(0x9EDBD200)],
                                          ),
                                          svgPath: 'assets/svg/chess-and-bg/yellow_chess.svg',
                                          selectedPinColor: _playerColor,
                                          onTap: _selectPinColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    if (_activeTab == _numberOfTabs - 1 && _playerColor != null)
                      SizedBox(
                        width: constraints.maxWidth - 24,
                        height: scaledHeight(462),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(color: const Color(0xFF21262B), borderRadius: BorderRadius.circular(8)),
                                // height: double.infinity,
                                // width: 500,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Select Game Mode'),
                                    const SizedBox(height: 12),
                                    RadioOption(
                                      value: _gameMode,
                                      globalValue: _gameMode,
                                      onTap: (_) {},
                                      activeShadow: const BoxShadow(color: Color(0xFF00ECFF), blurStyle: BlurStyle.inner, spreadRadius: 1, blurRadius: 21),
                                      selectedBackgroundColor: const Color(0x1200ECFF),
                                      unSelectedBackgroundColor: Colors.transparent,
                                      borderColor: const Color(0xFF00ECFF),
                                      width: 130,
                                      padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                      child: Text(_gameMode == GameMode.free ? 'Free' : 'Token'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(color: const Color(0xFF21262B), borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Number Of Players'),
                                    const SizedBox(height: 12),
                                    RadioOption(
                                      value: _numberOfPlayers,
                                      globalValue: _numberOfPlayers,
                                      onTap: (_) {},
                                      activeShadow: const BoxShadow(color: Color(0xFF00ECFF), blurStyle: BlurStyle.inner, spreadRadius: 1, blurRadius: 21),
                                      selectedBackgroundColor: const Color(0x1200ECFF),
                                      unSelectedBackgroundColor: Colors.transparent,
                                      borderColor: const Color(0xFF00ECFF),
                                      width: 130,
                                      padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                      child: Text(_numberOfPlayers == NumberOfPlayers.two ? '2 Players' : '4 Players'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (_selectedTokenAddress != null) ...[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(color: const Color(0xFF21262B), borderRadius: BorderRadius.circular(8)),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Play Amount'),
                                      const SizedBox(height: 12),
                                      RadioOption(
                                        value: _selectedTokenAddress,
                                        globalValue: _selectedTokenAddress,
                                        onTap: (_) {},
                                        activeShadow: const BoxShadow(color: Color(0xFF00ECFF), blurStyle: BlurStyle.inner, spreadRadius: 1, blurRadius: 21),
                                        selectedBackgroundColor: const Color(0x1200ECFF),
                                        unSelectedBackgroundColor: Colors.transparent,
                                        borderColor: const Color(0xFF00ECFF),
                                        width: 130,
                                        padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/${_supportedTokens['ETH'] == _selectedTokenAddress ? 'eth_icon' : _supportedTokens['STRK'] == _selectedTokenAddress ? 'STRK_logo' : _supportedTokens['LORDS'] == _selectedTokenAddress ? 'lords_icon' : 'brother_logo'}.png",
                                            ),
                                            const Flexible(child: SizedBox(width: 10)),
                                            Text(
                                              (_selectedTokenAmount! / 1e18).toStringAsFixed(7),
                                              maxLines: 1,
                                              style: const TextStyle(color: Color(0xFF00ECFF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(color: const Color(0xFF21262B), borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Pin Color'),
                                    const SizedBox(height: 12),
                                    PinColorOption(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          if (_playerColor == 'assets/svg/chess-and-bg/yellow_chess.svg') ...[
                                            const Color(0xC7DBD200),
                                            const Color(0x73595214),
                                            const Color(0x9EDBD200),
                                          ],
                                          if (_playerColor == 'assets/svg/chess-and-bg/red_chess.svg') ...[
                                            const Color(0xC7DB0000),
                                            const Color(0x73591414),
                                            const Color(0x9EDB0000),
                                          ],
                                          if (_playerColor == 'assets/svg/chess-and-bg/blue_chess.svg') ...[
                                            const Color(0xC700CEDB),
                                            const Color(0x73145559),
                                            const Color(0x9E00CEDB),
                                          ],
                                          if (_playerColor == 'assets/svg/chess-and-bg/green_chess.svg') ...[
                                            const Color(0xFF005C30),
                                            const Color(0x730C3823),
                                            const Color(0xFF005C30),
                                          ],
                                        ],
                                      ),
                                      svgPath: _playerColor!,
                                      selectedPinColor: "",
                                      onTap: (_) {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: scaledHeight(20)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    if (_activeTab != 0) ...[
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            minimumSize: Size(double.infinity, scaledHeight(43)),
                            side: const BorderSide(color: Color(0xFF00ECFF)),
                            foregroundColor: const Color(0xFF00ECFF),
                            textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          onPressed: _switchToPreviousTab,
                          child: const Text('Back'),
                        ),
                      ),
                      const SizedBox(width: 8)
                    ],
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          minimumSize: Size(double.infinity, scaledHeight(43)),
                          disabledBackgroundColor: const Color(0xFF32363A),
                          backgroundColor: const Color(0xFF00ECFF),
                          disabledForegroundColor: const Color(0xFF939393),
                          foregroundColor: const Color(0xFF000000),
                          textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        onPressed: _activeTab == _numberOfTabs - 1
                            ? _createGame
                            : _isNextEnabled
                                ? _switchToNextTab
                                : null,
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : Text(_activeTab == _numberOfTabs - 1 && _playerColor != null ? 'Create Game' : 'Next'),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Center(
              //     child: GestureDetector(
              //       onTap: _createGame,
              //       child: Container(
              //         margin: const EdgeInsets.symmetric(horizontal: 29),
              //         decoration: ShapeDecoration(
              //           color: _playerColor == null ? const Color(0xFF32363A) : const Color(0xFF00ECFF),
              //           shape: AngledSubmitShape(_playerColor == null ? const Color(0xFF939393) : const Color(0xFF000000)),
              //         ),
              //         //width: double.infinity,
              //         height: scaledHeight(52),
              //         alignment: Alignment.center,
              //         child: Visibility(
              //           visible: !_isLoading,
              //           replacement: const Center(child: CircularProgressIndicator()),
              //           child: Text('CREATE GAME', style: TextStyle(color: _playerColor == null ? const Color(0xFF939393) : const Color(0xFF000000))),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}