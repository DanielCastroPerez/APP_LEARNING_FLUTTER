import 'package:flutter/material.dart';
import 'package:learning_flutter/data/repositories/repositories_impl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'presentation/screens/HomeScreen.dart';
import 'presentation/providers/widget_provider.dart';

import 'data/datasources/widget_remote_datasource.dart';
import 'domain/usecases/get_widget.dart';

void main() {
  final client = http.Client();

  final remoteDataSource = WidgetRemoteDataSourceImpl(
    client: client,
    baseUrl: 'http://10.0.2.2:8000',
  );

  final repository = WidgetRepositoryImpl(remoteDataSource: remoteDataSource);

  final getWidgetUseCase = GetWidgetUseCase(repository: repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WidgetProvider(getWidgetUseCase: getWidgetUseCase),
        ),
      ],
      child: const LearningFlutterApp(),
    ),
  );
}

class LearningFlutterApp extends StatelessWidget {
  const LearningFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning Flutter App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple.shade50,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 4.0,
        ),

        cardTheme: CardThemeData(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),

        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            displayLarge: TextStyle(
              color: Colors.deepPurple.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),

            headlineSmall: TextStyle(
              color: Colors.deepPurple.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),

            titleLarge: TextStyle(
              color: Colors.deepPurple.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            bodyLarge: TextStyle(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            bodyMedium: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            labelLarge: TextStyle(color: Colors.white),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
