part of 'qr_code_bloc.dart';

abstract class QrCodeState {
  final int? codesLeft;
  final bool justBegun;

  const QrCodeState({
    this.codesLeft,
    this.justBegun = true,
  });

  // @override
  // List<Object> get props => [codesLeft];
}

class InitialState extends QrCodeState {
  const InitialState() : super(justBegun: true);
}

class SettingsState extends QrCodeState {
  const SettingsState() : super(justBegun: false);
}

// Auth => LoggedScreen
class LoggedState extends QrCodeState {
  final String displayName;
  const LoggedState({required super.codesLeft, required this.displayName});

  // @override
  // List<Object> get props => [displayName];

  @override
  String toString() => 'Autenticado - Display Name: $displayName';
}
