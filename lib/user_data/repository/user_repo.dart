import 'package:dashboard/helpers/httpclient.dart';
import 'package:dashboard/user_data/datasource/user_data_source.dart';
import 'package:dashboard/user_data/userDTO.dart';

final UserRemoteRepository userRepository = UserRemoteRepository(dataSource: UserRemoteDataSource(httpClient: httpClient));

abstract class IUserRepository{
  Future<List<UserDTO>> getAllUser();
}

class UserRemoteRepository implements IUserRepository{
  final IUserDataSource dataSource;

  UserRemoteRepository({required this.dataSource});

  @override
  Future<List<UserDTO>> getAllUser() {
    return dataSource.getAllUser();
  }


}