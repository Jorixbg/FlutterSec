
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class Auth extends ChangeNotifier {
  static const loginRoute = 'http://localhost:9003/login';

  late String _token;
  DateTime? _expiryDate;
  String? _userId;
  List<dynamic>? _roles;

  bool get isAuth {
    if (token == null || token == '') {
      return false;
    }
    return true;
  }

  String? get token {
    if (_expiryDate != null && _expiryDate!.isAfter(DateTime.now())
        && _token != null && _token != '') {
      return _token;
    }
    return '';
  }

  String? get role {
    return _roles?.first;
  }

  Future<void> login(String username, String password) async {

    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;

    try {
      final response = await http.post(
        Uri.parse(loginRoute),
        body: map,
      );
      String? accessToken = response.headers["accesstoken"];
      print("called from provider");
      print(accessToken);

      if (null == accessToken) {
        return;
      }

      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
      print(decodedToken);
      _token = accessToken;
      _roles = decodedToken['roles'];
      _expiryDate = DateTime.now().add(Duration(seconds: decodedToken['exp'],),);
      _userId = decodedToken['sub'];

      notifyListeners();
    }
    catch (error) {
      rethrow;
    }
  }

  String? get userId {
    return _userId;
  }

  DateTime? get expiryDate {
    return _expiryDate;
  }

  void logout() {
    _token = '';
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }
}