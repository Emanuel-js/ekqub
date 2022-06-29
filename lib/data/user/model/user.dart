import 'dart:convert';

class UserModel {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? role;
  String? phoneNumber;
  String? alternatePhoneNumber;
  String? latitude;
  String? longitude;
  String? city;
  DateTime? yearBorn;
  String? gender;
  String? initialBalance;
  String? idCardImageUrl;
  String? avatarImageUrl;
  UserModel(
      {this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.role,
      this.phoneNumber,
      this.latitude,
      this.longitude,
      this.city,
      this.yearBorn,
      this.gender,
      this.alternatePhoneNumber,
      this.initialBalance,
      this.idCardImageUrl,
      this.avatarImageUrl});

  UserModel copyWith(
      {String? firstName,
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
      String? initialBalance,
      String? idCardImageUrl,
      String? avatarImageUrl,
      String? alternatePhoneNumber}) {
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
        initialBalance: initialBalance ?? this.initialBalance,
        idCardImageUrl: idCardImageUrl ?? this.idCardImageUrl,
        avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
        alternatePhoneNumber:
            alternatePhoneNumber ?? this.alternatePhoneNumber);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
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

  Map<String, dynamic> toMapUser() {
    final result = <String, dynamic>{};

    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
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
    if (initialBalance != null) {
      result.addAll({'initialBalance': initialBalance});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
      email: map['email'],
      role: map['role'],
      phoneNumber: map['phoneNumber'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      city: map['city'],
      yearBorn: map['yearBorn'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['yearBorn'])
          : null,
      gender: map['gender'],
      initialBalance: map['initialBalance'],
      idCardImageUrl: map['idCardImageUrl'],
      avatarImageUrl: map['avatarImageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, username: $username, email: $email, role: $role, phoneNumber: $phoneNumber, latitude: $latitude, longitude: $longitude, city: $city, yearBorn: $yearBorn, gender: $gender, initialBalance: $initialBalance, idCardImageUrl: $idCardImageUrl, avatarImageUrl: $avatarImageUrl)';
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
        other.gender == gender &&
        other.initialBalance == initialBalance &&
        other.idCardImageUrl == idCardImageUrl &&
        other.avatarImageUrl == avatarImageUrl;
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
        gender.hashCode ^
        initialBalance.hashCode ^
        idCardImageUrl.hashCode ^
        avatarImageUrl.hashCode;
  }
}
