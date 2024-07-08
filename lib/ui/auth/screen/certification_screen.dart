import 'dart:convert';
import 'dart:developer';
import 'dart:convert'; // JSONEncode의 사용을 위해 import가 필요합니다.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/* 아임포트 휴대폰 본인인증 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_certification.dart';
/* 아임포트 휴대폰 본인인증 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/certification_data.dart';

import 'package:http/http.dart' as http;
import 'package:sottie_flutter/core/router/router.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IamportCertification(
      appBar: new AppBar(
        title: new Text('아임포트 본인인증'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/iamport-logo.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp15826660',
      /* [필수입력] 본인인증 데이터 */
      data: CertificationData(
        pg: 'inicis_unified',                                         // PG사
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}',  // 주문번호
        mRedirectUrl: 'https://example.com',                          // 본인인증 후 이동할 URL
      ),
      /* [필수입력] 콜백 함수 */

      // TODO 샘플코드 Navigator.pushReplacementNamed 작동 왜 안되는지 확인필요
      callback: (Map<String, String> result) {
        /**
         * 콜백 함수는 필수입력 필드로, 결제/본인인증 완료 후 라우트를 이동하도록 로직을 작성해야합니다.
         * 아래와 같이 push 함수가 아닌 pushReplacementNamed 함수를 사용해야 합니다.
         * push 함수를 사용할 경우, 결제/본인인증 완료 후 라우터가 변경되더라도 유저가 뒤로가기를 하면 아임포트 모듈이 다시 렌더링됩니다.
         * 하지만 pushReplacementNamed 함수를 사용하면, 결제/본인인증 직전 화면으로 넘어가게 됩니다.
         */
        // callback: (Map<String, String> result) {
        //   Navigator.pushReplacementNamed(
        //     context,
        //     '/result',
        //     arguments: result,
        //   );
        // },
        // 우선 backend 테스트를 위해 아래와 같이 작성
        http.post(
          Uri.parse("http://192.168.1.3:8080/sottie/certifications"),
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(result)
        );

        // TODO Certification 데이터 객체 받아서 User 데이터를 save 하는 쪽으로 넘겨주기
      },
    );
  }
}
