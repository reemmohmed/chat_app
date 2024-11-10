import 'package:chat_app/model/massages.dart';
import 'package:chat_app/widgets/chat_bubu.dart';
import 'package:chat_app/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'chatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kCollectionMessege);
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snaphot) {
          if (snaphot.hasData) {
            List<Massagess> messagelist = [];
            for (int i = 0; i < snaphot.data!.docs.length; i++) {
              messagelist.add(Massagess.fromJason(snaphot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 50,
                    ),
                    Text('chat')
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagelist.length,
                        itemBuilder: (context, index) {
                          return messagelist[index].id == name
                              ? chatBubu(
                                  message: messagelist[index],
                                )
                              : chatBubuforfind(message: messagelist[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': name
                        });
                        controller.clear();
                        _controller.animateTo(0,
                            duration: Duration(microseconds: 200),
                            curve: Curves.easeIn);
                      },
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                          hintText: 'Send a message',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('lodding....');
          }
        });
  }
}
