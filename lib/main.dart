import 'package:flutter/material.dart';
import 'package:flutter_application_1/infrastructure/datasources/message_datasourse_api.dart';
import 'package:flutter_application_1/infrastructure/respositories/message_repository_impl.dart';
import 'package:flutter_application_1/presentation/providers/chat/chat_provider.dart';
import 'package:flutter_application_1/presentation/providers/theme_provider.dart';
import 'package:flutter_application_1/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repositoryMessage =
        MessageRepositoryImpl(messageDatasource: MessageDatasourceApi());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                ThemeProvider(theme: ThemeData.light(useMaterial3: true))),
        ChangeNotifierProvider(
            create: (_) => ChatProvider(messageRepository: repositoryMessage))
      ],
      child: const _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.theme,
        home: const HomeScreen());
  }
}
