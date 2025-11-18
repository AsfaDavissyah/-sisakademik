class UserModel {
  final String uid;
  final String name;
  final String username;
  final String role;        // admin, guru, siswa
  final String linkedId;    // id siswa/guru

  UserModel({
    required this.uid,
    required this.name,
    required this.username,
    required this.role,
    required this.linkedId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'username': username,
      'role': role,
      'linkedId': linkedId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      username: map['username'],
      role: map['role'],
      linkedId: map['linkedId'],
    );
  }
}