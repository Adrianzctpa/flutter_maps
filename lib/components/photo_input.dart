import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sys_path;
import 'package:image_picker/image_picker.dart';

class PhotoInput extends StatefulWidget {
  const PhotoInput({Key? key, required this.onSetImage}) : super(key: key);

  final Function onSetImage;

  @override
  PhotoInputState createState() => PhotoInputState();
}

class PhotoInputState extends State<PhotoInput> {
  File? _storedImage;

  void _takePicture() async {
    final ImagePicker picker = ImagePicker();
    XFile? imgFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imgFile == null) return;

    setState(() {
      _storedImage = File(imgFile.path);
    });
    
    final appDir = await sys_path.getApplicationDocumentsDirectory();
    String fileName = path.basename(imgFile.path); 
    final savedImg = await _storedImage!.copy('${appDir.path}/$fileName');

    widget.onSetImage(savedImg);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage as File,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No image taken',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture'),
          ),
        ),
      ]
    );
  }
}