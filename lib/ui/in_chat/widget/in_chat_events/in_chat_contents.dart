import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

// 채팅방 컨텐츠 위젯 (텍스트, 이미지, 동영상 등)
class InChatContents extends StatelessWidget {
  const InChatContents({
    super.key,
    required this.inChatEventModel,
    required this.isMyMessage,
    this.onTap,
  });

  final InChatEventModel inChatEventModel;
  final bool isMyMessage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
          minWidth: 50 * ScreenSize.wu,
        ),
        child: Container(
          decoration: BoxDecoration(
            color:
                isMyMessage ? AppColors.blueColor : AppColors.whiteSilverColor,
            borderRadius: BorderRadius.circular(8),
            border:
                isMyMessage
                    ? null
                    : Border.all(
                      color: AppColors.greyColor.withValues(alpha: 0.3),
                    ),
          ),
          padding: const EdgeInsets.all(12),
          child: _buildContentByType(),
        ),
      ),
    );
  }

  Widget _buildContentByType() {
    switch (inChatEventModel.inChatDataType) {
      case InChatDataType.TEXT:
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100 * ScreenSize.hu),
          child: SingleChildScrollView(
            child: Text(
              inChatEventModel.contents,
              style: TextStyle(
                color:
                    isMyMessage
                        ? AppColors.whiteSilverColor
                        : AppColors.blackColor,
              ),
            ),
          ),
        );

      // Todo: 이미지를 url로 받아서 페이지뷰로 처리?
      case InChatDataType.IMAGE:
        return ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: inChatEventModel.contents,
            placeholder:
                (context, url) => SizedBox(
                  height: 150 * ScreenSize.hu,
                  child: Center(
                    child: CircularProgressIndicator(
                      color:
                          isMyMessage
                              ? AppColors.whiteSilverColor
                              : AppColors.blueColor,
                    ),
                  ),
                ),
            errorWidget:
                (context, url, error) => Container(
                  height: 100 * ScreenSize.hu,
                  width: 150 * ScreenSize.wu,
                  color: AppColors.greyColor.withValues(alpha: 0.3),
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      color:
                          isMyMessage
                              ? AppColors.whiteSilverColor
                              : AppColors.blackColor,
                    ),
                  ),
                ),
            fit: BoxFit.cover,
          ),
        );

      case InChatDataType.VIDEO:
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    // 실제 구현 시 영상의 썸네일 URL로 변경해야 합니다
                    imageUrl: inChatEventModel.contents,
                    fit: BoxFit.cover,
                    height: 150 * ScreenSize.hu,
                    width: 200 * ScreenSize.wu,
                    placeholder:
                        (context, url) => Container(
                          height: 150 * ScreenSize.hu,
                          width: 200 * ScreenSize.wu,
                          color: AppColors.greyColor.withValues(alpha: 0.3),
                          child: Center(
                            child: CircularProgressIndicator(
                              color:
                                  isMyMessage
                                      ? AppColors.whiteSilverColor
                                      : AppColors.blueColor,
                            ),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          height: 150 * ScreenSize.hu,
                          width: 200 * ScreenSize.wu,
                          color: AppColors.greyColor.withValues(alpha: 0.3),
                          child: Center(
                            child: Icon(
                              Icons.videocam_off,
                              color:
                                  isMyMessage
                                      ? AppColors.whiteSilverColor
                                      : AppColors.blackColor,
                            ),
                          ),
                        ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blackColor.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColors.whiteSilverColor,
                    size: 24 * ScreenSize.hu,
                  ),
                ),
              ],
            ),
          ],
        );
    }
  }
}
