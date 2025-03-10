import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/Utils/authmanager.dart';

void handleEmptyResponse(){
   if (!AuthManager.isValid()) {
    throw ClientException(
        statusCode: 401, response: {'message': "Token is expired"});
  }
}