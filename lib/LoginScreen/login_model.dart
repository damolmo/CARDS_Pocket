import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';
import 'package:quiver/async.dart';

class LoginModel extends BaseViewModel implements Initialisable{

  TextEditingController userNameController = TextEditingController(text: "");
  TextEditingController userPasswordController = TextEditingController(text: "");
  String fieldNameError = "";
  String fieldPasswordError = "";
  List<Accounts> accounts  = [];
  bool existingAccounts = false;
  bool allFieldsCompleted = false;
  bool loginNamePassed = false;
  bool loginPassWordPassed = false;
  bool loginSucceed = false;
  bool loginExists = false;
  String userID = "";

  @override
  void initialise(){
    checkExistingLogin(); // First of all, check if a login account exists
  }

  startCountDown(BuildContext context){
    // This method starts a countdown before launching the next screen
    int countDown = 3;
    CountdownTimer newCountdown = CountdownTimer(Duration(seconds: 3), Duration(seconds: 1));
    var count = newCountdown.listen(null);

    count.onData((data) {
      if (countDown > 0) countDown--;
      if (countDown == 0){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TitleView(userName: userID)));
        count.pause();
      }
    });

  }

  checkExistingLogin() async {
    // Check if there's an existing login account
    // If true, logs into Title screen

    userID = await CheckCurrentLogin.retrieveCurrentLogin();

    if (userID.isNotEmpty){
      // Log into title screen
      print("LOGIN EXISTS! (MODEL)");
      print(userID);
      loginExists = true;
      notifyListeners();
    } else {
      // Allow user to log in or create a new account
      getExistingAccounts();
    }

  }

  getExistingAccounts() async {
    // This method get access to our existing database and ask for accounts
    try{
      Accounts.createAccountsTable();
      accounts = await Accounts.retrieveAccountEntries();
      notifyListeners();
    } catch (e){
      print(e);
    }

    setLoginScreenAttributes(); // After retrieve, check box length

  }

  setLoginScreenAttributes() async {
    // Set current login screen titles and subtitles according to db

    if (accounts.isEmpty){
      // No accounts
      existingAccounts = false;
    } else {
      existingAccounts = true;
    }
  }

  fieldsErrorControls() async {
    // Check fields empty

    if (userNameController.text.isEmpty) fieldNameError = "El campo usuario es obligatorio";
    if (userPasswordController.text.isEmpty) fieldPasswordError = "El campo contraseña es obligatorio";
    if(userPasswordController.text.isNotEmpty && userNameController.text.isNotEmpty) {
      allFieldsCompleted = true;
      notifyListeners();
    } else {
      allFieldsCompleted = false;
      notifyListeners();
    }
  }

  loginIntoAccount(){
    // A method that checks if current user + password is correct
    // Navigates to next screen if succeed
    fieldsErrorControls();
    int occurrences  = 0;

    if (allFieldsCompleted){
      for (Accounts account in accounts){
        if (!loginSucceed){
          if (account.userName == userNameController.text) {
            // User detected
            loginNamePassed = true;
            occurrences = 0;
            fieldNameError = "";
            occurrences ++;
            notifyListeners();
          } else if (occurrences == 0) {
            loginNamePassed = false;
            fieldNameError = "Esta cuenta no existe";
            notifyListeners();
          }
            if (account.userPassword == userPasswordController.text){
              // Password verified
              loginPassWordPassed = true;
              if(loginNamePassed && loginPassWordPassed){
                Login.createLoginTable();
                Login newLogin = Login(userID: userNameController.text);
                Login.insertLogin(newLogin);
                loginSucceed = true;
                notifyListeners();
              }
            } else {
              // Password wrongr
              loginPassWordPassed = false;
              fieldPasswordError = "La contraseña no coincide";
              notifyListeners();
            }
        }
      }
    }

    if (allFieldsCompleted && !loginNamePassed){
      // The account doesn't exists in current database
      fieldNameError = "Esta cuenta no existe";
      notifyListeners();
    }
  }

  createAccount(){
    // A method that creates an account if doesn't exists

    loginNamePassed = false;
    loginPassWordPassed = false;
    notifyListeners();

    fieldsErrorControls();

    if (allFieldsCompleted){
      if (accounts.isNotEmpty){
        for (Accounts account in accounts){
          if (account.userName == userNameController.text){
            loginNamePassed = true;
            notifyListeners();
            fieldNameError = "Cuenta existente. Inicia sesión";
            notifyListeners();
          }
        }
      }
    }

    if (!loginNamePassed && allFieldsCompleted){
      // Account doesn't exist
      // Time to add it
      Accounts newAccount = Accounts(userName: userNameController.text, userPassword: userPasswordController.text);
      Accounts.insertAccountEntry(newAccount);
      Login.createLoginTable();
      Login newLogin = Login(userID: userNameController.text);
      Login.insertLogin(newLogin);
      loginSucceed = true;
      notifyListeners();
    }

  }



}