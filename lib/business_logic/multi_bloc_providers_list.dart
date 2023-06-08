import 'package:qr_factory/business_logic/business_logic_imports.dart';

class MultiBlocProviderList {
  static List<BlocProvider> blocProviders() {
    return <BlocProvider>[
      BlocProvider<QrCodeBloc>(
        create: (_) => QrCodeBloc(),
      )
    ];
  }
}
