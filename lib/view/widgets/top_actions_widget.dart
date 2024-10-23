import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class TopActionsWidget extends StatelessWidget {
  const TopActionsWidget({
    required this.state,
    required this.controller,
    super.key,
  });

  final CameraState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final children = [
      Expanded(child: TextField(controller: controller)),
      AwesomeLocationButton(state: state as PhotoCameraState),
    ];

    return AwesomeTopActions(
      state: state,
      children: children,
    );
  }
}
