import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/imagem/image_source_sheet.dart';
import 'package:millenium/src/components/form/imagem/imagem_perfil.dart';

class ImageFormField extends FormField<dynamic> {
  ImageFormField({
    @required BuildContext context,
    dynamic imagem,
    FormFieldValidator<dynamic> validator,
    bool autoValidate: false,
    Function(dynamic) onChanged,
    double size,
    Icon icon,
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
                    radius: size,
                    icon: icon,
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
