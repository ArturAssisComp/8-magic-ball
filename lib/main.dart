import 'dart:math';

import 'package:flutter/material.dart';
import 'const.dart';

void main() {
  runApp(const EightBallStateless());
}

class EightBallStateless extends StatelessWidget {
  const EightBallStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorsMap['AppBar'],
          title: const Text(
            'Ask Me Anything',
          ),
        ),
        backgroundColor: colorsMap['BodyBackground'],
        body: const EightBallStateful(),
      ),
    );
  }
}

class EightBallStateful extends StatefulWidget {
  const EightBallStateful({Key? key}) : super(key: key);

  @override
  State<EightBallStateful> createState() => _EightBallStatefulState();
}

class _EightBallStatefulState extends State<EightBallStateful> {
  final maxIndex = imageAssetName.length;
  int currentImageIndex = 0;
  bool waiting = false;

  void updateAnswer() {
    setState(() {
      waiting = true;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        waiting = false;
        currentImageIndex = Random().nextInt(maxIndex);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: TextButton(
            onPressed: () {
              if (!waiting) updateAnswer();
            },
            child: Image.asset(
                waiting ? waitingImageName : imageAssetName[currentImageIndex]),
          ),
        ),
      ),
    );
  }
}
