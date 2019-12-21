import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/image_source_sheet.dart';
import 'package:millenium/src/components/form/imagem_perfil.dart';

class ImageFormField extends FormField<dynamic> {
  ImageFormField({
    @required BuildContext context,
    dynamic imagem,
    FormFieldValidator<dynamic> validator,
    bool autoValidate: false,
    Function(dynamic) onChanged,
  }) : super(
          validator: validator,
          initialValue: imagem,
          autovalidate: autoValidate,
          builder: (state) {
            return Column(
              children: <Widget>[
                InkWell(
                  child: ImagemPerfil(
                    imagem: imagem,
                    radius: 96,
                    icon: Icon(Icons.photo_camera, size: 64),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ImageSourceSheet(
                        onImageSelected: (image) {
                          Navigator.of(context).pop();
                          imagem = image;
                          onChanged(imagem);
                          state.didChange(imagem);
                        },
                      ),
                    );
                  },
                ),
                state.hasError
                    ? Text(
                        state.errorText,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      )
                    : Container(),
              ],
            );
          },
        );
}
