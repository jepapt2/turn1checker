import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/utils/functions/file_controller.dart';

part 'local_path.g.dart';

@riverpod
Future<String> localPath(LocalPathRef ref) async {
  return await FileController.localPath;
}
