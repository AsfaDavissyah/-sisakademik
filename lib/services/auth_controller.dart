import 'auth_service.dart';
import 'user_service.dart';
import '../models/user_model.dart';

class AuthController {
  final AuthService authService = AuthService();
  final UserService userService = UserService();

  // REGISTER USER + SIMPAN DATA KE FIRESTORE
  Future<void> registerAccount({
    required String email,
    required String password,
    required String name,
    required String username,
    required String role,
    required String linkedId,
  }) async {
    // step 1: register ke auth
    final user = await authService.registerUser(
      email: email,
      password: password,
    );

    if (user == null) {
      throw Exception("Gagal membuat akun.");
    }

    // step 2: simpan data ke Firestore
    final userModel = UserModel(
      uid: user.uid,
      name: name,
      username: username,
      role: role,
      linkedId: linkedId,
    );

    await userService.saveUserData(userModel);
  }

    // LOGIN USER + AMBIL ROLE
  Future<UserModel?> loginAccount({
    required String email,
    required String password,
  }) async {
    // step 1: login ke auth
    final user = await authService.loginUser(
      email: email,
      password: password,
    );

    if (user == null) {
      throw Exception("Login gagal.");
    }

    // step 2: ambil data role dari Firestore
    return await userService.getUserByUid(user.uid);
  }

}
