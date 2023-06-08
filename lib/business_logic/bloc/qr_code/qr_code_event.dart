part of 'qr_code_bloc.dart';

abstract class QrCodeEvent {}

class PublicHomeLoads extends QrCodeEvent {}

class Settings extends QrCodeEvent {}

class CodeDecrementEvent extends QrCodeEvent {}

class GotUser extends QrCodeEvent {
  final User user;
  GotUser(this.user);
}
