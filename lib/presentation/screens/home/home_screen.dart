import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/presentation/screens/widgets/chat/her_message_bubble.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                  'https://images4.fanpop.com/image/photos/18000000/Tron-1982-Kevin-Flynn-team-tron-18002544-223-242.jpg'),
            )),
        title: const Text('Flynn'),
        actions: [
          IconButton(
              onPressed: () {
                themeProvider.toggleThemeData(!isDarkMode
                    ? themeProvider.themeDataDarkMode()
                    : themeProvider.themeDataLightMode());
                themeProvider.isDarkMode = !isDarkMode;
              },
              icon: Icon(
                  isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode)),
          IconButton(
              onPressed: () {
                themeProvider.toggleColors();
              },
              icon: const Icon(Icons.color_lens_rounded)),
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.scrollController,
              itemCount: chatProvider.listChat.length,
              itemBuilder: (context, index) {
                final message = chatProvider.listChat[index];

                return message.fromWho == FromWho.me
                    ? MyMessageBubble(data: message.message)
                    : HerMessagaBubble(
                        data: message.message, img: message.imgUrl!);
              },
            )),
            TextFormMessage(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
