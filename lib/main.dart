import 'package:flutter/material.dart';
import 'widgets/calendar_widget.dart';
import 'services/database_helper.dart';

void main() async {
  try {
    // Ensure Flutter bindings are initialized
    WidgetsFlutterBinding.ensureInitialized();
    
    // Create singleton instance of DatabaseHelper
    final dbHelper = DatabaseHelper();
    await dbHelper.initDatabase();
    
    runApp(const MainApp());
  } catch (e) {
    debugPrint('Error initializing app: $e');
    // Handle initialization error gracefully
    runApp(const ErrorApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalendarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Error fallback widget
class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Error initializing app. Please restart.'),
        ),
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: const CalendarWidget(),
    );
  }
}