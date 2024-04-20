import 'package:flutter/material.dart';
import 'package:news_blog1/widgets/footer.dart';

import '../utilities/constants.dart';


class AudioNewsDetails extends StatefulWidget {
  static const String id = 'audio_news_details';
  const AudioNewsDetails({super.key});

  @override
  State<AudioNewsDetails> createState() => _AudioNewsDetailsState();
}

class _AudioNewsDetailsState extends State<AudioNewsDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
        elevation: 4,
        shadowColor: kOrangeColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 40.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/tech1.jpg'),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    const Text('10:20'),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackShape: const RectangularSliderTrackShape(),
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 0.0),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 0.0),
                            ),
                            child: Slider(
                              activeColor: kOrangeColor,
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
                    ),
                    const Text('40:18'),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: const Icon(
                          Icons.rotate_left,
                          size: 30.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: const Icon(
                          Icons.skip_previous,
                          size: 30.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kOrangeColor,
                        ),
                        child: const Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: const Icon(
                          Icons.skip_next,
                          size: 30.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: const Icon(
                          Icons.rotate_right,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
