import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/form_button.dart';
import 'package:news_blog1/widgets/input_field.dart';

import '../constants.dart';

class CreateArticleScreen extends StatefulWidget {
  static const String id = 'create_article_screen';
  const CreateArticleScreen({super.key});

  @override
  State<CreateArticleScreen> createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  final List<String> categories = [
    'Technology',
    'Fashion',
    'Sports',
    'Science'
  ];

  String? uploadedAudioName;
  String? uploadedCoverImage;

  late String dropdownValue;
  bool showUploadAudioButton = false;

  @override
  void initState() {
    super.initState();
    dropdownValue = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Create New Article',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
        elevation: 4,
        shadowColor: kOrangeColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 20, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async{
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'png', 'jpeg'],
                    );

                    if (result != null) {
                      setState(() {
                        uploadedCoverImage = result.files.single.name;
                      });
                    }
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    strokeWidth: 2,
                    dashPattern: const [4, 4],
                    radius: const Radius.circular(20),
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_outlined,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text('Add Article Cover',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Center(child: Text(uploadedCoverImage ?? '')))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Title',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                const InputField(
                  obscure: false,
                  placeholder: 'Enter a '
                      'title',
                  textCapitalization: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                const InputField(
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField<String>(
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFEDEBEB),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.red, width: 2.0), // Set the width here
                      borderRadius: BorderRadius.circular(20.0), // Set the
                      // border radius here
                    ),
                  ),
                  value: dropdownValue,
                  items: categories.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Transform.scale(
                  alignment: Alignment.bottomLeft,
                  scaleX: 1.2,
                  scaleY: 1.0,
                  child: Switch.adaptive(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: showUploadAudioButton,
                    activeColor: Colors.red,
                    inactiveTrackColor: const Color(0xFFEDEBEB),
                    onChanged: (bool value) {
                      setState(() {
                        showUploadAudioButton = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                showUploadAudioButton ? Row(
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color(0xFFEDEBEB)),
                      ),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf', 'doc'],
                        );

                        if (result != null) {
                          setState(() {
                            uploadedAudioName = result.files.single.name;
                          });
                        }
                      },
                      child: const Text(
                        'Upload Audio',
                        style: TextStyle(color: Colors.black54,
                        fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: Text(uploadedAudioName ?? 'No file chosen', style:
                      const TextStyle(fontSize:
                      14.0),),
                    ),
                  ],
                ) : const SizedBox(),
                const SizedBox(height: 40.0,),
                const FormButton(buttonText: 'Publish')
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
