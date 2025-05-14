import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_driver/models/driver_model.dart';
import 'package:loopi_driver/models/ticket_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
   getDate({required String auth})async {
     DocumentSnapshot data = await FirebaseFirestore.instance
      .collection('drivers')
      .doc(auth).get();

   //  log(data['from']);
     emit(HomeSuccess(driverModel: DriverModel.fromJson(data)));
     
  }


   getTicketsDate({required String auth}) {
     final CollectionReference messages = FirebaseFirestore.instance
      .collection('drivers')
      .doc(auth)
      .collection('tickets');
     
      messages.snapshots().listen((event) {
       List<TicketModel> list=[];
       for(var doc in event.docs){
          list.add(TicketModel.fromJson(doc));
       }
        emit(TicketSuccess(ticketModel: list));
      },);
  }
}
