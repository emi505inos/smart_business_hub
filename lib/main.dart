import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';
import 'providers/navigator_bar_provider.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   await initializeDateFormatting('es_AR', null);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NavigationBarProvider(),
        builder: (context, _) => MyApp(FirebaseUserRepo(UserRepository))
      ),
      Provider(
        create: (context) => SimpleBlocObserver()
      ),
    ],
  ));
}
