import '../Screens/screens.dart';

class CheckCurrentLogin{

  static Future<String> retrieveCurrentLogin() async {
    // This static methods makes a call to database
    // and retrieves current login if any
    Login.createLoginTable();
    Login currentLogin = await Login.retrieveCurrentLogin();
    return currentLogin.userID;
  }

  static setCurrentLogin(String userID){
    // Receives new login and creates a row into login database
    Login.createLoginTable();
    Login newLogin = Login(userID: userID);
    Login.insertLogin(newLogin);
  }

  static deleteCurrentLogin(String userID){
    // Removes current login from database
    Login currentLogin = Login(userID: userID);
    Login.deleteLogin(currentLogin);
  }

}