import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseApi {


final  CollectionReference messages = FirebaseFirestore.instance.collection('');

  getMessageData(){}
  postMessageData({required String message, required String auth}){
     messages.add({'kMessage': message, 'kCreatedAt': DateTime.now().toString(), 'Id': auth});
  }
  getTicketsData(){}
  getPersonalData(){}
}
