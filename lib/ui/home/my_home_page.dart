import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // <<< 1.   StatefulWidgetにSingleTickerProviderStateMixinをMixinする
  late AnimationController controller;
  late Tween<Alignment> tween;
  final Curve curve = Curves.ease;
  late Animation<Alignment> animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this); // <<< 2. このクラス自身(this)をAnimationControllerに渡す
    tween = Tween(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter); // <<< 3. 何の値に変換するかと始点と終点の値を決めてTweenを作る
    tween.chain(CurveTween(curve: curve)); // <<< 4. TweenにCurveを適用して変化の曲線を変える
    animation = controller
        .drive(tween); // <<< 5. AnimationControllerとTweenを掛け合わせてAnimationを作る
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter app'),
      ),
      body: Column(children: [
        const Text('aaaaa'),
        Expanded(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return Align(
                alignment:
                    animation.value, // <<< 6. Animationを変化させたいWidgetに紐付ける
                child: const Text('Hello world!'),
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); // <<< 7. forwardメソッドでアニメーションを開始する
        },
        backgroundColor: Colors.yellow[700],
        child: const Icon(
          Icons.bolt,
          color: Colors.black,
        ),
      ),
    );
  }
}
