import 'package:bloc/bloc.dart';
import 'package:expenses_tracker/app.dart';
import 'package:expenses_tracker/consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'simple_bloc_observer.dart';

void main() async {
  Gemini.init(apiKey: GEMINI_API_KEY);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(SafeArea(child: const MyApp()));
}
