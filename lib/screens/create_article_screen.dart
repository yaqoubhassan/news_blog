import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/form_button.dart';
import 'package:news_blog1/widgets/input_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/constants.dart';
import 'home.dart';

class CreateArticleScreen extends StatefulWidget {
  static const String id = 'create_article_screen';
  const CreateArticleScreen({super.key});

  @override
  State<CreateArticleScreen> createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  final _formKey = GlobalKey<FormState>();

  late String dropdownValue;
  final List<String> categories = [
    'Technology',
    'Fashion',
    'Sports',
    'Science'
  ];

  bool _isLoading = false;
  bool _coverImageError = false;

  String? uploadedAudioName;
  String? uploadedCoverImageName;
  String? coverImage;
  String? audioFile;

  bool showUploadAudioButton = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void createArticle(
      String title,
      String description,
      String category,
      String? coverImagePath,
      bool isAudioArticle,
      String? audioFilePath) async {
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      var url = Uri.parse("$baseUrl/articles");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Accept'] = 'application/json';
      request.fields['title'] = title;
      request.fields['description'] = description;
      request.fields['category'] = category;
      request.fields['is_audio_article'] =
          isAudioArticle.toString().toLowerCase() == 'true' ? '1' : '0';
      if (coverImagePath != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'cover_image',
          coverImagePath,
        ));
      }
      if (audioFilePath != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'audio_file',
          audioFilePath,
        ));
      }
      var response = await request.send();

      var responseData = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        if (mounted) {
          Fluttertoast.showToast(
            msg: 'Article created successfully!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER, // Center gravity
            backgroundColor: Colors.black54,
            textColor: Colors.white,
          );
          Navigator.pushNamed(context, Home.id);
        }
      } else {
        Map<String, dynamic> responseBody = json.decode(responseData);
        if (responseBody.containsKey('message')) {
          String errorMessage = responseBody['message'];
          if (errorMessage.contains(
              'The cover image field must be a file of type: jpeg, png, jpg.')) {
            setState(() {
              _coverImageError = true;
              _isLoading = false;
            });
          }
        }
        if (kDebugMode) {
          print('Article creation failed: $responseData');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating article: $e');
      }
    }
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      createArticle(
          titleController.text.trim(),
          descriptionController.text.trim(),
          dropdownValue,
          coverImage,
          showUploadAudioButton,
          audioFile);
    }
  }

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
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
        elevation: 4,
        shadowColor: kOrangeColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'png', 'jpeg'],
                      );

                      if (result != null) {
                        setState(() {
                          uploadedCoverImageName = result.files.single.name;
                          File file = File(result.files.single.path!);
                          coverImage = file.path;
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
                                  Text(
                                    'Add Article Cover',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Center(
                                    child: Text(uploadedCoverImageName ?? '')))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Visibility(
                    visible: _coverImageError,
                    child: Text(
                      'Invalid file type. Accepted files: jpeg, png, '
                      'jpg',
                      style: TextStyle(
                        color: Colors.red[900]
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Title',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InputField(
                    controller: titleController,
                    obscure: false,
                    placeholder: 'Enter a title',
                    textCapitalization: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Description',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InputField(
                    controller: descriptionController,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Categories',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
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
                            color: Colors.red,
                            width: 2.0), // Set the width here
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
                  Row(
                    children: [
                      Transform.scale(
                        alignment: Alignment.bottomLeft,
                        scaleX: 1.2,
                        scaleY: 1.0,
                        child: Switch.adaptive(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: showUploadAudioButton,
                          activeColor: kOrangeColor,
                          inactiveTrackColor: const Color(0xFFEDEBEB),
                          onChanged: (bool value) {
                            setState(() {
                              showUploadAudioButton = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Text('Audio Article')
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Visibility(
                    visible: showUploadAudioButton,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.only(right: 10.0, left: 10.0)),
                            iconColor: MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black54),
                          ),
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['mp3', 'wav'],
                            );

                            if (result != null) {
                              setState(() {
                                uploadedAudioName = result.files.single.name;
                                File file = File(result.files.single.path!);
                                audioFile = file.path;
                              });
                            }
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.add),
                              Text(
                                'Upload Audio',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Text(
                            uploadedAudioName ?? 'No file chosen',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  _isLoading
                      ? ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            backgroundColor: kOrangeColor,
                            minimumSize: const Size(double.infinity, 50.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Loading...',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              CircularProgressIndicator(
                                value: null,
                                strokeWidth: 2.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      : FormButton(
                          buttonText: 'Publish',
                          onPressed: () {
                            submitForm();
                          },
                        ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
