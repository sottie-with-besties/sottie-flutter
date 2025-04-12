import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_event_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

/// 채팅방 컨텐츠 위젯 (텍스트, 이미지, 동영상 등)
class InChatContents extends StatelessWidget {
  const InChatContents({
    super.key,
    required this.inChatData,
    required this.isMyMessage,
    this.onTap,
  });

  final InChatDataEntity inChatData;
  final bool isMyMessage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
          minWidth: 50 * wu,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isMyMessage ? mainBlueColor : mainWhiteSilverColor,
            borderRadius: BorderRadius.circular(8),
            border:
                isMyMessage
                    ? null
                    : Border.all(color: mainGreyColor.withOpacity(0.3)),
          ),
          padding: const EdgeInsets.all(12),
          child: _buildContentByType(),
        ),
      ),
    );
  }

  Widget _buildContentByType() {
    switch (inChatData.inChatDataType) {
      case InChatDataType.TEXT:
        return Text(
          inChatData.contents,
          style: TextStyle(
            color: isMyMessage ? mainWhiteSilverColor : mainBlackColor,
          ),
        );

      case InChatDataType.IMAGE:
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                inChatData.contents,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 150 * hu,
                    child: Center(
                      child: CircularProgressIndicator(
                        value:
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                        color:
                            isMyMessage ? mainWhiteSilverColor : mainBlueColor,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100 * hu,
                    width: 150 * wu,
                    color: mainGreyColor.withOpacity(0.3),
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        color:
                            isMyMessage ? mainWhiteSilverColor : mainBlackColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 4 * hu),
            Text(
              "이미지",
              style: TextStyle(
                color: isMyMessage ? mainWhiteSilverColor : mainBlackColor,
                fontSize: 12 * hu,
              ),
            ),
          ],
        );

      case InChatDataType.VIDEO:
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    // 실제 구현 시 영상의 썸네일 URL로 변경해야 합니다
                    inChatData.contents,
                    fit: BoxFit.cover,
                    height: 150 * hu,
                    width: 200 * wu,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 150 * hu,
                        width: 200 * wu,
                        color: mainGreyColor.withOpacity(0.3),
                        child: Center(
                          child: CircularProgressIndicator(
                            value:
                                loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                            color:
                                isMyMessage
                                    ? mainWhiteSilverColor
                                    : mainBlueColor,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 150 * hu,
                        width: 200 * wu,
                        color: mainGreyColor.withOpacity(0.3),
                        child: Center(
                          child: Icon(
                            Icons.videocam_off,
                            color:
                                isMyMessage
                                    ? mainWhiteSilverColor
                                    : mainBlackColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: mainBlackColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.play_arrow,
                    color: mainWhiteSilverColor,
                    size: 24 * hu,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4 * hu),
            Text(
              "동영상",
              style: TextStyle(
                color: isMyMessage ? mainWhiteSilverColor : mainBlackColor,
                fontSize: 12 * hu,
              ),
            ),
          ],
        );

      case InChatDataType.FILE:
        return Container(
          decoration: BoxDecoration(
            color:
                isMyMessage
                    ? mainBlueColor.withOpacity(0.7)
                    : mainGreyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.insert_drive_file,
                color: isMyMessage ? mainWhiteSilverColor : mainBlueColor,
              ),
              SizedBox(width: 8 * wu),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 실제 구현 시 파일 이름 추출 로직이 필요할 수 있습니다
                      _extractFileName(inChatData.contents),
                      style: TextStyle(
                        color:
                            isMyMessage ? mainWhiteSilverColor : mainBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "파일 다운로드",
                      style: TextStyle(
                        color:
                            isMyMessage
                                ? mainWhiteSilverColor.withOpacity(0.8)
                                : mainBlackColor.withOpacity(0.7),
                        fontSize: 12 * hu,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }

  // URL에서 파일 이름 추출하는 간단한 메서드
  String _extractFileName(String url) {
    try {
      return url.split('/').last;
    } catch (_) {
      return '파일';
    }
  }
}
