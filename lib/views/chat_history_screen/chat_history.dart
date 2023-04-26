import 'package:chatgpt_flutter_case/core/constants/constants_shelf.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_appbar.dart';

class ChatHistory extends StatelessWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(appBar: AppBar()),
        body: FutureBuilder(
            future: GVariables.secureStorage.getMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error', style: TextStyle(color: Colors.red)),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text(snapshot.data![index].messages!.last.message, style: const TextStyle(color: Colors.white)),
                  );
                },
              );
            }));
  }
}
