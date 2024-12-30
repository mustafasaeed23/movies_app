import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/constents.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: APIConstents.baseURL,
          receiveDataWhenStatusError: true,
        ),
      );

  // @preResolve
  // Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();
}
