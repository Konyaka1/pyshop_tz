import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:intern_tz_project/view/preparing_camera_widget.dart';
import 'package:intern_tz_project/view/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class PreviewImageWidget extends StatelessWidget {
  const PreviewImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final saveConfig = SaveConfig.photo(
      exifPreferences: ExifPreferences(saveGPSLocation: true),
      pathBuilder: (sensors) async {
        final extDir = await getTemporaryDirectory();
        final testDir = await Directory('${extDir.path}/camerawesome')
            .create(recursive: true);

        final filePath =
            '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

        return SingleCaptureRequest(filePath, sensors.first);
      },
    );

    return CameraAwesomeBuilder.custom(
      saveConfig: saveConfig,
      onMediaCaptureEvent: (media) => onMediaCaptureEvent(media, context),
      builder: (cameraState, preview) {
        return cameraState.when(
            onPreparingCamera: (state) => const PreparingCameraWidget(),
            onPhotoMode: (state) => state.takePhoto());
      },
    );
  }

  Future<void> onMediaCaptureEvent(
      MediaCapture mediaCapture, BuildContext context) async {
    final imagePath = mediaCapture.captureRequest.path;
    if (imagePath == null) {
      return;
    }

    final error = await Provider.of<AppState>(context, listen: false)
        .sendImage(imagePath);

    if (!context.mounted) {
      return;
    }

    if (error != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(error),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Success'),
          content: Text('Succesfully sent.'),
        ),
      );
    }
  }
}
