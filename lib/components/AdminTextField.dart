import 'dart:io';

import 'package:aplikasi_body_goals/AppState.dart';
import 'package:aplikasi_body_goals/provider/update_article_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';

class AdminTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isImage;
  final TextEditingController controller;
  final String validatorText;

  const AdminTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.isImage,
    required this.controller,
    required this.validatorText,
  });

  @override
  State<AdminTextField> createState() => _AdminTextFieldState();
}

class _AdminTextFieldState extends State<AdminTextField> {
  Future<void> _pickFile() async {
    final appState = Provider.of<AppState>(context, listen: false);
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // print(pickedImage.path);
      appState.setUploadedStatus(true);
      appState.setUploadedImage(File(pickedImage.path));
      appState.setUploadedMime(lookupMimeType(pickedImage.path).toString());
      // print(
      //     'lookupMimeType(pickedImage.path): ${lookupMimeType(pickedImage.path)}');
    } else {
      appState.setUploadedStatus(false);
    }
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   File file = File(result.files.single.path!);
    // } else {
    //   // User canceled the picker
    // }
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   // File yang dipilih
    //   PlatformFile file = result.files.first;
    //   print('Path file: ${file.path}');
    //   print('Nama file: ${file.name}');
    // } else {
    //   // User membatalkan pemilihan file
    //   print('Pemilihan file dibatalkan.');
    // }
  }

  // String _filePath;

  // void _openFilePicker() async {
  //   FilePickerResult result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     setState(() {
  //       _filePath = result.files.single.path;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        // color: Color.fromRGBO(217, 217, 217, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Text(
              widget.label,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 2),
            child: widget.isImage
                ? InkWell(
                    onTap: () {
                      context
                          .read<UpdateArticleProvider>()
                          .getImageNew()
                          .then((value) {
                        context.read<AppState>().setUploadedStatus(true);
                        context
                            .read<AppState>()
                            .setUploadedImage(File(value.path));
                        context.read<AppState>().setUploadedMime(
                            lookupMimeType(value.path).toString());
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(15))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            widget.hint,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                : TextFormField(
                    controller: widget.controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return widget.validatorText;
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: const TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 14.0),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight:
                                  Radius.circular(20)) // Set the radius here
                          ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
