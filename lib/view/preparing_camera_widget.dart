import 'package:flutter/cupertino.dart';

class PreparingCameraWidget extends StatelessWidget {
  const PreparingCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Preparing camera'),
          CupertinoActivityIndicator(),
        ],
      ),
    );
  }
}
