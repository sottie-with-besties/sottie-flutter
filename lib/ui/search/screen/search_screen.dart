import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/data/post/model/post_setting.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/post/widget/classification/age_range_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/category_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/date_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/gender_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/location_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/manner_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/num_of_member_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/only_my_friends_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/open_participation_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/start_same_time_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/time_class.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchFocusNode = FocusNode();
  final settingFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    postSettingEntity = PostSetting();
    searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    settingFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: searchFocusNode.unfocus,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            LocalTextField(
              hint: "날짜, 장소, 제목, 내용...",
              focusNode: searchFocusNode,
              suffixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    showCustomDialog(
                      context,
                      GestureDetector(
                        onTap: settingFocusNode.unfocus,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CategoryClass(),
                            const SizedBox(height: 20),
                            const LocationClass(),
                            const SizedBox(height: 20),
                            const DateClass(),
                            const SizedBox(height: 20),
                            const TimeClass(),
                            const SizedBox(height: 20),
                            NumOfMemberClass(focusNode: settingFocusNode),
                            const SizedBox(height: 20),
                            const GenderClass(),
                            const SizedBox(height: 20),
                            const AgeClass(),
                            const SizedBox(height: 20),
                            const MannerClass(),
                            const SizedBox(height: 20),
                            const StartSameTimeClass(),
                            const SizedBox(height: 20),
                            const OpenParticipationClass(),
                            const SizedBox(height: 20),
                            const OnlyMyFriendsClass(),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.gear,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
