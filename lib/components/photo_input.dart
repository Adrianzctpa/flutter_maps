import 'package:flutter/material.dart';

class PhotoInput extends StatefulWidget {
  const PhotoInput({Key? key}) : super(key: key);

  @override
  PhotoInputState createState() => PhotoInputState();
}

class PhotoInputState extends State<PhotoInput> {
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
          child: const Text('No image taken'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture'),
          ),
        ),
      ]
    );
  }
}