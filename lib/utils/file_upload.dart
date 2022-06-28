import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileUpload {
  Future<File?> getSingleFile() async {
    late File? file;
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'jpeg'],
          allowCompression: true);
      if (result != null) {
        return file = File(result.files.single.path!);
      } else {
        return file = null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
