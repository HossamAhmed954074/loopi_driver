part of 'all_users_tickets_cubit.dart';

@immutable
sealed class AllUsersTicketsState {}

final class AllUsersTicketsInitial extends AllUsersTicketsState {}
final class AllUsersTicketsLoading extends AllUsersTicketsState {}
final class AllUsersTicketsSuccess extends AllUsersTicketsState {
  final List<UserTicketModel> userTickets;

  AllUsersTicketsSuccess({required this.userTickets});
}
final class AllUsersTicketsFailure extends AllUsersTicketsState {
  final String error;

  AllUsersTicketsFailure({required this.error});
}

