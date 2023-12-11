class UserProfile {
  final String name;
  final String phone;
  final String height;
  final String goalsWeight;

  UserProfile({
    required this.name,
    required this.phone,
    required this.height,
    required this.goalsWeight,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      phone: json['no_hp'],
      height: json['height'],
      goalsWeight: json['goals_weight'],
    );
  }

  // @override
  // String toString() {
  //   return 'UserProfile{name: $name, phone: $phone, height: $height, goalsWeight: $goalsWeight}';
  // }
}

class UserPassword {
  final String password;
  final String passwordConfirm;

  UserPassword({
    required this.password,
    required this.passwordConfirm,
  });
}
