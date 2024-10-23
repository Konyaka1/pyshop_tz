import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context, String error) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text('Ok'),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  return showDialog(
    context: context,
    builder: (context) => alert,
  );
}

Future<void> showSuccessDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text('Ok'),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog success = AlertDialog(
    title: const Text("Success"),
    content: const Text("Successfully sent."),
    actions: [
      okButton,
    ],
  );

  return showDialog(
    context: context,
    builder: (context) => success,
  );
}
