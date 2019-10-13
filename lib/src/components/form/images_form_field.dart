// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagesFormField extends FormField<List> {
//   ImagesFormField({
//     @required BuildContext context,
//     @required List children,
//     FormFieldSetter<List> onSaved,
//     FormFieldValidator<List> validator,
//     bool autoValidate: false,
//   }) : super(
//           onSaved: onSaved,
//           validator: validator,
//           initialValue: children,
//           autovalidate: autoValidate,
//           builder: (state) {
//             return Column(
//               children: <Widget>[
//                 Container(
//                   height: 120,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: state.value.map<Widget>((imagem) {
//                       return Container(
//                         height: 100,
//                         width: 100,
//                         margin: EdgeInsets.only(top: 8, bottom: 8, right: 8),
//                         child: InkWell(
//                           child: imagem is String
//                               ? Image.network(
//                                   imagem,
//                                   fit: BoxFit.cover,
//                                 )
//                               : Image.file(
//                                   imagem,
//                                   fit: BoxFit.cover,
//                                 ),
//                           onLongPress: () {
//                             state.didChange(state.value..remove(imagem));
//                           },
//                         ),
//                       );
//                     }).toList()
//                       ..add(InkWell(
//                         child: Container(
//                           height: 100,
//                           width: 100,
//                           margin: EdgeInsets.symmetric(vertical: 8),
//                           color: Color(0x55012F4F),
//                           child: Center(
//                             child: Icon(
//                               Icons.add,
//                               size: 80,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (context) => ImageSourceSheet(
//                               onImageSelected: (imagem) {
//                                 state.didChange(state.value..add(imagem));
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           );
//                         },
//                       )),
//                   ),
//                 ),
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
