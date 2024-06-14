import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageBox extends StatefulWidget {
  final void Function(File?)? onImagePicked;
  final IconData? icon;

  const ImageBox({Key? key, this.onImagePicked, this.icon}) : super(key: key);

  @override
  _ImageBoxState createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      if (widget.onImagePicked != null) {
        widget.onImagePicked!(_image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.grey[300],
        child: _image == null
            ? Center(child: Icon(widget.icon ?? Icons.add_a_photo))
            : Image.file(_image!),
      ),
    );
  }
}
