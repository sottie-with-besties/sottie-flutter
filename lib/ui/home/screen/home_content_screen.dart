import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/data_source/latest_post_dummy.dart';
import 'package:sottie_flutter/data/post/data_source/recommend_post_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';
import 'package:sottie_flutter/domain/home/home_latest_post_provider.dart';
import 'package:sottie_flutter/domain/home/home_search_post_provider.dart';
import 'package:sottie_flutter/domain/home/home_state_provider.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/post/widget/post.dart';

class HomeContentScreen extends ConsumerWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);
    final homeSearchPostPagination = ref.watch(homeSearchPostProvider);

    if (homeState == HomePostState.home) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _subTitle("# 최신 모집글"),
          // _PostPaginationListView(postProvider: homeLatestPostProvider),
          CustomFutureBuilder(
            futureFunction: () async => getLatestPostDummy(null),
            callBack: (futureData) => Column(
              children: futureData!
                  .map<Widget>((data) => Post(
                        model: data,
                        isWaiting: false,
                      ))
                  .toList(),
            ),
          ),
          _subTitle("# 추천 모집글"),
          CustomFutureBuilder(
            futureFunction: () async => getRecommendPostDummy(null),
            callBack: (futureData) => Column(
              children: futureData!
                  .map<Widget>((data) => Post(
                        model: data,
                        isWaiting: false,
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _subTitle("# 검색 결과"),
          SizedBox(
            height: 450 * hu,
            child: ListView.builder(
              itemCount: homeSearchPostPagination.postModelList.length + 1,
              itemBuilder: (_, index) {
                if (index == homeSearchPostPagination.postModelList.length) {
                  final paginationState =
                      homeSearchPostPagination.postPaginationState;

                  if (paginationState == PostPaginationState.loading) {
                    return const Center(
                        child:
                            CircularProgressIndicator(color: mainBlackColor));
                  } else if (paginationState == PostPaginationState.fetch) {
                    return TextButton(
                      onPressed: () async {
                        await ref
                            .read(homeSearchPostProvider.notifier)
                            .searchPagination();
                      },
                      child: const Text("더 보기"),
                    );
                  } else {
                    /// 에러 발생 시
                    if (homeSearchPostPagination.errorCode ==
                        "데이터가 더 이상 존재하지 않습니다") {
                      return const Center(
                        child: Text("데이터가 더 이상 존재하지 않습니다"),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("에러가 발생했습니다"),
                          TextButton(
                            onPressed: () async {
                              await ref
                                  .read(homeSearchPostProvider.notifier)
                                  .searchPagination();
                            },
                            child: const Text("다시 시도"),
                          ),
                        ],
                      );
                    }
                  }
                } else {
                  return Post(
                    model: homeSearchPostPagination.postModelList[index],
                    // Todo: 모집글 구분 기준 필요
                    // 1. 내가 만든 모집글인가?
                    // 2. 현재 참여 대기중 또는 참여하고 있는 모집글인가?
                    isWaiting: false,
                  );
                }
              },
            ),
          ),
        ],
      );
    }
  }
}

// 최신 모집글, 추천 모집글 페이지네이션 전용
class _PostPaginationListView extends ConsumerWidget {
  const _PostPaginationListView({required this.postProvider});

  final AsyncNotifierProvider<HomeLatestPost, PostPaginationModel> postProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postPaginationModel = ref.watch(postProvider);

    return postPaginationModel.when(
      data: (postPagination) {
        final postList = postPagination.postModelList;
        final postPaginationState = postPagination.postPaginationState;

        return SizedBox(
          height: 200 * hu,
          child: ListView.builder(
            itemCount: postList.length + 1,
            itemBuilder: (_, index) {
              if (index == postList.length) {
                return TextButton(
                    onPressed: () {
                      log("더 보기");
                    },
                    child: const Text("더 보기"));
              } else {
                return Post(
                  model: postList[index],
                  // Todo: 모집글 구분 기준 필요
                  // 1. 내가 만든 모집글인가?
                  // 2. 현재 참여 대기중 또는 참여하고 있는 모집글인가?
                  isWaiting: false,
                );
              }
            },
          ),
        );
      },
      error: (_, __) {
        return const Center(
          child: Text("에러가 발생했습니다"),
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator(color: mainBlackColor)),
    );
  }
}

Widget _subTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}
