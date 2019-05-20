
import 'package:mobile_final/model/user_model.dart';

class SharePreference{
    static int id = null;
    static String userid = null;
    static String name = null;
    static int age = null;
    static String password =null;
    static void setAttr(User user){
      id = user.id;
      userid = user.userid;
      name = user.name;
      age = user.age;
      password = user.password;
    }
    static void clear(){
      id = null;
      userid = null;
      name = null;
      age = null;
      password = null;
    }
}