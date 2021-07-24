import 'package:pal_bucket/api/pal_bucket_api.dart';
import 'package:pal_bucket/models/http/users_response.dart';

class UserService {
  Future getUsers(int limit) async {
    final users = await PalBucketApi.httpGet('/users?limit=$limit');
    print(users);
    final usersFormatted = UsersResponse.fromMap(users);
    print(usersFormatted);
    return usersFormatted;
  }
}
