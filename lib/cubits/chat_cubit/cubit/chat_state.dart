part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
final class ChatLoaded extends ChatState {}
final class ChatSuccess extends ChatState {
  final List<MessageModel> messageList ;

  ChatSuccess({required this.messageList});
}
final class ChatFaluire extends ChatState {}
