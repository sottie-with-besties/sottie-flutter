import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';
import 'package:sottie_flutter/ui/user/controller/my_info_controller.dart';

final _picker = ImagePicker();

Future<void> modifyImage(BuildContext context) async {
  try {
    // 프로필 사진 선택
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      MyInfoController.changeProfilePath(path: image.path);
    }
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
  } catch (_) {
    if (context.mounted) {
      ModalController.showCustomSnackBar(context, "알 수 없는 에러가 발생했습니다.");
    }
  }
}
