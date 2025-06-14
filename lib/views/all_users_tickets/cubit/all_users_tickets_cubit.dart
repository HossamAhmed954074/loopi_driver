
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
            for (var element in value.docs) {
             
              userTickets.add(UserTicketModel.fromJson(element.data(), element.id));
               emit(AllUsersTicketsSuccess(userTickets: userTickets));
            }
          });
     
    } catch (e) {
      emit(AllUsersTicketsFailure(error: e.toString()));
    }
  }



  updateUserTicketIsPackup({
    required String auth,
    required String ticketId,
    required String userId,
    required String userTickedId,

  }) async {
    emit(AllUsersTicketsLoading());
    try {
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(auth)
          .collection('tickets')
          .doc(ticketId)
          .update({'isPackUp': true});

          await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tikets')
          .doc(userTickedId)
          .update({'isPackUp': true});

      emit(AllUsersTicketsUpdateSuccess());
    } catch (e) {
      emit(AllUsersTicketsFailure(error: e.toString()));
    }finally {
      // Optionally, you can call getAllUsersTickets again to refresh the list
      getAllUsersTickets(auth: auth);
    }
  }



  updateUserTicketIsDelivered({
    required String auth,
    required String ticketId,
    required String userId,
    required String userTickedId,
  }) async {
    emit(AllUsersTicketsLoading());
    try {
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(auth)
          .collection('tickets')
          .doc(ticketId)
          .update({'isArrived': true});

          await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tikets')
          .doc(userTickedId)
          .update({'isArrived': true});
      emit(AllUsersTicketsUpdateSuccess());
    } catch (e) {
      emit(AllUsersTicketsFailure(error: e.toString()));
    }finally {
      // Optionally, you can call getAllUsersTickets again to refresh the list
      getAllUsersTickets(auth: auth);
    }
  }
}
