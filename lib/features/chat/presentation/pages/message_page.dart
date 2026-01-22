import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/common/widgets/field/custom_text_field.dart';
import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/common/widgets/line/dash_line.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/theme/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/services/web_socket_service.dart';

class ChatMessage {
  final bool isUser;
  final List<String> messages;

  ChatMessage({required this.isUser, required this.messages});
}

final List<ChatMessage> chatMessages = [
  ChatMessage(isUser: true, messages: ["Hey there! 👋"]),
  ChatMessage(isUser: false, messages: ["Hi!", "How can I help you today?"]),
  ChatMessage(
    isUser: true,
    messages: [
      "I need my backyard pool cleaned.",
      "Do you offer that service?",
    ],
  ),
  ChatMessage(
    isUser: false,
    messages: [
      "Yes, we do! 😊",
      "Can you tell me the size and current condition of your pool?",
    ],
  ),
  ChatMessage(
    isUser: true,
    messages: ["It’s about 25 feet and hasn’t been cleaned in months."],
  ),
  ChatMessage(
    isUser: false,
    messages: [
      "No problem.",
      "We can schedule a visit tomorrow. Does that work for you?",
    ],
  ),
  ChatMessage(isUser: true, messages: ["Tomorrow sounds perfect. Thank you!"]),
];

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late SocketService socketService;

  void _connectSocket() async {
    await socketService.connect("ws://177a925e4a7b.ngrok-free.app");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socketService = SocketService();
    _connectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Message Page"),
        centerTitle: true,
        height: 60.h,
        actions: [
          //IconButton(onPressed: () {}, icon: Assets.icons.icCall.svg()),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0.33),
          child: DashedLine(
            direction: DashLineDirection.horizontal,
            length: 0.9.sw,
            dashWidth: 5,
            dashSpace: 6,
            dashHeight: 0.33,
            color: const Color(0xFF757575).withValues(alpha: 0.88),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///--------------------------user profile
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SizedBox.square(
                dimension: 49,
                child: Stack(
                  children: [
                    CacheImage(
                      imageUrl:
                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpapers-clan.com%2Fwp-content%2Fuploads%2F2023%2F10%2Fnaruto-itachi-uchiha-with-red-eyes-desktop-wallpaper-preview.jpg&f=1&nofb=1&ipt=7f7a1a7e61d402346b3caab1a687ee3b05f44a481104ff8936730526aed4635d",
                      height: 48,
                      width: 48,
                      borderRadius: 100,
                    ),
                    Positioned(
                      right: 1,
                      top: 5,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.green500,
                          shape: BoxShape.circle,
                          border: Border.all(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                "Madara Uchiha",
                style: interRegular.copyWith(
                  fontSize: 16.sp,
                  color: const Color(0xFF5C5C5C),
                  letterSpacing: 0,
                ),
              ),
              subtitle: Text(
                "Active",
                style: interRegular.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xFF5C5C5C),
                  letterSpacing: 0,
                  height: -1,
                ),
              ),
            ),

            ///-------------------------messages
            const Gap(4),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: chatMessages.length,
            //     itemBuilder: (context, index) {
            //       final msg = chatMessages[index];
            //
            //       return Column(
            //         crossAxisAlignment: msg.isUser
            //             ? CrossAxisAlignment.start
            //             : CrossAxisAlignment.end,
            //         children: [
            //           if (msg.isUser)
            //             UserMessageTile(messages: msg.messages)
            //           else
            //             OwnerMessageTile(messages: msg.messages),
            //           const Gap(12),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: StreamBuilder(
                stream: socketService.messages,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("SOKECT_ERROR: ${snapshot.error}");
                    return Text('Error: ${snapshot.error}');
                  }

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                      return Text('Live Data: ${snapshot.data}');
                    case ConnectionState.done:
                      return Text('Connection Closed');
                  }
                },
              ),
            ),

            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                //  child: Assets.icons.icAttachment.svg(),
                ),

                Expanded(
                  child: CustomTextField(
                    hintText: "Message",
                    filledColor: Color(0xFFEEEEEB),
                    borderRadius: 12,
                    maxLines: null,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Assets.icons.icArrowBack.svg(),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}
