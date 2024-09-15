import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/dm/model/dm_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class DmChatRoom extends StatelessWidget {
  const DmChatRoom({
    super.key,
    required this.model,
  });

  final DmModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mainSilverColor,
      child: InkWell(
        onTap: () {
          context.push(
            '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
            extra: {
              'id': model.id,
              'title': model.name,
              'isGenerated': true,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 70 * hu,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RandomAvatar(
                      DateTime.now().toIso8601String(),
                      width: 45 * hu,
                      height: 45 * hu,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12 * hu,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          model.latestMsg,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10 * hu,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IntrinsicHeight(
                  child: SizedBox(
                    width: 60 * wu,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.latestTime,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10 * hu,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 40 * wu,
                          height: 25 * hu,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.redAccent.withOpacity(0.8),
                          ),
                          child: Center(
                            child: Text(
                              model.notReadMsg.toString(),
                              style: const TextStyle(
                                color: mainSilverColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
