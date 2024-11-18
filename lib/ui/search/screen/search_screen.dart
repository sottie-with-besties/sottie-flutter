import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/data/post/model/post_setting.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/domain/search/search_post.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/post/widget/option/age_range_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/category_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/gender_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/location_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/manner_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/num_of_member_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/only_my_friends_option.dart';
import 'package:sottie_flutter/ui/search/widget/date_range_option.dart';
import 'package:sottie_flutter/ui/search/widget/date_time_reset_button.dart';
import 'package:sottie_flutter/ui/search/widget/time_range_option.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchFocusNode = FocusNode();
  final settingFocusNode = FocusNode();
  final searchController = TextEditingController();

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
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: searchFocusNode.unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: LocalTextField(
                hint: "날짜, 장소, 제목, 내용...",
                focusNode: searchFocusNode,
                controller: searchController,
                onFieldSubmitted: (searchContent) async {
                  postSettingEntity.title = searchContent;
                  await searchPost(); // Todo: 함수 구현해야함
                },
                suffixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      showCustomDialog(
                        context,
                        GestureDetector(
                          onTap: settingFocusNode.unfocus,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CategoryOption(),
                              SizedBox(height: 20),
                              LocationOption(),
                              SizedBox(height: 20),
                              DateRangeOption(),
                              SizedBox(height: 20),
                              TimeRangeOption(),
                              SizedBox(height: 10),
                              DateTimeResetButton(),
                              SizedBox(height: 10),
                              NumOfMemberOption(),
                              SizedBox(height: 20),
                              GenderOption(),
                              SizedBox(height: 20),
                              AgeOption(),
                              SizedBox(height: 20),
                              MannerOption(),
                              SizedBox(height: 20),
                              OnlyMyFriendsOption(),
                              SizedBox(height: 80),
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
            ),
          ],
        ),
      ),
    );
  }
}
