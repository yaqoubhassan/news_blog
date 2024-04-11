import 'package:flutter/material.dart';
import 'dart:async';

import 'custom_indicator.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key, required this.images, required this
      .activeIndicatorBeginColor, required this.activeIndicatorEndColor});

  final List<String> images;
  final Color activeIndicatorBeginColor;
  final Color activeIndicatorEndColor;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});

    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_currentPage < widget.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180, // Height of the carousel
          // width: MediaQuery.of(context).size.width * 0.8,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.only(right: 30.0),
                // color: Colors.red,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            },
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10), // Space between carousel and indicator
        CustomIndicator(
          imagesLength: widget.images.length,
          controller: _controller,
          activeIndicatorBeginColor: widget.activeIndicatorBeginColor,
          activeIndicatorEndColor: widget.activeIndicatorEndColor,
        ),
      ],
    );
  }
}
