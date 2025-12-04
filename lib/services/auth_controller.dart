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

    // 1️⃣ Validasi input dasar
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      throw Exception("Email, password, dan username wajib diisi.");
    }

    // 2️⃣ Role validation (ADMIN DIPERBOLEHKAN)
    // Role yang diizinkan bebas: admin, guru, siswa
    const allowedRoles = ["admin", "guru", "siswa"];
    if (!allowedRoles.contains(role.toLowerCase())) {
      throw Exception("Role tidak valid. Pilih admin, guru, atau siswa.");
    }

    // 3️⃣ REGISTER ke Firebase Auth
    final user = await authService.registerUser(
      email: email,
      password: password,
    );

    if (user == null) {
      throw Exception("Gagal membuat akun.");
    }

    // 4️⃣ SIMPAN DATA KE FIRESTORE
    final userModel = UserModel(
      uid: user.uid,
      name: name,
      username: username,
      role: role.toLowerCase(), // pastikan lowercase
      linkedId: linkedId,
    );

    await userService.saveUserData(userModel);
  }

  // LOGIN USER + AMBIL ROLE
  Future<UserModel?> loginAccount({
    required String email,
    required String password,
  }) async {

    // 1️⃣ Login ke Auth
    final user = await authService.loginUser(
      email: email,
      password: password,
    );

    if (user == null) {
      throw Exception("Login gagal.");
    }

    // 2️⃣ Ambil data user dari Firestore
    final userData = await userService.getUserByUid(user.uid);

    if (userData == null) {
      throw Exception("Data user tidak ditemukan di Firestore.");
    }

    return userData;
  }
}
