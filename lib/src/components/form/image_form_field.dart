import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormField extends StatefulWidget {
  final String image;
  final Function(String) onChanged;

  ImageFormField({@required this.image, @required this.onChanged});
  @override
  _ImageFormFieldState createState() => _ImageFormFieldState(
        image: this.image,
        onChanged: onChanged,
      );
}

class _ImageFormFieldState extends State<ImageFormField> {
  String image;
  final Function(String) onChanged;

  _ImageFormFieldState({
    @required this.image,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        image == null
            ? InkWell(
                child: CircleAvatar(
                  radius: 64,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ImageSourceSheet(
                      onImageSelected: (imagem) {
                        setState(() {
                          image = imagem;
                        });
                        onChanged(image);
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              )
            : CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(base64Decode(image)),
              ),
      ],
    );
  }
}

class ImageSourceSheet extends StatelessWidget {
  final Function(String) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            child: Text("Câmera"),
            onPressed: () async {
              File image =
                  await ImagePicker.pickImage(source: ImageSource.camera);
              imageSelected(base64Encode(image.readAsBytesSync()));
            },
          ),
          FlatButton(
            child: Text("Galeria"),
            onPressed: () async {
              File image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              imageSelected(base64Encode(image.readAsBytesSync()));
            },
          )
        ],
      ),
    );
  }

  void imageSelected(String image) async {
    if (image != null) {
      onImageSelected(image);
    }
  }
}
