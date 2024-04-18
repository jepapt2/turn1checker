import 'dart:async';
import 'dart:io'; // 追加
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/i18n/i18n.g.dart';

class FileController {
  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> saveLocalImage(Uint8List image, ObjectId id) async {
    final path = await localPath;
    final imagePath = '$path/${id.toString()}.png';
    final file = File(imagePath);
    return file.writeAsBytes(image).then((value) => value).catchError((_) {
      throw Exception(t.text.imageSaveError);
    });
  }

  static Future<File> loadLocalImage() async {
    final path = await localPath;
    final imagePath = '$path/image.png';
    return File(imagePath);
  }
}
