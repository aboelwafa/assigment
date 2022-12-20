
// ignore_for_file: deprecated_member_use

import 'package:assigment/cubit/cubit.dart';
import 'package:assigment/cubit/states.dart';
import 'package:assigment/modules/addEmployee.dart';
import 'package:assigment/shared/bloc_observed';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>employeeCubit()..getEmployee(),
     
      child: BlocConsumer<employeeCubit,employeeSates>
        (
        listener: (context, state) {

        },
        builder: (context, state) {

          return MaterialApp(
            title: 'Assigment',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor:Colors.teal,
                elevation: 0.0,
                backwardsCompatibility: false,
               ),
            ),
             home: addEmployee(),
          );
        },
      ),
    );
  }


}
