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
import 'package:sottie_flutter/data/user/model/user_gender.dart';
import 'package:sottie_flutter/domain/auth/sign_up_entity.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({
    super.key,
    required this.isModifyInfo,
  });

  // 회원가입이 아닌 More 스크린에서 내 정보 새로 인증할 때
  final bool isModifyInfo;

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

          // 본인인증 스크린 예외 처리
          if (result['imp_success'] == 'false') {
            showSnackBar(context, "본인인증 에러가 발생하였습니다.");
            return;
          }

          try {
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

            if (isModifyInfo) {
              myInfoEntity.name = res.data['name'];
              myInfoEntity.gender =
                  UserGender.values.byName(res.data['gender']);
              myInfoEntity.phoneNumber = res.data['phoneNumber'];
              myInfoEntity.identifier = res.data['identifier'];
              myInfoEntity.birthYear = res.data['birthYear'];
              myInfoEntity.phoneAuthenticated = res.data['phoneAuthenticated'];

              // 개인정보 변경에서 수정된 정보는 개인 정보 수정 스크린에서 pop을 한 후 진행
            } else {
              signUpEntity.name = res.data['name'];
              signUpEntity.gender =
                  UserGender.values.byName(res.data['gender']);
              signUpEntity.phoneNumber = res.data['phoneNumber'];
              signUpEntity.identifier = res.data['identifier'];
              signUpEntity.birthYear = res.data['birthYear'];
              signUpEntity.phoneAuthenticated = res.data['phoneAuthenticated'];

              // 최종 정보를 다시 보내는 코드 => api, 헤더 및 데이터 재확인
              await Dio().post(
                "$serverIp/sottie/certifications",
                data: jsonEncode(signUpEntity.toJson()),
              );
            }
          } on Exception catch (_) {
            if (context.mounted) {
              showSnackBar(context, "본인인증 도중 에러가 발생하였습니다.");
            }
          }

          if (context.mounted) {
            if (isModifyInfo) {
              showSnackBar(context, '정보 수정 완료');
              context.go(
                  '${CustomRouter.morePath}/${CustomRouter.infoModifyPath}');
            } else {
              context.go(CustomRouter.verificationCompletePath);
            }
          }
        },
      ),
    );
  }
}
