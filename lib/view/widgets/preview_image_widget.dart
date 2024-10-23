import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:intern_tz_project/view/dialogs/app_dialogs.dart';
import 'package:intern_tz_project/view/widgets/preparing_camera_widget.dart';
import 'package:flutter/material.dart';
import 'package:intern_tz_project/view/widgets/top_actions_widget.dart';

class PreviewImageWidget extends StatefulWidget {
  const PreviewImageWidget({super.key});

  @override
  State<PreviewImageWidget> createState() => _PreviewImageWidgetState();
}

class _PreviewImageWidgetState extends State<PreviewImageWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final saveConfig = SaveConfig.photo(
      exifPreferences: ExifPreferences(saveGPSLocation: true),
    );

    return CameraAwesomeBuilder.awesome(
      saveConfig: saveConfig,
      onMediaCaptureEvent: (media) => onMediaCaptureEvent(media, context),
      progressIndicator: const PreparingCameraWidget(),
      topActionsBuilder: (state) => TopActionsWidget(
        state: state,
        controller: controller,
      ),
      bottomActionsBuilder: (state) => AwesomeBottomActions(
        state: state,
        right: const SizedBox.shrink(),
      ),
    );
  }

  Future<void> onMediaCaptureEvent(
      MediaCapture mediaCapture, BuildContext context) async {
    if (controller.text.isEmpty) {
      return showErrorDialog(context, 'Text can\'t be empty');
    }

    if (mediaCapture.status == MediaCaptureStatus.capturing) {
      return;
    }

    final imagePath = mediaCapture.captureRequest.path;
    if (imagePath == null) {
      return;
    }

    return showSendingDialog(context, controller.text, imagePath);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
