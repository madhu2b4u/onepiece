import 'package:get/get.dart';
import 'package:onepiece/network/base_get_connect.dart';

class PostProvider extends BaseGetConnect {

  Future<Response<dynamic>> loginCustomer(Map data) =>
      post<dynamic>('consumer/signIn', data);

}
