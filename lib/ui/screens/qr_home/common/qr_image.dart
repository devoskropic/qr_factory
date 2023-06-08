import 'package:flutter/material.dart';
import 'package:qr_factory/ui/components/components.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as imagelib;
import 'form_data.dart';

class QrImage extends StatefulWidget {
  const QrImage({super.key});

  @override
  State<QrImage> createState() => _QrImageState();
}

class _QrImageState extends State<QrImage> {
  final _formKey = GlobalKey<FormState>();
  FormData formData = FormData();
  bool showQR = false;
  String url = '';
  String imgUrl = '';

  final CustomTextFormField _textForm = CustomTextFormField();
  final QrCode qr = QrCode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: valForm(context),
    );
  }

  Form valForm(BuildContext context) {
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
                _textForm.requiredFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  hintText: 'ej. www.github.com/myuser',
                  labelText: 'Pega tu URL',
                  onChanged: (value) {
                    formData.txtUrl = value;
                  },
                  isRequired: true,
                ),
                const SizedBox(height: 10),
                _textForm.requiredFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  hintText: 'ej. shorturl.at/owSY9',
                  labelText: 'URL de la imagen',
                  onChanged: (value) {
                    formData.imgUrl = value;
                  },
                  isRequired: true,
                ),
                // const SizedBox(height: 20),
                // const FloatingActionButton(
                //   onPressed: _pickImage,
                //   tooltip: 'Seleccionar imagen',
                //   child: Icon(Icons.add_a_photo),
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    elevation: MaterialStateProperty.all(6),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white70),
                  ),
                  child: const Text('Generar'),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    debugPrint('Settin\' state');
                    setState(() {
                      url = formData.txtUrl!;
                      imgUrl = formData.imgUrl!;
                      showQR = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('QR w/image on the go!'),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                showQR
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: qr.imgUrlQR(url: url, imgUrl: imgUrl),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/dummy-qr.jpg',
                                height: 220)
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Future<void> _pickImage() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   // setState(() {
//   //   _imageFile = File(pickedFile!.path);
//   // });
// }
