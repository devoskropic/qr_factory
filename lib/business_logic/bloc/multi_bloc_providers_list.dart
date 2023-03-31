import 'package:qr_factory/business_logic/bloc/bloc_imports.dart';

class MultiBlocProviderList {
  static List<BlocProvider> providers() {
    return <BlocProvider>[
      BlocProvider<QrCodeBloc>(
        create: (_) => QrCodeBloc(),
      )
      // BlocProvider<CartManagementBloc>(
      //   create: (context) => CartManagementBloc(),
      // ),
      // BlocProvider<ColorSelectorCubit>(
      //   create: (context) => ColorSelectorCubit(),
      // ),
    ];
  }
}
