import 'package:flutter/cupertino.dart';

class PreparingCameraWidget extends StatelessWidget {
  const PreparingCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Preparing camera'),
          SizedBox(height: 16),
          CupertinoActivityIndicator(),
        ],
      ),
    );
  }
}
