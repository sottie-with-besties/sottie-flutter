import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:sottie_flutter/core/constant/native_key.dart';

sealed class VerificationUseCase {
  static void bootpayAuthentication(BuildContext context) {
    Bootpay().requestAuthentication(
      context: context,
      payload: _getPayload(),
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); //명시적으로 부트페이 뷰 종료 호출
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        /**
            1. 바로 승인하고자 할 때
            return true;
         **/
        /***
            2. 비동기 승인 하고자 할 때
            checkQtyFromServer(data);
            return false;
         ***/
        /***
            3. 서버승인을 하고자 하실 때 (클라이언트 승인 X)
            return false; 후에 서버에서 결제승인 수행
         */
        // checkQtyFromServer(data);
        print("------- onConfirm: $data");
        // context.go(CustomRouter.homePath);

        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }

  static Payload _getPayload() {
    final payload = Payload();

    /// 부트페이 콘솔에 프로젝트 생성하여 해당 아이디를 넣어야함
    /// 본인인증은 그냥 id 넣지 않아도 동작은 되는듯?
    payload.webApplicationId =
        NativeKey.bootpayWebApplicationId; // web application id
    payload.androidApplicationId =
        NativeKey.bootpayAndroidApplicationId; // android application id
    payload.iosApplicationId =
        NativeKey.bootpayIosApplicationId; // ios application id

    payload.pg = '다날';
    payload.method = '본인인증';
    payload.orderName = "본인인증";
    payload.authenticationId =
        DateTime.now().millisecondsSinceEpoch
            .toString(); //주문번호, 개발사에서 고유값으로 지정해야함

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'sottiebootpay';
    payload.extra = extra;
    return payload;
  }
}
