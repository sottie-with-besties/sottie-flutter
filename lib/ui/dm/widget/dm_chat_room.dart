import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/dm/model/dm_model.dart';

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
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RandomAvatar(
                      DateTime.now().toIso8601String(),
                      width: 50,
                      height: 50,
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(model.latestMsg),
                      ],
                    ),
                  ],
                ),
                IntrinsicHeight(
                  child: SizedBox(
                    width: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.latestTime,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.redAccent.withOpacity(0.8),
                          ),
                          child: Center(
                            child: Text(
                              model.notReadMsg.toString(),
                              style: const TextStyle(
                                color: mainSilverColor,
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
