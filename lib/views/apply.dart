import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Apply extends StatefulWidget {
  final String marketValue;
  final String mortgageBalance;
  final String propertyTax;
  final String propertyCity;
  final String takeoutValue;
  Apply({
    this.takeoutValue,
    this.marketValue,
    this.mortgageBalance,
    this.propertyCity,
    this.propertyTax,
  });

  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Firestore _firestore = Firestore.instance;
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  bool _isSaving = false;

  Future<void> saveData() async {
    setState(() {
      _isSaving = true;
    });
    await _firestore.collection("applications").add({
      'email': _email.value.text,
      'estimate_takeout': widget.takeoutValue,
      'first_name': _firstName.value.text,
      'last_name': _lastName.value.text,
      'market_value': widget.marketValue,
      'mortgage_balance': widget.mortgageBalance,
      'phone': _phone.value.text,
      'property_city': widget.propertyCity,
      'tax_balance': widget.propertyTax,
      'time': DateTime.now(),
    });
    setState(() {
      _isSaving = false;
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Application Submitted!'),
        duration: Duration(seconds: 3),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Apply Now"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isSaving,
        child: SafeArea(
          child: SingleChildScrollView(
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
                          controller: _firstName,
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
                          controller: _lastName,
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
                          controller: _email,
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
                          controller: _phone,
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
                                FocusScope.of(context).unfocus();
                                saveData();
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
        ),
      ),
    );
  }
}
