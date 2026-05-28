class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String imageUrl;
  final String gender;
  final String age;
  final List<AddressModel> addresses;
  final List<CardModel> cards;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.age,
    required this.addresses,
    required this.cards,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      imageUrl: json['image_url'] ?? '',
      gender: json['gender'] ?? '',
      age: json['age'] ?? '',
      addresses: json['addresses'] != null
          ? (json['addresses'] as List)
                .map((e) => AddressModel.fromJson(e))
                .toList()
          : [],
      cards: json['cards'] != null
          ? (json['cards'] as List).map((e) => CardModel.fromJson(e)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (imageUrl != null) 'image_url': imageUrl,
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (addresses != null)
        'addresses': addresses!.map((e) => e.toJson()).toList(),
      if (cards != null) 'cards': cards!.map((e) => e.toJson()).toList(),
    };
  }
}

class AddressModel {
  final int? id;
  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;

  AddressModel({this.id, this.street, this.city, this.state, this.zipCode});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (street != null) 'street': street,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (zipCode != null) 'zip_code': zipCode,
    };
  }
}

class CardModel {
  final int? id;
  final String? cardNumber;
  final String? exp;
  final String? ccv;
  final String? cardholderName;

  CardModel({
    this.id,
    this.cardNumber,
    this.exp,
    this.ccv,
    this.cardholderName,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      cardNumber: json['card_number'],
      exp: json['exp'],
      ccv: json['ccv'],
      cardholderName: json['cardholder_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (cardNumber != null) 'card_number': cardNumber,
      if (exp != null) 'exp': exp,
      if (ccv != null) 'ccv': ccv,
      if (cardholderName != null) 'cardholder_name': cardholderName,
    };
  }
}
