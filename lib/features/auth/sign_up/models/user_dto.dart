class UserDto {
  final String gender;
  final String age;

  UserDto({required this.gender, required this.age});

  Map<String, dynamic> toJson (){
  return {"gender" : gender, "age" : age};
  }
}