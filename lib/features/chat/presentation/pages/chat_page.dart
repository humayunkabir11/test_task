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


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Message"),
        ),
        body: Center(child: Text("Message"))
    );
  }
}
