import 'package:crcanimation/crc_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Red Clan'),
      ),
      body: Center(
        child: CRCAnimation.applyAnimation(
          context: context,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'YouTube:Code Red Clan',
                style: TextStyle(
                  // fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          type: AnimationType.fadeIn, 
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
