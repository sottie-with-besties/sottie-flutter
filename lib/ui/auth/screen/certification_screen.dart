import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portone_flutter/Iamport_certification.dart';
import 'package:portone_flutter/model/certification_data.dart';
/* 아임포트 휴대폰 본인인증 모듈을 불러옵니다. */
/* 아임포트 휴대폰 본인인증 데이터 모델을 불러옵니다. */
import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/auth/controller/sign_up_controller.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({
    super.key,
    required this.isModifyInfo,
    required this.isOauthSignUp,
  });

  // 회원가입이 아닌 More 스크린에서 내 정보 새로 인증할 때
  final bool isModifyInfo;
  final bool isOauthSignUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IamportCertification(
        appBar: AppBar(title: const Text('Sottie 본인인증')),
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
        ),
        // 본인인증 후 이동할 URL,
        /* [필수입력] 콜백 함수 */
        callback: (Map<String, String> result) async {
          log(result.toString(), name: "Callback Argument");

          // 본인인증 스크린 예외 처리
          if (result['imp_success'] == 'false') {
            ModalController.showCustomSnackBar(context, "본인인증 에러가 발생하였습니다.");
            return;
          }

          try {
            // result를 그대로 백엔드로 보내 response를 전달받는다.

            final res = await Dio().post(
              "$devServerIp/sottie/certifications",
              data: jsonEncode(result),
              options: Options(
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                receiveTimeout: const Duration(seconds: 10),
              ),
            );

            log(res.toString(), name: "Response");

            if (isModifyInfo) {
              SignUpController.signUpModel.name = res.data['name'];
              SignUpController.signUpModel.gender = res.data['gender'];
              SignUpController.signUpModel.phoneNumber =
                  res.data['phoneNumber'];
              SignUpController.signUpModel.identifier = res.data['identifier'];
              SignUpController.signUpModel.birthYear = res.data['birthYear'];
              SignUpController.signUpModel.phoneAuthenticated =
                  res.data['phoneAuthenticated'];

              /// Todo: 내 정보를 로컬DB(ISAR)에 저장 및 서버 전송
            } else {
              // 소셜 로그인
              if (isOauthSignUp) {
                SignUpController.signUpModel.name = res.data['name'];
                SignUpController.signUpModel.gender = res.data['gender'];
                SignUpController.signUpModel.phoneNumber =
                    res.data['phoneNumber'];
                SignUpController.signUpModel.identifier =
                    res.data['identifier'];
                SignUpController.signUpModel.birthYear = res.data['birthYear'];
                SignUpController.signUpModel.phoneAuthenticated =
                    res.data['phoneAuthenticated'];
              } else {
                // 이메일 로그인
                SignUpController.signUpModel.name = res.data['name'];
                SignUpController.signUpModel.gender = res.data['gender'];
                SignUpController.signUpModel.phoneNumber =
                    res.data['phoneNumber'];
                SignUpController.signUpModel.identifier =
                    res.data['identifier'];
                SignUpController.signUpModel.birthYear = res.data['birthYear'];
                SignUpController.signUpModel.phoneAuthenticated =
                    res.data['phoneAuthenticated'];
              }
            }
          } on Exception catch (_) {
            if (context.mounted) {
              ModalController.showCustomSnackBar(
                context,
                "본인인증 도중 에러가 발생하였습니다.",
              );
            }
          }

          if (context.mounted) {
            if (isModifyInfo) {
              ModalController.showCustomSnackBar(context, '정보 수정 완료');
              context.go(
                '${CustomRouter.morePath}/${CustomRouter.infoModifyPath}',
              );
            } else {
              context.go(CustomRouter.verificationCompletePath);
            }
          }
        },
      ),
    );
  }
}
