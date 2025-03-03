import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/entity/post_pagination_entity.dart';
import 'package:sottie_flutter/provider/home/home_latest_post_provider.dart';
import 'package:sottie_flutter/provider/home/home_search_post_provider.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/home/controller/home_state_controller.dart';
import 'package:sottie_flutter/ui/post/widget/post.dart';

class HomeContentScreen extends ConsumerWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (homeState == HomePostState.home) ...[
          _subTitle("# 최신 모집글"),
          _PostPaginationListView(postProvider: homeLatestPostProvider),
        ],
        if (homeState == HomePostState.search) ...[
          _subTitle("# 검색 결과"),
          _PostPaginationListView(postProvider: homeSearchPostProvider),
        ],
      ],
    );
  }
}

/// 포스트 페이지네이션 리스트뷰
class _PostPaginationListView extends ConsumerStatefulWidget {
  const _PostPaginationListView({required this.postProvider});

  final NotifierProvider<dynamic, PostPaginationEntity> postProvider;

  @override
  ConsumerState<_PostPaginationListView> createState() =>
      _PostPaginationListViewState();
}

class _PostPaginationListViewState
    extends ConsumerState<_PostPaginationListView> {
  final _paginationController = ScrollController();

  bool _isLatestProvider() =>
      widget.postProvider.runtimeType ==
      NotifierProvider<HomeLatestPost, PostPaginationEntity>;

  bool _canPagination = true;

  /// 스크롤을 내려서 자동으로 페이지네이션
  void _cursorPagination() {
    if (_paginationController.offset >
            _paginationController.position.maxScrollExtent - 200 &&
        _canPagination) {
      EasyThrottle.throttle('postPagination', const Duration(seconds: 1), () {
        if (_isLatestProvider()) {
          final provider =
              widget.postProvider
                  as NotifierProvider<HomeLatestPost, PostPaginationEntity>;
          ref.read(provider.notifier).latestPagination();
        } else {
          final provider =
              widget.postProvider
                  as NotifierProvider<HomeSearchPost, PostPaginationEntity>;
          ref.read(provider.notifier).searchPagination();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    /// 홈 화면 들어가자 마자 최신 모집글 불러오기
    if (widget.postProvider.runtimeType ==
        NotifierProvider<HomeLatestPost, PostPaginationEntity>) {
      final provider =
          widget.postProvider
              as NotifierProvider<HomeLatestPost, PostPaginationEntity>;

      ref.read(provider.notifier).latestPagination(firstFetch: true);
    }

    _paginationController.addListener(_cursorPagination);
  }

  @override
  void dispose() {
    super.dispose();
    _paginationController.dispose();
    _paginationController.removeListener(_cursorPagination);
  }

  @override
  Widget build(BuildContext context) {
    final postPaginationModel = ref.watch(widget.postProvider);

    return Expanded(
      child: ListView.builder(
        controller: _paginationController,
        itemCount: postPaginationModel.postEntityList.length + 1,
        itemBuilder: (_, index) {
          if (index == postPaginationModel.postEntityList.length) {
            final paginationState = postPaginationModel.postPaginationState;

            if (paginationState == PostPaginationState.firstLoading) {
              return const LoadingSkeleton();
            } else if (paginationState == PostPaginationState.loading) {
              return const Center(
                child: CircularProgressIndicator(color: mainBlackColor),
              );
            } else if (paginationState == PostPaginationState.fetch) {
              return Container();
            } else {
              /// 데이터가 더 이상 없을 때
              if (postPaginationModel.errorCode == "데이터가 더 이상 존재하지 않습니다") {
                _canPagination = false;
                return const Center(child: Text("데이터가 더 이상 존재하지 않습니다"));
              } else {
                /// 그 외 다른 오류
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("모집글을 불러오는 도중 에러가 발생했습니다"),
                    TextButton(
                      onPressed: () async {
                        if (_isLatestProvider()) {
                          final provider =
                              widget.postProvider
                                  as NotifierProvider<
                                    HomeLatestPost,
                                    PostPaginationEntity
                                  >;
                          ref
                              .read(provider.notifier)
                              .latestPagination(
                                firstFetch:
                                    postPaginationModel.postEntityList.isEmpty
                                        ? true
                                        : false,
                              );
                        } else {
                          final provider =
                              widget.postProvider
                                  as NotifierProvider<
                                    HomeSearchPost,
                                    PostPaginationEntity
                                  >;
                          ref
                              .read(provider.notifier)
                              .searchPagination(
                                firstFetch:
                                    postPaginationModel.postEntityList.isEmpty
                                        ? true
                                        : false,
                              );
                        }
                      },
                      child: const Text("다시 시도"),
                    ),
                  ],
                );
              }
            }
          } else {
            return Post(
              entity: postPaginationModel.postEntityList[index],
              // Todo: 모집글 구분 기준 필요
              // 1. 내가 만든 모집글인가?
              // 2. 현재 참여 대기중 또는 참여하고 있는 모집글인가?
              isWaiting: false,
            );
          }
        },
      ),
    );
  }
}

Widget _subTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}
