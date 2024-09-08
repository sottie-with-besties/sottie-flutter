import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class CustomFutureBuilder extends StatefulWidget {
  const CustomFutureBuilder({
    super.key,
    required this.futureFunction,
    required this.callBack,
    this.notHasData = const SizedBox(),
    this.loadingWidget = const LoadingSkeleton(),
    this.errorMessage = '데이터를 가져올 수 없습니다.',
  });

  final Future<dynamic> Function() futureFunction;
  final Widget Function(dynamic data) callBack;
  final Widget notHasData;
  final Widget loadingWidget;
  final String errorMessage;

  @override
  State<CustomFutureBuilder> createState() => _CustomFutureBuilderState();
}

class _CustomFutureBuilderState extends State<CustomFutureBuilder> {
  late final Future<dynamic> futureData;

  @override
  void initState() {
    super.initState();
    futureData = widget.futureFunction();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.loadingWidget;
        } else if (!snapshot.hasData) {
          return widget.notHasData;
        } else if (snapshot.hasData) {
          final data = snapshot.data;

          return widget.callBack(data);
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(widget.errorMessage,
                  style: const TextStyle(color: Colors.black)),
            ),
          );
        }
      },
    );
  }
}
