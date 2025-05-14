import 'package:flutter/material.dart';
import 'package:loopi_driver/constants/colors_constants.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: Text('Chat With Admin',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text('message Screen'),
      ),
      bottomSheet: SendMasseageTextFaildCustomWidget(controller: TextEditingController(),email: 'gd',scrollController: ScrollController(),),
    );
  }
}

// ignore: must_be_immutable
class SendMasseageTextFaildCustomWidget extends StatelessWidget {
  SendMasseageTextFaildCustomWidget({
    super.key,
    required this.controller,
    required this.scrollController,
    required this.email,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  // final CollectionReference<Object?> messages;
  // ignore: prefer_typing_uninitialized_variables
  var email;
  String? message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 16, right: 8, left: 8),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          message = value;
        },
        decoration: InputDecoration(
          hintText: 'Send Massege',
          suffixIcon: IconButton(
            onPressed: () {
              if (message != null) {
                // BlocProvider.of<ChatCubit>(
                //   context,
                // ).sendMessage(message: message!, email: email);
                //todo add masseage
                controller.clear();
                scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              }
            },
            icon: Icon(Icons.send, color: MyColor.kbubbleColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: MyColor.kbubbleColor),
          ),
        ),
      ),
    );
  }
}