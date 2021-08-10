import 'dart:async';

import 'package:carpooling/src/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  //User user;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

///**************************************************************************///
///                                                                          ///
///                                                                          ///
///                                                                          ///
///**************************************************************************///
class _RegisterScreenState extends State<RegisterScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  _RegisterData _userDatas = new _RegisterData();

  final TextEditingController _fullNameController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  late FocusNode _fullNameFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  bool _autoObscure = true;

  ///
  ///
  ///
  ///
  @override
  void initState() {
    super.initState();
    _fullNameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          title_register_screen,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: _buildBody(context),
      backgroundColor: Colors.white,
    );
  }

  ///
  ///
  ///
  ///
  Widget _buildBody(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(flex: 2, child: _buildForm(context)),
          //Expanded(flex: 1, child: _buildAltOptions(context)),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 12.0),
            child: Text(
              app_name,
              style: TextStyle(fontSize: 32),
            ),
          ),
          TextFormField(
            autofocus: true,
            focusNode: _fullNameFocusNode,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline, size: 24.0),
              labelText: label_full_name,
              isDense: true,
              border: OutlineInputBorder(),
            ),
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: _fullNameController,
            //validator: _validateFullname,
            onFieldSubmitted: (value) {
              _onFocusChange(context, _fullNameFocusNode, _phoneFocusNode);
            },
          ),
          Padding(padding: EdgeInsets.all(6.0)),
          TextFormField(
            focusNode: _phoneFocusNode,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone, size: 24.0),
              labelText: label_contact,
              border: OutlineInputBorder(),
              isDense: true,
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            controller: _phoneController,
            onFieldSubmitted: (value) {
              _onFocusChange(context, _phoneFocusNode, _emailFocusNode);
            },
          ),
          Padding(padding: EdgeInsets.all(6.0)),
          TextFormField(
            focusNode: _emailFocusNode,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outline, size: 24.0),
              labelText: label_email,
              border: OutlineInputBorder(),
              isDense: true,
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            onFieldSubmitted: (value) {
              _onFocusChange(context, _emailFocusNode, _passwordFocusNode);
            },
          ),
          Padding(padding: EdgeInsets.all(6.0)),
          TextFormField(
            key: _passwordKey,
            focusNode: _passwordFocusNode,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline, size: 24.0),
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  _togglePasswordVisibility();
                },
              ),
              labelText: label_password,
              isDense: true,
              border: OutlineInputBorder(gapPadding: 0.0),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            obscureText: _autoObscure,
            controller: _passwordController,
            //onFieldSubmitted: (value){_onFocusChange(context, , nextNode)},
          ),
          Padding(padding: EdgeInsets.only(top: 16.0)),
          RaisedButton(
            child: Text(btn_register.toUpperCase()),
            //shape: RoundedRectangleBorder(
            //  borderRadius: BorderRadius.circular(15.0)),
            onPressed: () {},
          ),
          FlatButton(
            child: Text(btn_go_to_login,
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black)),
            onPressed: null,
          ),
          Padding(padding: EdgeInsets.all(32.0)),
          _buildAltOptions(context),
        ],
      ),
    );
  }

  Widget _buildAltOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
        FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
        FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      ],
    );
  }

  _onFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    if (currentNode == _fullNameFocusNode) {
      //_validateFullname(currentNode.)
    }
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  _togglePasswordVisibility() async {
    var _duration = new Duration(seconds: 0);
    return new Timer(
      _duration,
      () {
        if (_autoObscure) {
          setState(() => _autoObscure = false);
        } else {
          setState(() => _autoObscure = true);
        }
      },
    );
  }

  String _validateFullname(String value) {
    if (value.trim().isEmpty)
      return error_empty_field;
    else {
      //return (value.trim().length < 3) ? error_input_too_short : null;
    }
    return '';
  }

  bool isFormFilled() {
    return false;
  }

  void _submitField() {
    //if (_formKey.currentState.validate()) return null;
  }

  /* Future<String> _register() async {
    // Verify if form is correctly filled
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var response = await http.post(
        Uri(),
        //Uri.encodeFull('').toString(),
        body: {
          "fullName": this._userDatas.fullName,
          "phoneNumber": this._userDatas.phoneNumber,
          "email": this._userDatas.email,
          "password": this._userDatas.password,
        },
      );

      // If get response from server show it in a snackbar
      //Scaffold.of(context)
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(response.statusCode.toString())));
      return response.statusCode.toString();
    }
  }*/
}

class _RegisterData {
  String fullName = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}
