import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'apply.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  static TextEditingController _marketValue = TextEditingController();
  static TextEditingController _mortgageBalance = TextEditingController();
  static TextEditingController _propertyTax = TextEditingController();
  static TextEditingController _city = TextEditingController();
  String takeout = ' 0';

  void calculate() {
    double propertyValue = int.parse(_marketValue.text) * 0.8;
    int mortgage = int.parse(_mortgageBalance.text);
    int tax = int.parse(_propertyTax.text);
    double ans = propertyValue - (mortgage + tax);
    setState(() {
      takeout = ans.floor().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Equity Calculator"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('About Us'),
              enabled: true,
              onTap: () => Navigator.pushNamed(context, 'about'),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('How it works'),
              enabled: true,
              onTap: () => Navigator.pushNamed(context, 'works'),
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
              FlipCard(
                key: cardKey,
                flipOnTouch: false,
                direction: FlipDirection.VERTICAL,
                front: Card(
                  elevation: 10,
                  color: Colors.lightBlue,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    child: Form(
                      key: _formKey,
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
                            controller: _marketValue,
                            decoration: InputDecoration(
                              hintText:
                                  'Estimated Market value of the property',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter market value';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _mortgageBalance,
                            decoration: InputDecoration(
                              hintText: 'Mortgage Balance',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter mortgage balance';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _propertyTax,
                            decoration: InputDecoration(
                              hintText: 'Property Tax Balance',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter tax balance';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _city,
                            decoration: InputDecoration(
                              hintText: 'City of Property',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter city';
                              }
                              return null;
                            },
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
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  calculate();
                                  FocusScope.of(context).unfocus();
                                  cardKey.currentState.toggleCard();
                                }
                              },
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
                ),
                back: Card(
                  elevation: 10,
                  color: Colors.lightBlue,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Estimated Value : \$${_marketValue.text}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mortgage Value : \$${_mortgageBalance.text}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tax Value : \$${_propertyTax.text}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "City of Property: ${_city.text}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Estimated Equity Takeout : \$$takeout",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.yellow,
                              elevation: 10,
                              onPressed: () {
                                cardKey.currentState.toggleCard();
                              },
                              child: Text(
                                "RE-CALCULATE",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.yellow,
                              elevation: 10,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Apply(
                                            takeoutValue: takeout,
                                          )),
                                );
                              },
                              child: Text(
                                "APPLY NOW",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/1.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Let the equity work for you",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "1. Pay off high interest debt and liens",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "2. Grow your Real-Estate Portfolio",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "3. Invest funds to grow your business",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "4. Buy-Fix-Sell Real-Estate",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/3.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Our clients love us because",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "1. We work for them, not the lenders",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "2. Professional and Ethical Approach",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "3. Fast turn around time and work remotely",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "4. Full Disclosure and transparency",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "5. Great professional connections",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/2.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Regain your financial freedom. Pay-off Everything",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        listText(' High Interest Credit Cards'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Collection Accounts'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Home Renovation'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Mortgage Arrears'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' House Liens'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Overdue Property Tax'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Stop Power of Sale'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Children Higher Education'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Spousal Payouts'),
                        SizedBox(
                          height: 10,
                        ),
                        listText(' Second & Third Mortgages'),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/4.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We have options for you",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: <Widget>[
                        optionsText(' Credit Issues', width),
                        SizedBox(
                          height: 10,
                        ),
                        optionsText(' High debt', width),
                        SizedBox(
                          height: 10,
                        ),
                        optionsText(' Low income', width),
                        SizedBox(
                          height: 10,
                        ),
                        optionsText(' Self employed', width),
                        SizedBox(
                          height: 10,
                        ),
                        optionsText(' Multiple Properties', width),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget optionsText(String inputText, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        width: width * 0.4,
      ),
      Icon(
        Icons.check,
        size: 14,
        color: Colors.black,
      ),
      Text(
        inputText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget listText(String inputText) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.close,
        size: 14,
        color: Colors.black,
      ),
      Text(
        inputText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
