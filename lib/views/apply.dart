import 'package:flutter/material.dart';

class Apply extends StatefulWidget {
  final String takeoutValue;
  Apply({this.takeoutValue});

  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply Now"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Card(
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
                      "Esstimate Equity Takeout: \$${widget.takeoutValue}",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      //controller: _marketValue,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //controller: _mortgageBalance,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //controller: _propertyTax,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //controller: _city,
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter phone number';
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
                            //calculate();
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: Text(
                          'SUBMIT',
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
        ),
      ),
    );
  }
}
