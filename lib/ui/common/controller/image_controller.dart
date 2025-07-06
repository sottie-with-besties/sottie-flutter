import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

sealed class ImageController {
  static final _picker = ImagePicker();

  // 이미지 하나 선택
  static Future<List<dynamic>> selectImage() async {
    try {
      // 프로필 사진 선택
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return [true, image.path];
      } else {
        return [false, "이미지를 가져올 수 없습니다."];
      }
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        return [false, "포토 권한을 허용해 주세요."];
      }
      return [false, "이미지를 가져올 수 없습니다."];
    } catch (_) {
      return [false, "이미지를 가져올 수 없습니다."];
    }
  }
  
  /// 이미지 여러개 선택
  static Future<List<dynamic>> selectMultipleImages() async {
    try {
      final images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        return [true, images.map((img) => img.path).toList()];
      } else {
        return [false, "이미지를 가져올 수 없습니다."];
      }
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        return [false, "포토 권한을 허용해 주세요."];
      }
      return [false, "이미지를 가져올 수 없습니다."];
    } catch (_) {
      return [false, "이미지를 가져올 수 없습니다."];
    }
  }
}
