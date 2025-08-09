import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animated dark aurora/nebula-like background using moving radial gradients.
class AuroraBackground extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const AuroraBackground({super.key, required this.child, this.duration = const Duration(seconds: 12)});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value * 2 * math.pi;
        final size = MediaQuery.of(context).size;
        // Positions orbit around the screen center.
        Offset orbit(double r, double phase) => Offset(
              size.width / 2 + math.cos(t + phase) * r,
              size.height / 2 + math.sin(t + phase * 1.2) * r * 0.6,
            );
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF000000), Color(0xFF0A0A0A)],
            ),
          ),
          child: Stack(
            children: [
              // Soft blurred radial glows
              _blob(
                center: orbit(size.shortestSide * 0.28, 0.0),
                color: const Color(0xFF00FFC6).withOpacity(0.12),
                radius: size.shortestSide * 0.50,
              ),
              _blob(
                center: orbit(size.shortestSide * 0.32, 2.1),
                color: const Color(0xFF7C4DFF).withOpacity(0.10),
                radius: size.shortestSide * 0.55,
              ),
              _blob(
                center: orbit(size.shortestSide * 0.26, 4.2),
                color: const Color(0xFF00B0FF).withOpacity(0.12),
                radius: size.shortestSide * 0.45,
              ),
              // Noise-like subtle overlay via dithering gradient bands
              IgnorePointer(
                ignoring: true,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.02),
                        Colors.transparent,
                        Colors.white.withOpacity(0.01),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.35, 0.7, 1.0],
                    ),
                  ),
                ),
              ),
              widget.child,
            ],
          ),
        );
      },
    );
  }

  Widget _blob({required Offset center, required Color color, required double radius}) {
    return Positioned(
      left: center.dx - radius,
      top: center.dy - radius,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [color, Colors.transparent],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
