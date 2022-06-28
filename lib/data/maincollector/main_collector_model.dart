import 'dart:convert';

class MainCollectorModel {
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? phoneNumber;
  String? latitude;
  String? longitude;
  String? city;
  DateTime? yearBorn;
  String? gender;
  String? fileupload;
  String? alternatePhoneNumber;
  MainCollectorModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.phoneNumber,
      this.latitude,
      this.longitude,
      this.city,
      this.yearBorn,
      this.gender,
      this.fileupload,
      this.alternatePhoneNumber});

  MainCollectorModel copyWith(
      {String? firstName,
      String? lastName,
      String? email,
      String? role,
      String? phoneNumber,
      String? latitude,
      String? longitude,
      String? city,
      DateTime? yearBorn,
      String? gender,
      String? fileupload,
      String? alternatePhoneNumber}) {
    return MainCollectorModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        role: role ?? this.role,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        city: city ?? this.city,
        yearBorn: yearBorn ?? this.yearBorn,
        gender: gender ?? this.gender,
        fileupload: fileupload ?? this.fileupload,
        alternatePhoneNumber:
            alternatePhoneNumber ?? this.alternatePhoneNumber);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});

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

    if (alternatePhoneNumber != null) {
      result.addAll({'alternatePhoneNumber': alternatePhoneNumber});
    }

    return result;
  }

  factory MainCollectorModel.fromMap(Map<String, dynamic> map) {
    return MainCollectorModel(
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        email: map['email'] ?? '',
        role: map['role'],
        phoneNumber: map['phoneNumber'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        city: map['city'],
        fileupload: map['fileupload'],
        yearBorn: map['yearBorn'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['yearBorn'])
            : null,
        gender: map['gender'],
        alternatePhoneNumber: map['alternatePhoneNumber']);
  }

  String toJson() => json.encode(toMap());

  factory MainCollectorModel.fromJson(String source) =>
      MainCollectorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MainCollectorModel(firstName: $firstName, lastName: $lastName, email: $email, role: $role, phoneNumber: $phoneNumber, latitude: $latitude, longitude: $longitude, city: $city, yearBorn: $yearBorn, gender: $gender,fileupload:$fileupload)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MainCollectorModel &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.role == role &&
        other.phoneNumber == phoneNumber &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.city == city &&
        other.yearBorn == yearBorn &&
        other.gender == gender &&
        other.fileupload == fileupload;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        role.hashCode ^
        phoneNumber.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        city.hashCode ^
        yearBorn.hashCode ^
        gender.hashCode ^
        fileupload.hashCode;
  }
}
