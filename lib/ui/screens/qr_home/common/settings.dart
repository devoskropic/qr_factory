import 'package:flutter/material.dart';
import 'package:qr_factory/ui/components/components.dart';
import 'form_data.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  FormData formData = FormData();
  bool askImg = false;
  bool showQr = false;
  String url = '';
  String imgUrl = '';

  final CustomTextFormField _cttf = CustomTextFormField();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        elevation: MaterialStateProperty.all(6),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white70),
                      ),
                      child: const Text('Plano'),
                      onPressed: () {
                        setState(() {
                          askImg = false;
                          _formKey.currentState?.reset();
                        });
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        elevation: MaterialStateProperty.all(6),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white70),
                      ),
                      child: const Text('Imagen'),
                      onPressed: () {
                        setState(() {
                          askImg = true;
                          _formKey.currentState?.reset();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    const Text(
                      'Transforma tu URL en código QR',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    _cttf.validatorFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      hintText: 'ej. www.github.com/miuser',
                      labelText: 'Pega tu URL',
                      onChanged: (value) {
                        formData.txtUrl = value;
                      },
                      validator: (val) {
                        if (val == "") {
                          return 'Campo requerido';
                        }
                        if (!val!.isValidUrl) {
                          return 'Formato de url incorrecto';
                        }
                        return null;
                      },
                    ),
                    askImg
                        ? Column(
                            children: [
                              const SizedBox(height: 10),
                              _cttf.validatorFormField(
                                autofocus: false,
                                textInputAction: TextInputAction.done,
                                hintText: 'ej. shorturl.at/owSY9',
                                labelText: 'URL de la imagen',
                                onChanged: (value) {
                                  formData.imgUrl = value;
                                },
                                validator: (val) {
                                  if (val == "") {
                                    return 'Campo requerido';
                                  }
                                  if (!val!.isValidUrl) {
                                    return 'Formato de url incorrecto';
                                  }
                                  return null;
                                },
                              ),
                              // const SizedBox(height: 20),
                              // const FloatingActionButton(
                              //   onPressed: _pickImage,
                              //   tooltip: 'Seleccionar imagen',
                              //   child: Icon(Icons.add_a_photo),
                              // ),
                              const SizedBox(height: 10),
                            ],
                          )
                        : const SizedBox(height: 10),
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
                          if (askImg) {
                            imgUrl = formData.imgUrl!;
                          }
                          showQr = true;
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
                    showQr
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: askImg
                                ? qr.imgUrlQR(url: url, imgUrl: imgUrl)
                                : qr.myQR(url: url),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/dummy-qr.jpg',
                                  height: 220,
                                )
                              ],
                            ),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
