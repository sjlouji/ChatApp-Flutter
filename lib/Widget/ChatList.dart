import 'package:chatapp_flutter/Models/ChatList.dart';
import 'package:chatapp_flutter/Screen/ChatScreen.dart';
import 'package:chatapp_flutter/Screen/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatWidget());
}

class ChatWidget extends StatelessWidget {
  // This widget is the root of your application.
  ChatWidget({Key key, this.chat}) : super(key: key);

  ChatList chat;
  @override
  Widget build(BuildContext context) {
    return ChatWidgetPage(chat: chat,);
  }
}

class ChatWidgetPage extends StatefulWidget {
  ChatWidgetPage({Key key, this.title, this.chat}) : super(key: key);

  final String title;
  ChatList chat;

  @override
  _ChatWidgetPageState createState() => _ChatWidgetPageState();
}

class _ChatWidgetPageState extends State<ChatWidgetPage> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){ return ChatScren(chatList: widget.chat,);}));
      },
      child: Container(
        child: Center(
          child:Container(
            padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.chat.userimage),
                        maxRadius: 30,
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.chat.name, style: TextStyle(color: Colors.grey[100], fontWeight: FontWeight.bold, fontSize: 18),),
                              SizedBox(height: 6,),
                              Row(
                                children: [
                                  Text(widget.chat.lastMessage,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
                                  SizedBox(width: 6,),
                                  Text('.', style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
                                  SizedBox(width: 6,),
                                  Text(widget.chat.time,style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.chat.noOfMessage=="0"?
                          SizedBox.shrink()
                          :
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Text(widget.chat.noOfMessage, style: TextStyle(color: Colors.white),)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
