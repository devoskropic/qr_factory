import 'package:flutter/material.dart';
import 'qr_code.dart';
import 'custom_textformfield.dart';

class FormData {
  String? txtUrl;
  String? imgUrl;
  bool? ownImg = false;

  FormData({
    this.txtUrl,
    this.imgUrl,
    this.ownImg,
  });
}

class QrForm {
  final _formKey = GlobalKey<FormState>();
  FormData formData = FormData();
  final CustomTextFormField _cttf = CustomTextFormField();
  final QrCode qr = QrCode();
  // String url = '';

  Form valForm(BuildContext context, String url) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Transforma tu URL en código QR',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 20),
                // URL BUTTON
                _cttf.cusTextFormField(
                  hintText: 'ej. www.instagram.com/@micuenta',
                  labelText: 'Pega tu URL',
                  onChanged: (value) {
                    formData.txtUrl = value;
                  },
                  validate: true,
                ),
                const SizedBox(height: 10),
                //IMAGE URL BUTTON
                _cttf.cusTextFormField(
                  hintText: 'ej. shorturl.at/owSY9',
                  labelText: 'URL de la imagen',
                  onChanged: (value) {
                    formData.imgUrl = value;
                  },
                  validate: false,
                ),
                // Center(
                //   child: Image.asset(
                //     'assets/images/wb_logo.png',
                //     height: 170,
                //   ),
                // ),
                const SizedBox(height: 20),
                FormField<bool>(
                  initialValue: false,
                  validator: (value) {
                    if (value == true) {
                      return 'OK';
                    }
                    return null;
                  },
                  builder: (formFieldState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              // value: formData.ownImg,
                              value: false,
                              onChanged: (value) {
                                // When the value of the checkbox changes,
                                // update the FormFieldState so the form is
                                // re-validated.
                                formFieldState.didChange(value);
                                // setState(() {
                                //   formData.ownImg = value;
                                // });
                              },
                            ),
                            const Text(
                              'Subir mi propia imagen.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // if (!formFieldState.isValid)
                        //   Text(
                        //     formFieldState.errorText ?? "",
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodySmall!
                        //         .copyWith(
                        //             color: Theme.of(context).colorScheme.error),
                        //   ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      elevation: MaterialStateProperty.all(6),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white70),
                    ),
                    child: const Text('Crear'),
                    onPressed: () {
                      // Validate devolverá true si el formulario es válido, o false si
                      // el formulario no es válido.
                      var valid = _formKey.currentState!.validate();
                      if (!valid) {
                        return;
                      }
                      debugPrint('Settin\' state');
                      // setState(() {
                      //   url = formData.txtUrl!;
                      // });
                      // Si el formulario es válido, muestre un snackbar. En el mundo real, a menudo
                      // desea llamar a un servidor o guardar la información en una base de datos
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('ohh you just tapped me')));
                    }),
                const SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      // borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: qr.myQR(url: formData.txtUrl!)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
