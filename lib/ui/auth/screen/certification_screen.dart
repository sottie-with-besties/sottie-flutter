import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/* 아임포트 휴대폰 본인인증 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_certification.dart';
/* 아임포트 휴대폰 본인인증 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/certification_data.dart';
import 'package:sottie_flutter/core/constant/server_ip.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/auth/email_verification.dart';
import 'package:sottie_flutter/domain/auth/sign_up_entity.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({
    super.key,
    required this.isEmailLogin,
  });

  final bool isEmailLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IamportCertification(
        appBar: AppBar(
          title: const Text('Sottie 본인인증'),
        ),
        /* 웹뷰 로딩 컴포넌트 */
        initialChild: const Center(
          child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
        ),
        /* [필수입력] 가맹점 식별코드 */
        userCode: 'iamport',
        /* [필수입력] 본인인증 데이터 */
        data: CertificationData(
          pg: 'inicis_unified', // PG사
          merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
          mRedirectUrl: 'https://example.com',
        ), // 본인인증 후 이동할 URL,
        /* [필수입력] 콜백 함수 */
        callback: (Map<String, String> result) async {
          log(result.toString(), name: "Callback Argument");

          // result를 그대로 백엔드로 보내 response를 전달받는다.
          final res = await Dio().post(
            "$serverIp/sottie/certifications",
            data: jsonEncode(result),
            options: Options(
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              receiveTimeout: const Duration(seconds: 10),
            ),
          );

          log(res.toString(), name: "Response");

          // 값 주입
          signUpEntity.name = res.data['name'];
          // signUpEntity.gender = Gender.values.byName(res.data['gender']); 성별은 잠시 제외하겠습니다
          signUpEntity.phoneNumber = res.data['phoneNumber'];
          signUpEntity.identifier = res.data['identifier'];
          signUpEntity.birthYear = res.data['birthYear'];
          signUpEntity.phoneAuthenticated = res.data['phoneAuthenticated'];

          // 이메일로 회원가입 했다면 파이어베이스 이메일 내역을 삭제한다.
          isEmailLogin
              ? await deleteEmailUser(
                  signUpEntity.email!,
                  signUpEntity.password!,
                )
              : null;

          // Todo: 최종 정보를 다시 보내는 코드 => api, 헤더 및 데이터 재확인, 성별 잠시 제외
          await Dio().post(
            "$serverIp/sottie/certifications",
            data: jsonEncode(signUpEntity.toJson()),
          );

          if (context.mounted) {
            context.go(CustomRouter.verificationCompletePath);
          }
        },
      ),
    );
  }
}
