import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gradp2p/core/constants/routes.dart';

class ChatController extends GetxController {
  var messages = <String>[].obs;

  void sendMessage(String message) {
    messages.add("User: $message");
    getResponse(message);
  }

  void getResponse(String message) async {
    await Future.delayed(Duration(seconds: 5)); // Delay for 2 seconds
    String response = getCustomResponse(message);
    messages.add("Bot: $response");
  }

  String getCustomResponse(String message) {
    // Define your custom responses here
    if (message.toLowerCase().contains("hello")) {
      return "Hi there! How can I help you today?";
    } else if (message.toLowerCase().contains("help")) {
      return "Sure, what do you need help with?";
    } else {
      return "I'm sorry, I didn't understand that.";
    }
  }
}

// Update the import path as necessary

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () {
            Get.toNamed(AppRoute.Bottomnavbar);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(chatController.messages[index]),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      chatController.sendMessage(textController.text);
                      textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: ChatScreen(),
  ));
}
