import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider = StateNotifierProvider.autoDispose<ImageSelector,String?>((ref) => ImageSelector());

class ImageSelector extends StateNotifier<String?> {
  ImageSelector() : super(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      state = image.path;
    }else{
      state = null;
    }
  
  }
}
