import 'package:chatapp_flutter/Data/Message.dart';
import 'package:chatapp_flutter/Models/ChatList.dart';
import 'package:chatapp_flutter/Screen/Home.dart';
import 'package:chatapp_flutter/Widget/Message.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatScren());
}

class ChatScren extends StatelessWidget {
  ChatScren({Key key, this.chatList}) : super(key: key);

  ChatList chatList;

  @override
  Widget build(BuildContext context) {
    return ChatScrenpage(chatList: chatList,);
  }
}

class ChatScrenpage extends StatefulWidget {
  ChatScrenpage({Key key, this.title, this.chatList}) : super(key: key);

  final String title;
  ChatList chatList;

  @override
  _ChatScrenpageState createState() => _ChatScrenpageState();
}

class _ChatScrenpageState extends State<ChatScrenpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.chatList.userimage),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.chatList.name,style: TextStyle(fontWeight: FontWeight.w900),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.video_call, color: Colors.grey[200],),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.call, color: Colors.grey[200],),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert, color: Colors.grey[200],),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: chatMessage.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return MessageWidget(
                chatMessage: chatMessage[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16,bottom: 10),
              height: 60,
              width: double.infinity,
              color: Colors.grey[800],
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add,color: Colors.white,size: 21,),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type message...",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                     Container(
                       padding: EdgeInsets.only(right: 20),
                       width: 50,
                       height: 50,
                      child: Center(
                        child: FloatingActionButton(
                          onPressed: (){},
                          child: Icon(Icons.send,color: Colors.white,size: 17,),
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
