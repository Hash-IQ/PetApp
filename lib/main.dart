import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Wrapper.dart';
import 'core/Constant/Constand.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/pet/UI/pet/bloc/pet_bloc.dart';
import 'injection_container.dart' as container;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("location");
  await Hive.openBox("user");
  await container.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepo: container.sl(),
          ),
        ),
        BlocProvider<PetBloc>(
          create: (context) => PetBloc(
            petRepo: container.sl(),
          ),
        ),
       
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: purple,
          //  accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
