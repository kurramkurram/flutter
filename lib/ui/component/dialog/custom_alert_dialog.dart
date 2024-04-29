import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAlertDialog extends HookConsumerWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.description,
    this.positive,
    this.negative,
  });

  /// タイトル
  final String title;

  /// 説明
  final String description;

  /// ポジティブボタン
  final String? positive;

  /// ネガティブボタン
  final String? negative;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        if (positive != null) ...[
          GestureDetector(
            child: Text(positive!),
            onTap: () => Navigator.pop(context, 0),
          ),
        ],
        if (negative != null) ...[
          GestureDetector(
            child: Text(negative!),
            onTap: () => Navigator.pop(context, 1),
          ),
        ]
      ],
    );
  }
}
