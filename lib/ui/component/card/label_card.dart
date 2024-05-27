import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LabelCard extends HookConsumerWidget {
  const LabelCard({
    super.key,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderRadius = 8,
    this.leading,
    required this.text,
    this.onPressed,
  });

  /// 背景色
  final Color backgroundColor;

  /// 境界線の色
  final Color borderColor;

  /// 角の丸み
  final double borderRadius;

  /// アイコン
  final Widget? leading;

  /// 文字列
  final String text;

  /// 押下時のイベント
  final Function? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        onTap: () {
          if (onPressed != null) onPressed!();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 8),
            ],
            Text(text)
          ],
        ),
      ),
    );
  }
}
