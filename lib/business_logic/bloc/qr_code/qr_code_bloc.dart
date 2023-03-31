import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:meta/meta.dart';
// import 'package:equatable/equatable.dart';

import 'package:qr_factory/data/models/user.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(const InitialState()) {
    on<PublicHome>(
      (event, emit) {
        emit(const InitialState());
      },
    );
  }
}
