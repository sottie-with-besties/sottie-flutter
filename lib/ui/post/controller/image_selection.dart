import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';

final _picker = ImagePicker();

Future<List<XFile>?> imageSelection(BuildContext context) async {
  try {
    // 여러 이미지와 동영상 선택 및 채팅방에 전송
    final images = await _picker.pickMultipleMedia();
    return images;
  } on PlatformException catch (e) {
    if (e.code == 'photo_access_denied') {
      if (context.mounted) {
        ModalController.showCustomSnackBar(context, "포토 권한을 허용해주세요.");
      }
    } else {
      if (context.mounted) {
        ModalController.showCustomSnackBar(
          context,
          "에러가 발생했습니다. Error Code: ${e.code}",
        );
      }
    }
    return null;
  } catch (_) {
    if (context.mounted) {
      ModalController.showCustomSnackBar(context, "알 수 없는 에러가 발생했습니다.");
    }
    return null;
  }
}
