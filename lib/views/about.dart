import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Card(
                  color: Colors.yellow,
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "About Us",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Balbir uses his years of financial and mortgage experience to solve his clients’ financial problems. Balbir always works in the best interest of his clients and helps them regain their financial freedom.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "He has access to an array of lenders who provide funds in a variety of situations. He endeavours to provide his services in fast possible way using modern technology solutions available. Balbir is licensed with FSCO and license number is M12001349.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
