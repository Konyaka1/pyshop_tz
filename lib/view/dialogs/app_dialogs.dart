import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_tz_project/service/image_service.dart';

const _imgService = ImageService();

Future<void> showSendingDialog(
    BuildContext context, String comment, String imagePath) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return FutureBuilder(
        future: _imgService.sendImage(comment, imagePath),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _ErrorDialog(
              error: snapshot.error.toString(),
            );
          } else if (snapshot.hasData) {
            return const _SuccessDialog(text: 'Sent!');
          } else {
            return const _LoadingDialog(text: 'Sending image');
          }
        },
      );
    },
  );
}

Future<void> showErrorDialog(BuildContext context, String error) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => _ErrorDialog(
      error: error,
    ),
  );
}

class _SuccessDialog extends StatelessWidget {
  final String text;

  const _SuccessDialog({required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Success'),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

class _LoadingDialog extends StatelessWidget {
  final String text;

  const _LoadingDialog({required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(text),
      content: const CupertinoActivityIndicator(),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

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
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
