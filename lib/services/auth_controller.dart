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

    // 1️⃣ VALIDASI INPUT DASAR
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      throw Exception("Email, password, dan username wajib diisi.");
    }

    // 2️⃣ ROLE VALIDATION (SUPER IMPORTANT)
    // Admin tidak boleh diregistrasi lewat aplikasi
    if (role.toLowerCase() == "admin") {
      throw Exception("Akun admin tidak boleh dibuat melalui aplikasi.");
    }

    // Role harus "guru" atau "siswa" saja
    const allowedRoles = ["guru", "siswa"];
    if (!allowedRoles.contains(role.toLowerCase())) {
      throw Exception("Role tidak valid. Hanya guru atau siswa yang diperbolehkan.");
    }

    // 3️⃣ REGISTER KE FIREBASE AUTH
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
      role: role,     // sudah aman (bukan admin)
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
