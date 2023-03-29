import 'package:http/http.dart' as http;
import 'package:theinternet_folks/constant/constant.dart';

class Request {
  Future<Object> getdata() async {
    try {
      http.Response response = await http.get(Uri.parse("$baseurl$getevents"));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print(response.body);
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }
}
