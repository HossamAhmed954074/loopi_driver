

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_driver/models/driver_model.dart';
import 'package:loopi_driver/models/ticket_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


   getDate({required String auth})async {
    emit(HomeLoading());
     DocumentSnapshot data = await FirebaseFirestore.instance
      .collection('drivers')
      .doc(auth).get();
     emit(HomeSuccess(driverModel: DriverModel.fromJson(data)));
     
  }

  getTicketsInfo({required String auth}) {
     final CollectionReference messages =  FirebaseFirestore.instance
      .collection('drivers')
      .doc(auth)
      .collection('tickets');
     
      messages.snapshots().listen((event) {
        TicketsInfo ticketsInfo;
       double allPrice=0;    
       for(var doc in event.docs){       
          allPrice+= doc['price'];
       }
       ticketsInfo = TicketsInfo.fromJson(event.docs[0], event.docs.length, allPrice);
       emit(TicketInfoSuccess(ticketInfo: ticketsInfo));

      },);
  }
}
