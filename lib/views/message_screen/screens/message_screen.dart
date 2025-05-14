import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/colors_constants.dart';
import 'package:loopi_driver/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/models/message_model.dart';
import 'package:loopi_driver/views/message_screen/widgets/bubble_chat_get.dart';
import 'package:loopi_driver/views/message_screen/widgets/bubble_chat_post.dart';

class MessageScreen extends StatelessWidget {
 const  MessageScreen({super.key});


 
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final _controller = ScrollController();
    List<MessageModel> messageList =[];
    var auth =
        BlocProvider.of<PhoneAuthCubit>(context).getLoggedInUser().phoneNumber;

    BlocProvider.of<ChatCubit>(context).getDate(
      auth:
          BlocProvider.of<PhoneAuthCubit>(
            context,
          ).getLoggedInUser().phoneNumber!,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: Text(
          'Chat With Admin',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if(state is ChatSuccess){
                 messageList =state.messageList;
                }
              },
              builder: (context, state) {
                if (state is ChatSuccess) {
                 return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: messageList.length,
                    itemBuilder:
                        (context, index) =>
                            auth == messageList[index].id
                                ? BubbleChatGet(masseage: messageList[index].message)
                                : BubbleChatPost(
                                  masseage: messageList[index].message,
                                ),
                  );
                }
                return Center(child: Text('Not have message'));
              },
            ),
          ),
          SizedBox(height: 100,)
        ],
      ),
      bottomSheet: SendMasseageTextFaildCustomWidget(
        controller: controller,
        auth:
            BlocProvider.of<PhoneAuthCubit>(
              context,
            ).getLoggedInUser().phoneNumber,
        scrollController: _controller,
      ),
    );
  }
}

// ignore: must_be_immutable
class SendMasseageTextFaildCustomWidget extends StatelessWidget {
  SendMasseageTextFaildCustomWidget({
    super.key,
    required this.controller,
    required this.scrollController,
    required this.auth,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  // final CollectionReference<Object?> messages;
  // ignore: prefer_typing_uninitialized_variables
  var auth;
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
                BlocProvider.of<ChatCubit>(
                  context,
                ).postMessageData(message: message!, auth: auth);
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
