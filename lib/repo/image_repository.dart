import 'package:http/http.dart' as http;

const _url = 'https://flutter-sandbox.free.beeceptor.com/upload_photo/';

class ImageRepository {
  const ImageRepository();

  Future<void> sendImage(
    String comment,
    String latitude,
    String longitude,
    String imagePath,
  ) async {
    final uri = Uri.parse(_url);
    final req = http.MultipartRequest('POST', uri)
      ..fields['comment'] = comment
      ..fields['latitude'] = latitude
      ..fields['longitude'] = longitude
      ..files.add(await http.MultipartFile.fromPath('photo', imagePath));

    req.headers['Content-Type'] = 'application/javascript';
    try {
      final stream = await req.send();
      final res = await http.Response.fromStream(stream);
      final status = res.statusCode;
      if (status != 201) throw Exception('Server unavailable');
    } on Exception {
      throw Exception('Server unavailable');
    }
  }
}
