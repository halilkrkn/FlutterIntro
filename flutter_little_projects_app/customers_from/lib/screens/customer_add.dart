import 'package:customers_from/mixins/validation_mixin.dart';
import 'package:customers_from/models/customer.dart';
import 'package:flutter/material.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State with ValidationMixin {
  final fromKey = GlobalKey<FormState>();
  final customer = new Customer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Form(
        key: fromKey,
        child: Column(
          children: <Widget>[
            firstNameFields(),
            lastNameFields(),
            emailNameFields(),
            passwordNameFields(),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget firstNameFields() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration:
          InputDecoration(labelText: "Adınız", hintText: "Adınız Giriniz"),
      validator: validateFirstName,
      onSaved: (String value) {
        customer.firstName = value;
      },
    );
  }

  Widget lastNameFields() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "Soyadınız ", hintText: "Soyadınızı Giriniz"),
      validator: validateLastName,
    );
  }

  Widget emailNameFields() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: "Email", hintText: "Emailiniz Giriniz"),
      validator: validateEmailName,
    );
  }

  Widget passwordNameFields() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: "Şifre", hintText: "Şifre Giriniz"),
    );
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: () {
          if (fromKey.currentState.validate()) {
            fromKey.currentState.save();
            saveCustomer(customer);
          }
        });
  }

  void saveCustomer(Customer customer) {
    print(customer.firstName);
  }
}
