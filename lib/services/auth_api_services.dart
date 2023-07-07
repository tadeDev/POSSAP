import 'package:dio/dio.dart';

import '../routes/api_routes.dart';

class AuthApiServices {
  
  // LOGIN API SERVICES
  static Future<Response?> loginUserService(Map<String, dynamic> loginUserDetails) async{
    try {
      String fullUrl = loginRoute;

      var response = await Dio().post(
        fullUrl,
        data: loginUserDetails,
      );
      return response;
    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

}