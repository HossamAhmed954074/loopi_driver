part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
final class LogInLoading extends LogInState {}
final class LogInSuccess extends LogInState {}
final class LogInFaluire extends LogInState {
   final String errorMessage;
  LogInFaluire(this.errorMessage);
}
