import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Equity Calculator"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('About Us'),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('How it works'),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Wondering how much Home Equity you may access.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Use our FREE Home Equity Calculator.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Let your home equity work for you. Let\'s make a plan and start working.',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                elevation: 10,
                color: Colors.lightBlue,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Equity Calculator",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Estimated Market value of the property',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Mortgage Balance',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Property Tax Balance',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'City of Property',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: RaisedButton(
                            elevation: 10,
                            color: Colors.yellow,
                            onPressed: () {},
                            child: Text(
                              'CALCULATE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
