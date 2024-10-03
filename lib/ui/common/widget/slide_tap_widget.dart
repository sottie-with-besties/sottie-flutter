import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';

class SlideTapWidget extends StatefulWidget {
  const SlideTapWidget({
    super.key,
    required this.onTap,
    required this.onLongPressWidget,
    required this.slideActions,
    required this.groupTag,
    this.height = 75,
    required this.child,
  });
  final VoidCallback onTap;
  final Widget onLongPressWidget;
  final List<Widget> slideActions;
  final String groupTag;
  final double height;
  final Widget child;

  @override
  State<SlideTapWidget> createState() => _SlideTapWidgetState();
}

class _SlideTapWidgetState extends State<SlideTapWidget>
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
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: mainSilverColor,
        ),
        height: widget.height * hu,
        child: Material(
          color: mainSilverColor,
          child: InkWell(
            onTap: widget.onTap,
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
      ),
    );
  }
}
