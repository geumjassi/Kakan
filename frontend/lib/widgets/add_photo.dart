import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoSelector extends StatefulWidget {
  @override
  _PhotoSelectorState createState() => _PhotoSelectorState();
}

class _PhotoSelectorState extends State<PhotoSelector> {
  File? _selectedImage;

  Future<void> _openCamera(BuildContext context) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  Future<void> _openGallery(BuildContext context) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text('Take a photo'),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Choose from gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 250,
        width: 400,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_selectedImage != null)
              Positioned.fill(
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            if (_selectedImage != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Change photo',
                        style: TextStyle(
                          color: Color(0xFFFE724C),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Color(0xFFFE724C),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            if (_selectedImage == null)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Positioned(
                      top: -20,
                      right: -20,
                      child: Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Color(0xFFFE724C),
                        size: 80,
                      ),
                    ),
                    Container(
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFFFFE3DB),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Add Photo',
                            style: TextStyle(
                              color: Color(0xFFFE724C),
                              fontFamily: 'Montserrat',
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/camera-light.svg',
                            width: 24,
                            height: 24,
                            color: const Color(0xFFFE724C),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
