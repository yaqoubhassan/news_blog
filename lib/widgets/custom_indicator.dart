import 'package:flutter/material.dart';


class CustomIndicator extends StatefulWidget {
  const CustomIndicator({super.key, required this.imagesLength, required this
      .controller, required this.activeIndicatorBeginColor, required
  this.activeIndicatorEndColor});

  final int imagesLength;
  final PageController controller;
  final Color activeIndicatorBeginColor;
  final Color activeIndicatorEndColor;

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _currentPage = widget.controller.page!.round() + 1;
      });
    });
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );}

  @override
  void dispose() {
    _animationController.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.imagesLength, (idx) {
        double distanceFromActive = (_currentPage - 1 - idx).abs().toDouble();
        double sizeFactor = (5 - distanceFromActive) / 5;
        return AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 15 * sizeFactor, // Assuming 15 is the size of the largest indicator
          height: 15 * sizeFactor,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (idx + 1 == _currentPage)
                ? ColorTween(
              begin: widget.activeIndicatorBeginColor,
              end: widget.activeIndicatorEndColor,
            ).animate(CurvedAnimation(
              parent: _animationController,
              curve: Curves.ease,
            )).value
                : Colors.black54,
          ),
          duration: const Duration(
            milliseconds: 300,
          ),
        );
      }),
    );
  }
}
