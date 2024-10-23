import 'package:intern_tz_project/repo/image_repository.dart';

import 'package:native_exif/native_exif.dart';

class ImageService {
  const ImageService();

  final _imageRepo = const ImageRepository();

  Future<bool> sendImage(String comment, String imagePath) async {
    final exif = await Exif.fromPath(imagePath);

    final exifLatLong = await exif.getLatLong();

    if (exifLatLong == null) {
      throw Exception('Can\'t retrive coordinates');
    }

    final lng = exifLatLong.longitude.toString();
    final lat = exifLatLong.longitude.toString();

    await _imageRepo.sendImage(comment, lat, lng, imagePath);

    await exif.close();

    return true;
  }
}
