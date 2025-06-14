import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_driver/views/all_users_tickets/models/user_ticket_model.dart';
import 'package:meta/meta.dart';

part 'all_users_tickets_state.dart';

class AllUsersTicketsCubit extends Cubit<AllUsersTicketsState> {
  AllUsersTicketsCubit() : super(AllUsersTicketsInitial());

  getAllUsersTickets({required String auth}) async {
   
    emit(AllUsersTicketsLoading());
    try {
      List<UserTicketModel> userTickets = [];
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(auth)
          .collection('tickets')
          .get()
          .then((value) {
            log('Fetched ${value.docs.length} tickets for driver: $auth');
            for (var element in value.docs) {
              log('Ticket ID: ${element.id}, Data: ${element.data()}');
              userTickets.add(UserTicketModel.fromJson(element.data()));
              
            }
          });
      emit(AllUsersTicketsSuccess(userTickets: userTickets));
    } catch (e) {
      emit(AllUsersTicketsFailure(error: e.toString()));
    }
  }
}
