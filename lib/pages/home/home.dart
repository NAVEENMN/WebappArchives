import 'package:bio/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildCard(context, option, text) {
  return GestureDetector(
    child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Varela',
              color: Colors.white,
              fontWeight:FontWeight.bold
          ),
        ),
        margin: EdgeInsets.all(10),
        width:150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image:AssetImage("assets/images/options/option_1.png"),
              fit:BoxFit.cover
          ),
        )
    ),
    onTap:(){
      if (option == 'opt_2') {
        Navigator.pushNamed(context, '/Index ');
      } else if (option == 'opt_1') {
        print("you clicked my");
      } else {
        print("you clicked my");
      }
    },
  );
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Report',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () {},
            color: Colors.black,
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('log out'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            SizedBox(height: 15.0),
            Text(
              'Welcome',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15.0),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                _buildCard(context,'opt_1','Research'),
                _buildCard(context,'opt_2','Get a Doctor'),
                _buildCard(context,'opt_3','Bio Markers'),
                _buildCard(context,'opt_4','Order tests')
              ],
            )
          ],
        )

    );
  }
}
