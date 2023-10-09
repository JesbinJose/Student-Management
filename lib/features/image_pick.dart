import 'package:image_picker/image_picker.dart';

Future<String?> pickImage(ImageSource imageSource) async {
  return (await ImagePicker().pickImage(source: imageSource))?.path;
}
