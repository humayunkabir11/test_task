part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
  @override
  List<Object> get props => [];
}

class FetchConversationsEvent extends ChatEvent {
  final GetChatParams params;

  const FetchConversationsEvent({required this.params});

  @override
  List<Object> get props => [];
}
