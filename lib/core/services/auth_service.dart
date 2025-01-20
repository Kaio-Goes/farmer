import 'package:farmer/core/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static User? _currentUser;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  User? get currentUser {
    return _currentUser;
  }

  Future<void> _saveUserToCache(User user) async {
    await _secureStorage.write(key: 'id', value: user.id);
    await _secureStorage.write(key: 'name', value: user.name);
    await _secureStorage.write(key: 'email', value: user.email);
    await _secureStorage.write(key: 'register', value: user.register);
  }

  Future<void> _clearUserFromCache() async {
    await _secureStorage.deleteAll();
  }

  Future<User?> loadUserFromCache() async {
    String? id = await _secureStorage.read(key: 'id');
    String? name = await _secureStorage.read(key: 'name');
    String? email = await _secureStorage.read(key: 'email');
    String? register = await _secureStorage.read(key: 'register');

    if (id != null
        // && token != null
        ) {
      return User(
        id: id,
        name: name ?? '',
        email: email ?? '',
        register: register ?? '',
      );
    }

    return null; // Caso o usuário não esteja logado ou dados estejam faltando
  }

  Future login(String email, String password) async {
    // Map params = {
    // "user": {"identity": email, "password": password}
    // };

    // var url = '${ApiConstants.baseUrl}/authentication/users/sign_in.json';

    // var body = json.encode(params);

    // var headers = {
    //   'Content-Type': 'application/json',
    // };

    // var response = await http.post(
    //   Uri.parse(url),
    //   body: body,
    //   headers: headers,
    // );

    _currentUser = User(
        id: '1',
        email: 'agricultor@teste.com.br',
        name: 'Lucas Villarinho',
        register: '25789-DF');
    // if (Platform.isIOS) {
    //   Purchases.logIn(_currentUser!.id);
    // }
    await _saveUserToCache(_currentUser!);
    // return response;
  }

  Future logout() async {
    // String? token = await _secureStorage.read(key: 'token');

    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': "Bearer $token"
    // };

    // var url = '${ApiConstants.baseUrl}/authentication/users/sign_out.json';

    // var response = await http.delete(Uri.parse(url), headers: headers);

    _currentUser = null;
    await _clearUserFromCache();
    // if (Platform.isIOS) {
    //   Purchases.logOut();
    // }

    // return response;
  }
}
