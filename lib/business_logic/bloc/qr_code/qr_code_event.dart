part of 'qr_code_bloc.dart';

abstract class QrCodeEvent {}

class PublicHome extends QrCodeEvent {}

class CodeDecrementEvent extends QrCodeEvent {}

class GotUser extends QrCodeEvent {
  final User user;
  GotUser(this.user);
}
