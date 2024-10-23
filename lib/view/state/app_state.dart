import 'package:intern_tz_project/service/image_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _comment = '';
  bool _loading = false;

  final _imageService = const ImageService();

  void updateComment(String text) {
    _comment = text;
  }

  bool get isLoading => _loading;

  Future<String?> sendImage(String imagePath) async {
    _loading = true;
    notifyListeners();

    String? error;
    try {
      await _imageService.sendImage(_comment, imagePath);
    } catch (e) {
      error = e.toString();
    }

    _loading = false;
    notifyListeners();
    return error;
  }
}
