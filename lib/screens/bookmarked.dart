import 'package:flutter/material.dart';
import 'package:news_blog1/widgets/cards/custom_card.dart';

import '../utilities/constants.dart';

class BookMarked extends StatefulWidget {
  static const String id = 'bookmarked';
  const BookMarked({super.key});

  @override
  State<BookMarked> createState() => _BookMarkedState();
}

class _BookMarkedState extends State<BookMarked> {
  final List<String> sortOptions = [
    'Most Recent',
    'Ascending',
    'Descending'
  ];

  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = sortOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Bookmarked',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
        elevation: 4,
        shadowColor: kOrangeColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sort by',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    DropdownButton<String>(
                      style: const TextStyle(fontSize: 20, fontWeight:
                      FontWeight.w600,
                          color: Colors
                          .black),
                      focusColor: kOrangeColor,
                      dropdownColor: const Color(0xFFEDEBEB),
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            showCloseIcon: true,
                            closeIconColor: Colors.black,
                            width: 300.0,
                            // margin: const EdgeInsets.symmetric(horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            elevation: 20.0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: const Color(0xFFE1E1E0),
                            content:  Center(
                              child: Text( dropdownValue,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      items: sortOptions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                const SizedBox(height: 15.0,),
                const CustomCard(category: 'Sports', title: 'NHL1 roundup: Mika '
                    'Zibanejad\'s record night powers Rangers', date: '12 Apr'
                    ' 2024', imagePath: 'assets/images/ronaldo.jpg',
                    showDivider: true, isBookmarked: true),
                const SizedBox(height: 10,),
                const CustomCard(category: 'Sports', title: 'NHL1 roundup: Mika '
                    'Zibanejad\'s record night powers Rangers', date: '12 Apr'
                    ' 2024', imagePath: 'assets/images/ronaldo.jpg',
                    showDivider: true, isBookmarked: true),
                const SizedBox(height: 10,),
                const CustomCard(category: 'Sports', title: 'NHL1 roundup: Mika '
                    'Zibanejad\'s record night powers Rangers', date: '12 Apr'
                    ' 2024', imagePath: 'assets/images/ronaldo.jpg',
                    showDivider: true, isBookmarked: true),
                const SizedBox(height: 10,),
                const CustomCard(category: 'Sports', title: 'NHL1 roundup: Mika '
                    'Zibanejad\'s record night powers Rangers', date: '12 Apr'
                    ' 2024', imagePath: 'assets/images/ronaldo.jpg',
                    showDivider: true, isBookmarked: true),
                const SizedBox(height: 10,),
                const CustomCard(category: 'Sports', title: 'NHL1 roundup: Mika '
                    'Zibanejad\'s record night powers Rangers', date: '12 Apr'
                    ' 2024', imagePath: 'assets/images/ronaldo.jpg',
                    showDivider: true, isBookmarked: true),
                const SizedBox(height: 10,),
                const CustomCard(category: 'Sports', title: 'NHL1 roundup: Mika '
                    'Zibanejad\'s record night powers Rangers', date: '12 Apr'
                    ' 2024', imagePath: 'assets/images/ronaldo.jpg',
                    showDivider: false, isBookmarked: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
