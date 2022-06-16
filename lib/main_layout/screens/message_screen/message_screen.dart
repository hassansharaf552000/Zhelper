import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/shared/helper/mangers/constants.dart';
import '../../../shared/helper/icon_broken.dart';
import '../../../shared/helper/mangers/colors.dart';
import '../../../shared/helper/mangers/size_config.dart';
import '../../../ui/widgets/app_text.dart';
import 'componets/message_design.dart';
import 'cubit/message_cubit.dart';

class MessageScreen extends StatelessWidget {
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit(),
      child: BlocConsumer<MessageCubit, MessageState>(
        listener: (context, state) {
          /*  if(state is SendMessageSuccessFromDialoog){
            Navigator.pop(context);
          }*/
        },
        builder: (context, state) {
          MessageCubit cubit = MessageCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(),
              actions: [],
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Container(
                    height: SizeConfigManger.statusBarHeight * 1.5,
                    width: SizeConfigManger.statusBarHeight * 1.5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/user.png'))),
                  ),
                  SizedBox(
                    width: getProportionateScreenHeight(10.0),
                  ),
                  AppText(text: "user message", textSize: 25.0),
                ],
              ),
              centerTitle: true,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: const AssetImage(
                          'assets/images/chat_background.jpg'))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) => MessageDesign(isMyMessage: true, message: "message", type: "type")
                    )

                    /*ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return MessageDesign(
                            isMyMessage:
                                true cubit.userMessageList[index].sender ==
                                    cubit.getCurrentUserUid()
                                ? true
                                : false
                            ,
                            time: "12 AM",
                            message: "Message Test",
                            type: "Text",
                          );
                        })*/,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(5)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: getProportionateScreenHeight(6.0)),
                            child: Container(
                              height: SizeConfigManger.bodyHeight * 0.075,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenHeight(
                                                  20.0)),
                                      child: TextFormField(
                                        controller: messageController,
                                        decoration: InputDecoration(
                                            hintText: 'Message..',
                                            focusedBorder: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenHeight(6)),
                          child: InkWell(
                            onTap: () {
                              /*  cubit.sendMessage(
                                  receiver: '${userModel.id}',
                                  message: messageController.text,
                                  isSeen: false,
                                  type: ConstantsManger.Text);*/
                              messageController.clear();
                            },
                            child: CircleAvatar(
                                radius: getProportionateScreenHeight(27.0),
                                backgroundColor: ColorsManger.lightPrimary,
                                child: const Icon(
                                  IconBroken.Send,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
