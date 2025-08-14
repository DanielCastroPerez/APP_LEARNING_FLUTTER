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
  // Crear el cliente HTTP
  final client = http.Client();

  // Crear el data source
  final remoteDataSource = WidgetRemoteDataSourceImpl(
    client: client,
    baseUrl: 'http://10.0.2.2:8000',
  );

  // Crear el repositorio
  final repository = WidgetRepositoryImpl(remoteDataSource: remoteDataSource);

  // Crear el use case
  final getWidgetUseCase = GetWidgetUseCase(repository: repository);

  runApp(
    MultiProvider(
      // Si creas multiples providers, se deben de crear agregar en  providers[]
      providers: [
        // Creo un provider para cada use case
        ChangeNotifierProvider(
          create: (_) => WidgetProvider(
            getWidgetUseCase: getWidgetUseCase,
          ), // Mando a llamar la case del provide
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
        //ThemeData servira para configura el tema *** global*** de la app (tipografías, colores, AppBar, Card, etc.)
        scaffoldBackgroundColor: Colors
            .deepPurple
            .shade50, // Color de todos los scaffold (color de fondo [Andamio]) des pantalla

        appBarTheme: const AppBarTheme(
          //Configura todos los appBar de la app
          backgroundColor: Colors.deepPurple, // Fondo de todos los AppBar
          foregroundColor: Colors.white, // Color de texto/iconos
          elevation: 4.0, // Sombra (altura visual)
        ),

        cardTheme: CardThemeData(
          //Estilo global para todas las tarjetas (Card).
          elevation: 4.0, // Sombra (altura visual)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(
              12,
            ), // Radio de la esquina
          ),
        ),

        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
          // Define estilos globales de texto para diferentes niveles
          displayLarge: TextStyle(
            // Títulos MUY grandes
            color: Colors.deepPurple.shade900,
            fontWeight: FontWeight.bold, // Negrita
            fontSize: 24.0,
          ),

          headlineSmall: TextStyle(
            // Títulos pequeños
            color: Colors.deepPurple.shade900,
            fontWeight: FontWeight.bold, // Negrita
            fontSize: 20.0,
          ),

          titleLarge: TextStyle(
            // Títulos intermedios
            color: Colors.deepPurple.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          bodyLarge: TextStyle(
            // Texto principal
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            //TextAlign:TextAlign.justify,
          ),
          bodyMedium: TextStyle(
            // Texto secundario
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          labelLarge: TextStyle(
            // Texto de etiquetas o botones
            color: Colors.white,
          ),
        ),
         ),
        
      ),
      home: const HomeScreen(), // o tu WidgetScreen
    );
  }
}
