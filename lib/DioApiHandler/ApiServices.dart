import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:national_bonds_app/Models/Response/LoginResponse/LoginResponse.dart';
import 'package:national_bonds_app/Models/Response/LoginResponse/TokenResponse.dart';
import 'ApiConstants.dart';
import 'DioClient.dart';

class ApiServices with ApiConstants {
  late DioClient dio;

  ApiServices() {
    dio = DioClient();
  }

  Future<TokenResponse> getToken({String? username, String? password,}) async {
    Map<String, String> data = {
      'username': username.toString(),
      'password': password.toString(),
      'grant_type': 'password'
    };
    // Encode the key-value pairs
    String encodedData = data.keys.map((key) =>
    '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(data[key]!)}')
        .join('&');
    var url = Uri.parse(ApiConstants.token);
    print('>Url>>> $url');

    final response = await dio
        .postbycustom(
        url.toString(),
        data: encodedData,
        options: Options(
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            }
        )
    ).onError((DioException error, stackTrace) {
      log(error.toString());
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    return TokenResponse.fromJson(response.data);
  }

  Future<LoginResponse> login({String? token,String? username, String? password,String? lang}) async {
    print('>>>print lang>>second>>   $lang >> $username >> $password');
    var url = Uri.parse(ApiConstants.login+'?EncryptedUserName=$username&EncryptedPassword=$password&lang=$lang');
      /*  .replace(queryParameters: {
      'EncryptedUserName': username,
      'EncryptedPassword': password,
      'lang': lang
    } );*/
    print('>Url>>> ${url}');

    final response = await dio
        .getbycustom(
        url.toString(),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        })
    ).onError((DioException error, stackTrace) {
      log(error.toString());
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    return LoginResponse.fromJson(response.data);
  }

}
