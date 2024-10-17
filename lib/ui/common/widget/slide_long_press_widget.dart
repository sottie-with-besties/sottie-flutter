import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';

class SlideLongPressWidget extends StatefulWidget {
  const SlideLongPressWidget({
    super.key,
    required this.onLongPressWidget,
    required this.slideActions,
    required this.groupTag,
    required this.child,
  });

  final Widget onLongPressWidget;
  final List<Widget> slideActions;
  final String groupTag;
  final Widget child;

  @override
  State<SlideLongPressWidget> createState() => _SlideLongPressWidgetState();
}

class _SlideLongPressWidgetState extends State<SlideLongPressWidget>
    with TickerProviderStateMixin {
  late SlidableController _slidableController;

  @override
  void initState() {
    _slidableController = SlidableController(this)..dismissGesture;
    super.initState();
  }

  @override
  void dispose() {
    _slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.key),
      closeOnScroll: false,
      groupTag: widget.groupTag,
      controller: _slidableController,
      endActionPane: ActionPane(
        dragDismissible: false,
        motion: const DrawerMotion(),
        children: widget.slideActions,
      ),
      child: Material(
        color: mainWhiteSilverColor,
        child: InkWell(
          onLongPress: () {
            showCustomDialog(
              context,
              widget.onLongPressWidget,
              color: Colors.transparent,
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}
