import 'dart:convert';

class RegistrationProfileModel {
  bool? success;
  Data? data;
  Authorisation? authorisation;

  RegistrationProfileModel({
    this.success,
    this.data,
    this.authorisation,
  });

  RegistrationProfileModel copyWith({
    bool? success,
    Data? data,
    Authorisation? authorisation,
  }) =>
      RegistrationProfileModel(
        success: success ?? this.success,
        data: data ?? this.data,
        authorisation: authorisation ?? this.authorisation,
      );

  factory RegistrationProfileModel.fromMap(Map<String, dynamic> map) =>
      RegistrationProfileModel(
        success: map["success"],
        data: Data.fromMap(map["data"]),
        authorisation: Authorisation.fromMap(map["authorisation"]),
      );

  factory RegistrationProfileModel.fromJson(String str) =>
      RegistrationProfileModel.fromMap(json.decode(str));

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data?.toMap(),
        "authorisation": authorisation?.toMap(),
      };

  String toJson() => json.encode(toMap());
}

class Authorisation {
  String? token;

  Authorisation({
    this.token,
  });

  Authorisation copyWith({
    String? token,
  }) =>
      Authorisation(
        token: token ?? this.token,
      );

  factory Authorisation.fromMap(Map<String, dynamic> map) => Authorisation(
        token: map["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}

class Data {
  String? name;
  String? email;
  String? countryCode;
  String? phone;
  String? phoneNumber;
  String? gender;
  DateTime? dob;
  int? divisionId;
  String? divisionName;
  int? districtId;
  String? districtName;
  dynamic address;
  dynamic status;
  String? profilePhoto;

  Data({
    this.name,
    this.email,
    this.countryCode,
    this.phone,
    this.phoneNumber,
    this.gender,
    this.dob,
    this.divisionId,
    this.divisionName,
    this.districtId,
    this.districtName,
    this.address,
    this.status,
    this.profilePhoto,
  });

  Data copyWith({
    String? name,
    String? email,
    String? countryCode,
    String? phone,
    String? phoneNumber,
    String? gender,
    DateTime? dob,
    int? divisionId,
    String? divisionName,
    int? districtId,
    String? districtName,
    dynamic address,
    dynamic status,
    String? profilePhoto,
  }) =>
      Data(
        name: name ?? this.name,
        email: email ?? this.email,
        countryCode: countryCode ?? this.countryCode,
        phone: phone ?? this.phone,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        divisionId: divisionId ?? this.divisionId,
        divisionName: divisionName ?? this.divisionName,
        districtId: districtId ?? this.districtId,
        districtName: districtName ?? this.districtName,
        address: address ?? this.address,
        status: status ?? this.status,
        profilePhoto: profilePhoto ?? this.profilePhoto,
      );

  factory Data.fromMap(Map<String, dynamic> map) => Data(
        name: map["name"],
        email: map["email"],
        countryCode: map["country_code"],
        phone: map["phone"],
        phoneNumber: map["phone_number"],
        gender: map["gender"],
        dob: map["dob"] == null ? null : DateTime.parse(map["dob"]),
        divisionId: map["division_id"],
        divisionName: map["division_name"],
        districtId: map["district_id"],
        districtName: map["district_name"],
        address: map["address"],
        status: map["status"],
        profilePhoto: map["profile_photo"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "country_code": countryCode,
        "phone": phone,
        "phone_number": phoneNumber,
        "gender": gender,
        "dob": dob?.toIso8601String(),
        "division_id": divisionId,
        "division_name": divisionName,
        "district_id": districtId,
        "district_name": districtName,
        "address": address,
        "status": status,
        "profile_photo": profilePhoto,
      };
}
