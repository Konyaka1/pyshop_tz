import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_tz_project/service/image_service.dart';

const _imgService = ImageService();

Future<void> showSendingDialog(
    BuildContext context, String comment, String imagePath) {
  return showDialog(
    context: context,
    builder: (context) {
      return FutureBuilder(
        future: _imgService.sendImage(comment, imagePath),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _ErrorDialog(
              error: snapshot.error.toString(),
            );
          } else if (snapshot.hasData) {
            return _success;
          } else {
            return _loading;
          }
        },
      );
    },
  );
}

const _success = AlertDialog(
  title: Text('Success'),
  content: Text('Sent!'),
);

const _loading = AlertDialog(
  title: Text('Sending'),
  content: CupertinoActivityIndicator(),
);

class _ErrorDialog extends StatelessWidget {
  const _ErrorDialog({
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Text(error),
    );
  }
}
