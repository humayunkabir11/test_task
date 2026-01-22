import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/chat/inbox_data.dart';
import '../../domain/usecase/chat_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase chatUseCase;
  ChatBloc({required this.chatUseCase}) : super(ChatInitial()) {
    on<FetchConversationsEvent>(_onFetchConversations);
  }

  void _onFetchConversations(
    FetchConversationsEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ConversationsLoadingState());

    try {
      final result = await chatUseCase.getConversations(event.params);

      result.fold(
        (failure) => emit(ConversationsErrorState(message: failure.message)),
        (success) => emit(ConversationsLoadedState(conversations: [])),
      );
    } catch (e) {
      emit(ConversationsErrorState(message: e.toString()));
    }
  }
}
