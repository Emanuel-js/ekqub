import 'dart:convert';

class UserModel {
  String firstName;
  String lastName;
  String username;
  String email;
  String? role;
  String? phoneNumber;
  String? latitude;
  String? longitude;
  String? city;
  DateTime? yearBorn;
  String? gender;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    this.role,
    this.phoneNumber,
    this.latitude,
    this.longitude,
    this.city,
    this.yearBorn,
    this.gender,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? role,
    String? phoneNumber,
    String? latitude,
    String? longitude,
    String? city,
    DateTime? yearBorn,
    String? gender,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      city: city ?? this.city,
      yearBorn: yearBorn ?? this.yearBorn,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'username': username});
    result.addAll({'email': email});
    if (role != null) {
      result.addAll({'role': role});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (latitude != null) {
      result.addAll({'latitude': latitude});
    }
    if (longitude != null) {
      result.addAll({'longitude': longitude});
    }
    if (city != null) {
      result.addAll({'city': city});
    }
    if (yearBorn != null) {
      result.addAll({'yearBorn': yearBorn!.millisecondsSinceEpoch});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      role: map['role'],
      phoneNumber: map['phoneNumber'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      city: map['city'],
      yearBorn: map['yearBorn'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['yearBorn'])
          : null,
      gender: map['gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, username: $username, email: $email, role: $role, phoneNumber: $phoneNumber, latitude: $latitude, longitude: $longitude, city: $city, yearBorn: $yearBorn, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.username == username &&
        other.email == email &&
        other.role == role &&
        other.phoneNumber == phoneNumber &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.city == city &&
        other.yearBorn == yearBorn &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        username.hashCode ^
        email.hashCode ^
        role.hashCode ^
        phoneNumber.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        city.hashCode ^
        yearBorn.hashCode ^
        gender.hashCode;
  }
}
