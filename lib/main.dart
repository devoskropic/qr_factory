import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:qr_factory/business_logic/bloc/multi_bloc_providers_list.dart';
import 'package:qr_factory/business_logic/business_logic_imports.dart';
import 'package:qr_factory/ui/routes/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocProviderList.providers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          // primarySwatch: Colors.grey,
          colorSchemeSeed: Colors.grey,
          textTheme: GoogleFonts.robotoTextTheme(),
          useMaterial3: true,
        ),
      ),
    );
  }
}
