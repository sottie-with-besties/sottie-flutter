import 'dart:io';

import 'package:http/http.dart';
import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/interface/in_chat_repository_interface.dart';

final class InChatRepoImplDev implements InChatRepository {
  @override
  Future<InChatEventListModel> getInChatEventList({
    required String roomId,
  }) async {
    // TODO: implement getInChatEventListBefore
    throw UnimplementedError();
  }

  @override
  Future<List<InChatEventModel>> getInChatEventListBefore({
    required String roomId,
    required String lastEventId,
  }) {
    // TODO: implement getInChatEventListBefore
    throw UnimplementedError();
  }

  @override
  Future<void> sendImage({
    required String roomId,
    required List<String> imagePaths,
  }) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/chat/images",
    );

    final request = MultipartRequest('POST', uri);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields['roomId'] = roomId;

    for (var i = 0; i < imagePaths.length; i++) {
      request.files.add(
        MultipartFile.fromBytes(
          'image_${i + 1}',
          await File(imagePaths[i]).readAsBytes(),
          filename: imagePaths[i].split('/').last,
        ),
      );
    }

    await ApiEnv().authClient.send(request);
  }
}
