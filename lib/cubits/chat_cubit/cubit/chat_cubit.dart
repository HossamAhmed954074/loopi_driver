
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_driver/api/fire_base_api.dart';
import 'package:loopi_driver/models/message_model.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  FireBaseApi fireBaseApi = FireBaseApi();

  getDate({required String auth}) {
     final CollectionReference messages = FirebaseFirestore.instance
      .collection('drivers')
      .doc(auth)
      .collection('messages');

     
      messages.orderBy('kCreatedAt',descending: true).snapshots().listen((event) {
       List<MessageModel> list=[];
       for(var doc in event.docs){
          list.add(MessageModel.fromJson(doc));
       }
        emit(ChatSuccess(messageList: list));
      },);
  }



   postMessageData({required String message, required String auth}) {
     final CollectionReference messages = FirebaseFirestore.instance
      .collection('drivers')
      .doc(auth)
      .collection('messages');
    messages.add({
      'kMessage': message,
      'kCreatedAt': DateTime.now().toString(),
      'Id': auth,
    });
  }
}
