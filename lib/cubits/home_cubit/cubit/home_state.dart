part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeSuccess extends HomeState {
  final DriverModel driverModel;

  HomeSuccess({required this.driverModel});
}

final class TicketSuccess extends HomeState {
  final List<TicketModel>  ticketModel;

  TicketSuccess({required this.ticketModel});
}