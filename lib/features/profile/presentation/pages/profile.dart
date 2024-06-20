import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  final listViewKey = GlobalKey();
  final animatedBoxKey = GlobalKey();

  final scrollController = ScrollController();

  late AnimationController animatedBoxEnterAnimationController;

  @override
  void initState() {
    super.initState();

    animatedBoxEnterAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    scrollController.addListener(() {
      _updateAnimatedBoxEnterAnimation();
    });
  }

  static const enterAnimationMinHeight = 100.0;

  _updateAnimatedBoxEnterAnimation() {
    if (animatedBoxEnterAnimationController.status != AnimationStatus.dismissed) {
      return; // animation already in progress/finished
    }

    RenderObject? listViewObject = listViewKey.currentContext?.findRenderObject();
    RenderObject? animatedBoxObject = animatedBoxKey.currentContext?.findRenderObject();
    if (listViewObject == null || animatedBoxObject == null) return;

    final listViewHeight = listViewObject.paintBounds.height;
    final animatedObjectTop = animatedBoxObject.getTransformTo(listViewObject).getTranslation().y;

    final animatedBoxVisible = (animatedObjectTop + enterAnimationMinHeight < listViewHeight);

    if (animatedBoxVisible) {
      // start animation
      animatedBoxEnterAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final boxOpacity = CurveTween(curve: Curves.easeOut).animate(animatedBoxEnterAnimationController);

    final boxPosition = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(animatedBoxEnterAnimationController);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
      ),
      body: ListView(
        key: listViewKey,
        controller: scrollController,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          FadeTransition(
            opacity: boxOpacity,
            child: SlideTransition(
              position: boxPosition,
              child: Container(
                key: animatedBoxKey,
                height: 300.0,
                color: Colors.green,
                padding: const EdgeInsets.all(16.0),
                child: const Text('Animated Box'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              scrollController.jumpTo(0.0);
              animatedBoxEnterAnimationController.reset();
            },
            child: const Text('Reset'),
          )
        ],
      ),
    );
  }
}