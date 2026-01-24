import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecase/chat_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase chatUseCase;

  ChatBloc(super.initialState, this.chatUseCase);


}
