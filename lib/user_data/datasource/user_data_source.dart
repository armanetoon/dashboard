import 'package:dashboard/exception.dart';
import 'package:dio/dio.dart';
import 'package:dashboard/user_data/userDTO.dart';

abstract class IUserDataSource {
  Future<List<UserDTO>> getAllUser(bool normal);
}

class UserRemoteDataSource implements IUserDataSource {
  final Dio httpClient;

  UserRemoteDataSource({required this.httpClient});

  @override
  Future<List<UserDTO>> getAllUser(bool normal) async {
    try {
      final Response result;
      if(normal){
        result = await httpClient.get('/AllUser');
      }
      else{
        result = await httpClient.get('/GetAllInvestor');
      }
      List<UserDTO> users = [];
      for (var item in result.data) {
        users.add(UserDTO.fromJson(item));
      }
      return users;
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw GetAllUserFailureExc();
        } else {
          throw ServerErrorExc();
        }
      }
    }
    throw UnimplementedError();
  }
}
