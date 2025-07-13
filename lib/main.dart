import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:point_of_sale/app.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/shared/bloc_providers/block_providers.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  FlutterNativeSplash.remove();
  runApp(
    MultiBlocProvider(
      providers: blocProvidersList,
      child: const App(),
    ),
  );
}

