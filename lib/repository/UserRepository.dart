import '../models/UserListDto.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<AllUsersResponseDto> getAllUser() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'),headers: {"Content-type": "application/json"});
    return allUsersResponseDtoFromJson(response.body);
  }
}