import 'package:chatapp_flutter/Data/ChatList.dart';
import 'package:chatapp_flutter/Models/ChatList.dart';
import 'package:chatapp_flutter/Widget/ChatList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Chat Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text('Messages', style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold, fontSize: 25),),
            SizedBox(width: 7,),
            Icon(Icons.keyboard_arrow_down, color: Colors.grey[300],)
          ],
        ),
        actions: [
          Container(
              padding: EdgeInsets.all(20),
              child: Icon(Icons.search, color: Colors.grey[300],)
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: chatList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    child: ChatWidget(chat: chatList[index],),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50)
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
