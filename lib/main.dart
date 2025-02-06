import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:scalapay/bloc/sp_bloc.dart';
import 'package:scalapay/l10n/l10n.dart';
import 'package:scalapay/sp_home_page.dart';

import 'injection.dart';

final GetIt getIt = GetIt.instance;

void main() {
  configureDependencies();
  runApp(BlocProvider(create: (_) => getIt<SpBloc>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(useMaterial3: true),
      home: const SpHomePage(),
    );
  }
}
