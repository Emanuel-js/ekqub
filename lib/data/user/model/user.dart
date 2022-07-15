import 'dart:convert';

import 'dart:developer';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? role;
  String? phoneNumber;
  String? alternatePhoneNumber;
  double? latitude;
  double? longitude;
  String? city;
  DateTime? yearBorn;
  String? gender;
  String? initialBalance;
  String? idCardImageUrl;
  String? avatarImageUrl;
  String? residentLocation;
  UserModel(
      {this.id,
      this.firstName,
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
      this.residentLocation,
      this.avatarImageUrl});

  UserModel copyWith(
      {int? id,
      String? firstName,
      String? lastName,
      String? username,
      String? email,
      String? role,
      String? phoneNumber,
      double? latitude,
      double? longitude,
      String? city,
      DateTime? yearBorn,
      String? gender,
      String? initialBalance,
      String? idCardImageUrl,
      String? avatarImageUrl,
      String? residentLocation,
      String? alternatePhoneNumber}) {
    return UserModel(
        id: id ?? this.id,
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
        alternatePhoneNumber: alternatePhoneNumber ?? this.alternatePhoneNumber,
        residentLocation: residentLocation ?? this.residentLocation);
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

  UserModel.fromMap(Map<String, dynamic> map) {
    log("Inside user model from map");
    id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];

    email = map['email'];
    phoneNumber = map['phoneNumber'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    city = map['city'];
    yearBorn = DateTime.parse(map['yearBorn']);

    gender = map['gender'];
    idCardImageUrl = map['idCardImageUrl'];
    avatarImageUrl = map['avatarImageUrl'];
    // return UserModel(
    //   id: map["id"],
    //   firstName: map['firstName'],
    //   lastName: map['lastName'],
    //   phoneNumber: map['phoneNumber'],
    //   residentLocation: map['residentLocation'],
    //   latitude: map['latitude'],
    //   longitude: map['longitude'],
    //   city: map['city'],
    //   yearBorn: map['yearBorn'] != null
    //       ? DateTime.fromMillisecondsSinceEpoch(map['yearBorn'])
    //       : null,
    //   gender: map['gender'],
    //   idCardImageUrl: map['idCardImageUrl'],
    //   avatarImageUrl: map['avatarImageUrl'],
    // );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, username: $username, email: $email, role: $role, phoneNumber: $phoneNumber, latitude: $latitude, longitude: $longitude, city: $city, yearBorn: $yearBorn, gender: $gender, initialBalance: $initialBalance, idCardImageUrl: $idCardImageUrl, avatarImageUrl: $avatarImageUrl)';
  }
}
