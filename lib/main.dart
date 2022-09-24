import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}



class LoginPage extends StatelessWidget {
String login = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Input your login',
              style: TextStyle(
                  fontSize: 35
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                onChanged: (text){login = text;},
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage(login: login)));
            },
                child: Text('Log in'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Homepage extends StatelessWidget{
  String login='';
  Homepage({required this.login});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Welcome '+ login,
          style: TextStyle(
            fontSize: 50
          ),
          )
          ]
      ),
    )
    );
  }
}
