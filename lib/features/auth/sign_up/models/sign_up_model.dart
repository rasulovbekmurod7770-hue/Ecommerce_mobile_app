class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  // Convert JSON to Dart object
  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
  }
}
