import 'package:flutter/material.dart';
import 'package:qr_factory/ui/components/components.dart';
import 'form_data.dart';

class QrSimple extends StatefulWidget {
  const QrSimple({super.key});

  @override
  State<QrSimple> createState() => _QrSimpleState();
}

class _QrSimpleState extends State<QrSimple> {
  final _formKey = GlobalKey<FormState>();
  FormData formData = FormData();
  String url = '';

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
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ohh you just tapped me'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    }),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: qr.myQR(url: url),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
