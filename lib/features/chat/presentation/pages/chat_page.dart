import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/common/widgets/field/custom_text_field.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/chat/inbox_data.dart';
import '../../domain/usecase/chat_usecase.dart';
import '../bloc/chat_bloc.dart';
import '../widgets/chat_tile.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ChatBloc>().add(
      FetchConversationsEvent(params: GetChatParams()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Chat"),
        centerTitle: true,
        height: 60.h,
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<ChatBloc>().add(
            FetchConversationsEvent(params: GetChatParams()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///--------------------------search bar
              CustomTextField(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Assets.icons.icMessage.svg(height: 16, width: 16),
                ),
                filledColor: Color(0xFFE7F0EF).withValues(alpha: 0.46),
                borderRadius: 8,
                hintText: "Search",
              ),

              ///----------------------conversation list
              const Gap(6),
              Expanded(
                child: BlocSelector<ChatBloc, ChatState, List<InboxData>?>(
                  selector: (state) {
                    if (state is ConversationsLoadedState) {
                      return state.conversations;
                    }
                    return null;
                  },
                  builder: (context, conversations) {
                    if (conversations == null) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // if (conversations.isEmpty) {
                    //   return const EmptyWidget();
                    // }
                    return ListView.builder(
                      itemCount: conversations.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChatTile(
                          onTap: () {},
                          chat: conversations[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
