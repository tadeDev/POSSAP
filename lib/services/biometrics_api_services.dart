import 'package:dio/dio.dart';
import 'package:possap_project/routes/api_routes.dart';

class BiometricsApiService {

  // SEND IMAGE TO RECIEVER
  static Future<Response?> sendImageToRecieverService(dynamic imageFile) async{
    try {
      String fullUrl = recieverRoute;
      print(fullUrl);

      var formData = FormData.fromMap({
        'fingerprint-image': await MultipartFile.fromFile(imageFile.path),
      });

      var response = await Dio().post(
        fullUrl,
        data: formData,
      );
      return response;
    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // VIEW UPLOADS SERVICE
  static Future<Response?> viewUploadsService(String imageUrl) async{
    try {
      String fullUrl = "$viewUploadsRoute$imageUrl";
      print(fullUrl);

      var response = await Dio().get(
        fullUrl,
      );
      return response;
    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }
  
  //  SUBMIT BIOMETRICS & FACIALS SERVICE
  static Future<Response?> submitService(Map<String, dynamic> details) async{
    try {
      String fullUrl = submitRoute;
      print(fullUrl);

      var response = await Dio().post(
        fullUrl,
        data: details
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