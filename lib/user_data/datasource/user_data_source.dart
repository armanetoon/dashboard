import 'package:dashboard/exception.dart';
import 'package:dio/dio.dart';
import 'package:dashboard/user_data/userDTO.dart';

abstract class IUserDataSource {
  Future<List<UserDTO>> getAllUser();
}

class UserRemoteDataSource implements IUserDataSource {
  final Dio httpClient;

  UserRemoteDataSource({required this.httpClient});

  @override
  Future<List<UserDTO>> getAllUser() async {
    try {
      final result = await httpClient.get('/AllUser');
      List<UserDTO> users = [];
      for (var item in result.data) {
        //users.add(UserDTO.fromJson(item));
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
