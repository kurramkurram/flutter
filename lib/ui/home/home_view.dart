
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0,);

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    StateController<int> counterNotifier = ref.watch(counterProvider.notifier);
    final count = ref.watch(counterProvider);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$count'),
          TextButton(
            onPressed: () { 
              counterNotifier.state++; 
            },
            child: const Text('Button')),
        ]
      )
    );
  }
}