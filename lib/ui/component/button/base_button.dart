import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseButton extends HookConsumerWidget {
  const BaseButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.radius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.padinngVertical,
    this.paddingHorizontal,
    this.leading,
    this.action,
  });

  // ボタンのテキスト
  final Text text;

  // 押下時のアクション
  final Function() onPressed;

  // ボタンの角
  final double? radius;

  // ボタンの色
  final Color? backgroundColor;

  // 境界の色
  final Color? borderColor;

  // 境界の幅
  final double? borderWidth;

  // パディング上下
  final double? padinngVertical;

  // パディング左右
  final double? paddingHorizontal;

  // テキストの左側のアイコン
  final Image? leading;

  // テキストの右側のアイコン
  final Image? action;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: padinngVertical ?? 16,
            horizontal: paddingHorizontal ?? 16),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 4))),
        side: BorderSide(
            color: borderColor ?? BorderSide.none.color,
            width: borderWidth ?? 0.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
          ],
          const SizedBox(width: 10),
          text,
          const SizedBox(width: 10),
          if (action != null) ...[
            action!,
          ]
        ],
      ),
    );
  }
}
