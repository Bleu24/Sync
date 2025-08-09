import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsets padding;

  const GlassButton({super.key, required this.onPressed, required this.child, this.padding = const EdgeInsets.symmetric(vertical: 12)});

  @override
  Widget build(BuildContext context) {
    final bg = Colors.white.withOpacity(0.10);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.22), width: 1),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 16, offset: const Offset(0, 8)),
            BoxShadow(color: Colors.white.withOpacity(0.06), blurRadius: 2, offset: const Offset(-2, -2)),
          ],
        ),
        child: Padding(
          padding: padding,
          child: DefaultTextStyle.merge(style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600), child: Center(child: child)),
        ),
      ),
    );
  }
}
