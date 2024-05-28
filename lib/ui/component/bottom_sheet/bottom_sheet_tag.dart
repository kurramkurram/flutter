import 'package:flutter/material.dart';
import 'package:flutter_app/ui/component/button/base_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomSheetTag extends HookConsumerWidget {
  const BottomSheetTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> tags = [
      'AAAAAAAA',
      'BBBBBBBB',
      'CCCCCCCC',
      'DDDDDDD',
      'EEEEEEE'
    ];

    return Column(
      children: [
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: [
            for (var tag in tags) ...[
              BaseButton(
                paddingVertical: 0,
                paddingHorizontal: 8,
                text: Text('#$tag'),
                onPressed: () {},
              ),
            ],
          ],
        ),
        const SizedBox(height: 20),
        Expanded(child: Container()),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseButton(
                borderColor: Colors.transparent,
                text: const Text('キャンセル'),
                onPressed: () {},
              ),
              const SizedBox(width: 40),
              BaseButton(
                borderColor: Colors.transparent,
                text: const Text('登録'),
                onPressed: () {},
              ),
              const SizedBox(width: 40),
              BaseButton(
                borderColor: Colors.transparent,
                text: const Text('タグを作成'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
