import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sauvik_ui/resource/all_estension.dart';
import 'package:sauvik_ui/resource/assets_res.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MonumentScreen extends StatefulWidget {
  const MonumentScreen({super.key});

  @override
  State<MonumentScreen> createState() => _MonumentScreenState();
}

class _MonumentScreenState extends State<MonumentScreen> {
  static const double _waveLift = 10;
  static const double _waveSlide = 0.35;
  static const double _dateDelayMs = 1950;

  Widget _waveCore({
    required Widget child,
    required double delayMs,
    required bool fromLeft,
    double slideScale = 1,
  }) {
    final slide = _waveSlide * slideScale;
    return child
        .animate(delay: delayMs.ms)
        .slideX(
          begin: fromLeft ? -slide : slide,
          end: 0,
          duration: 1200.ms,
          curve: Curves.easeOut,
        )
        .fadeIn(duration: 850.ms)
        .then(delay: 250.ms)
        .moveY(
          begin: 0,
          end: -_waveLift,
          duration: 2200.ms,
          curve: Curves.easeInOut,
        );
  }

  Widget _waveSvg({
    required String asset,

    double? height,
    required double delayMs,
    required bool fromLeft,
  }) => _waveCore(
    child: _svg(asset: asset, height: height),
    delayMs: delayMs,
    fromLeft: fromLeft,
  );

  Widget _dateBadge() =>
      Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "16th",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                  fontFeatures: [FontFeature.notationalForms()],
                ),
              ),
              Text(
                "December",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                  fontFeatures: [FontFeature.notationalForms()],
                ),
              ),
            ],
          )
          .animate(delay: _dateDelayMs.ms)
          .slideX(begin: 0.15, end: 0, duration: 1000.ms, curve: Curves.easeOut)
          .fadeIn(duration: 900.ms)
          .scaleXY(
            begin: 0.95,
            end: 1,
            duration: 750.ms,
            curve: Curves.easeOutBack,
          );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  Widget _svg({required String asset, double? height}) => Transform.translate(
    offset: Offset(0, 0), // tweak dx to set overlap/spacing
    child: ClipRect(
      child: SvgPicture.asset(
        asset,
        fit: BoxFit.contain,
        alignment: Alignment.bottomCenter,
        allowDrawingOutsideViewBox: true,
        height: height,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 400, maxWidth: 390),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  //Top 2 Red Items
                                  Flexible(
                                    child: _waveCore(
                                      child: SvgPicture.asset(
                                        AssetsRes.middleTopLeft,
                                        fit: BoxFit.contain,
                                        alignment: Alignment.bottomCenter,
                                        height: 170,
                                      ),
                                      delayMs: 630,
                                      fromLeft: true,
                                      slideScale: 0.5,
                                    ),
                                  ),
                                  Flexible(
                                    child: _waveCore(
                                      child: SvgPicture.asset(
                                        AssetsRes.middleTopRight,
                                        fit: BoxFit.contain,
                                        alignment: Alignment.bottomCenter,
                                        height: 170,
                                      ),
                                      delayMs: 720,
                                      fromLeft: false,
                                      slideScale: 0.5,
                                    ),
                                  ),
                                ],
                              ),

                              10.height,
                              //3 Red Bottom  Items
                              Stack(
                                children: [
                                  _waveCore(
                                    child: SvgPicture.asset(
                                      AssetsRes.middleCenter,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.bottomCenter,
                                      height: 80,
                                    ),
                                    delayMs: 450,
                                    fromLeft: true,
                                    slideScale: 0.2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: _waveCore(
                                          child: SvgPicture.asset(
                                            AssetsRes.middleBottomLeft,
                                            fit: BoxFit.contain,
                                            alignment: Alignment.bottomCenter,
                                            height: 80,
                                          ),
                                          delayMs: 360,
                                          fromLeft: true,
                                          slideScale: 0.25,
                                        ),
                                      ),
                                      Flexible(
                                        child: _waveCore(
                                          child: SvgPicture.asset(
                                            AssetsRes.middleBottomRight,
                                            fit: BoxFit.contain,
                                            alignment: Alignment.bottomCenter,
                                            height: 80,
                                          ),
                                          delayMs: 540,
                                          fromLeft: false,
                                          slideScale: 0.25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(right: 30, top: 30, child: _dateBadge()),
                          // Left 4 green Items
                          Positioned(
                            bottom: 0,
                            left: 127,
                            child: _waveSvg(
                              asset: AssetsRes.left_4,

                              height: 180,
                              delayMs: 660,
                              fromLeft: true,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 95,
                            child: _waveSvg(
                              asset: AssetsRes.left_3,

                              height: 120,
                              delayMs: 440,
                              fromLeft: true,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 60,
                            child: _waveSvg(
                              asset: AssetsRes.left_2,

                              height: 80,
                              delayMs: 220,
                              fromLeft: true,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: _waveSvg(
                              asset: AssetsRes.left_1,

                              height: 40,
                              delayMs: 0,
                              fromLeft: true,
                            ),
                          ),

                          // Right 4 green Items
                          Positioned(
                            bottom: 0,
                            right: 127,
                            child: _waveSvg(
                              asset: AssetsRes.right_4,

                              height: 180,
                              delayMs: 810,
                              fromLeft: false,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 95,
                            child: _waveSvg(
                              asset: AssetsRes.right_3,

                              height: 120,
                              delayMs: 900,
                              fromLeft: false,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 60,
                            child: _waveSvg(
                              asset: AssetsRes.right_2,

                              height: 80,
                              delayMs: 990,
                              fromLeft: false,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: _waveSvg(
                              asset: AssetsRes.right_1,
                              height: 40,
                              delayMs: 1080,
                              fromLeft: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
