// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageFormField extends FormField<String> {
//   ImageFormField({
//     @required BuildContext context,
//     FormFieldSetter<String> onSaved,
//     FormFieldValidator<String> validator,
//     bool autoValidate: false,
//     File image,
//   }) : super(
//           onSaved: onSaved,
//           validator: validator,
//           autovalidate: autoValidate,
//           builder: (state) {
//             return Column(
//               children: <Widget>[
//                 image == null
//                     ? InkWell(
//                         child: CircleAvatar(
//                           radius: 64,
//                           child: Icon(
//                             Icons.person,
//                             size: 80,
//                             color: Colors.white,
//                           ),
//                         ),
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (context) => ImageSourceSheet(
//                               onImageSelected: (imagem) {
//                                 image = imagem;
//                                 state.didChange(image.path);
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           );
//                         },
//                       )
//                     : CircleAvatar(
//                         radius: 64,
//                         backgroundImage: AssetImage(image.path),
//                       ),
//                 state.hasError
//                     ? Text(
//                         state.errorText,
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 12,
//                         ),
//                       )
//                     : Container(),
//               ],
//             );
//           },
//         );
// }

// class ImageSourceSheet extends StatelessWidget {
//   final Function(File) onImageSelected;

//   ImageSourceSheet({this.onImageSelected});

//   @override
//   Widget build(BuildContext context) {
//     return BottomSheet(
//       onClosing: () {},
//       builder: (context) => Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           FlatButton(
//             child: Text("Câmera"),
//             onPressed: () async {
//               File image =
//                   await ImagePicker.pickImage(source: ImageSource.camera);
//               imageSelected(image);
//             },
//           ),
//           FlatButton(
//             child: Text("Galeria"),
//             onPressed: () async {
//               File image =
//                   await ImagePicker.pickImage(source: ImageSource.gallery);
//               imageSelected(image);
//             },
//           )
//         ],
//       ),
//     );
//   }

//   void imageSelected(File image) async {
//     if (image != null) {
//       onImageSelected(image);
//     }
//   }
// }
