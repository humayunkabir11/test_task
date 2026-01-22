part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ConversationsLoadingState extends ChatState {}

class ConversationsLoadedState extends ChatState {
  final List<InboxData> conversations;

  const ConversationsLoadedState({required this.conversations});

  @override
  List<Object> get props => [conversations];
}

class ConversationsErrorState extends ChatState {
  final String? message;

  const ConversationsErrorState({this.message});

  @override
  List<Object> get props => [message ?? ''];
}
