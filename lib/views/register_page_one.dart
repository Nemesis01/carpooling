import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:carpooling/utils/constants.dart';

class RegisterScreenPageOne extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreenPageOne> {

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  final registerFormKey = GlobalKey<FormState>();
  final registerScaffoldKey = GlobalKey<ScaffoldState>();


  String _firstName, _lastName, _fullName;
  String _email;
  String _phoneNumber;

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    final User user = new User();


    return Scaffold(
      key: registerScaffoldKey,
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        child: Container(
          child: Form(
            key: registerFormKey,
            autovalidate: _autoValidate,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                //SizedBox(height: 50.0, width: _screenSize.width),
                TextFormField(
                  controller: _firstNameController,
                  focusNode: _firstNameFocusNode,
                  decoration: InputDecoration(
                    hintText: Constants.hintFirstName,
                    labelText: Constants.labelFirstName,
                    icon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  validator: _validateNameInputs,
                  onFieldSubmitted: (value) {
                    _onFieldFocusChanged(
                        context, _firstNameFocusNode, _lastNameFocusNode);
                  },
                  onSaved: (value) => _firstName = value,
                ),
                TextFormField(
                  controller: _lastNameController,
                  focusNode: _lastNameFocusNode,
                  decoration: InputDecoration(
                    hintText: Constants.hintLastName,
                    labelText: Constants.labelLastName,
                    icon: Icon(
                      Icons.text_rotation_none,
                      color: Colors.transparent,
                    ),
                    //isDense: true,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: _validateNameInputs,
                  onFieldSubmitted: (value) {
                    _onFieldFocusChanged(
                        context, _lastNameFocusNode, _phoneNumberFocusNode);
                  },
                  onSaved: (value) => _lastName = value,
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  focusNode: _phoneNumberFocusNode,
                  decoration: InputDecoration(
                    hintText: Constants.hintPhoneNumber,
                    labelText: Constants.labelPhoneNumber,
                    icon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    _onFieldFocusChanged(
                        context, _phoneNumberFocusNode, _emailFocusNode);
                  },
                  onSaved: (value) => _phoneNumber = value,
                ),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(
                    hintText: Constants.hintEmail,
                    labelText: Constants.labelEmail,
                    icon: Icon(Icons.mail_outline),
                  ),
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onSaved: (value) => _email = value ,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                ),
                Container(
                  margin: EdgeInsets.all(36.0),
                  child: RaisedButton(
                    child: Text(Constants.btnRegister),
                    onPressed: _submit,
                  ),
                ),

                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Constants.txtAlreadyUser),
                          Padding(padding: EdgeInsets.only(left: 1.0, right: 1.0)),
                          GestureDetector(
                            child: Text(
                              Constants.linkLogin,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: _goToLoginScreen,
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
      ),
    );
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _emailFocusNode.dispose();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _submit(){
    final form = registerFormKey.currentState;
    if(form.validate()){
      form.save();
      _performLogin();
    }
    else {
      setState((){
        _autoValidate = true;
      });
    }
  }

  void _performLogin(){
    final snackBar = SnackBar(
      content: Text('Fullname : $_firstName, $_lastName, Email: $_email, Phone: $_phoneNumber'),
    );

    registerScaffoldKey.currentState.showSnackBar(snackBar);
    _goToHomeScreen();
  }

  void _onFieldFocusChanged(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  String _validateEmail(String value) {
    Pattern pattern =  r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$";
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value.trim()) ? null : Constants.errorMsgEmailFormat;
  }

  String _validateNameInputs(String value){
    if(value.trim().isEmpty)
      return Constants.errorEmptyField;
    else if (value.length == 1)
      return Constants.errorInputTooShort;
    else
      return null;
  }

  void _goToLoginScreen() => Navigator.pushNamed(context, '/login');

  void _goToHomeScreen() => Navigator.pushNamed(context, '/home');
}

class _RegisterData{
}
