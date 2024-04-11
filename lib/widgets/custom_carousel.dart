import 'package:flutter/material.dart';
import 'dart:async';

import 'custom_indicator.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key, required this.images, required this
      .activeIndicatorBeginColor, required this.activeIndicatorEndColor, this
      .isAudioArticle = false});

  final List<String> images;
  final Color activeIndicatorBeginColor;
  final Color activeIndicatorEndColor;
  final bool isAudioArticle;

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
        widget.isAudioArticle ? Stack(
          children: [
            SizedBox(
              height: 180, // Height of the carousel
              child: PageView.builder(
                controller: _controller,
                itemCount: widget.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.images[index],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:
                            10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        trackShape: const RectangularSliderTrackShape(),
                                        thumbShape: const RoundSliderThumbShape(
                                            enabledThumbRadius: 0.0),
                                        overlayShape:
                                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                                      ),
                                      child: Slider(
                                        activeColor: Colors.white,
                                        inactiveColor: Colors.grey,
                                        value: 50,
                                        max: 100,
                                        divisions: 100,
                                        label: "20",
                                        onChanged: (double value) {},
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    '40:15',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
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
          ],
        ) :
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
