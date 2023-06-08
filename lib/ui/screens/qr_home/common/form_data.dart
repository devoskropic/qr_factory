import 'dart:io';

class FormData {
  String? txtUrl;
  String? imgUrl;
  bool? ownImg = false;
  File? imageFile;

  FormData({
    this.txtUrl,
    this.imgUrl,
    this.ownImg,
    this.imageFile,
  });
}
