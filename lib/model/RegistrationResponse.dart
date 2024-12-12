class RegistrationResponse {
  final String message;
  final bool success;
  final Profile profile;

  RegistrationResponse({
    required this.message,
    required this.success,
    required this.profile,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      message: json['message'],
      success: json['success'],
      profile: Profile.fromJson(json['profile']),
    );
  }
}

class Profile {
  final String city;
  final String country;
  final String created_at;
  final String email;
  final String experience;
  final String gender;
  final String id;
  final String name;
  final String phone_number;
  final String phone_prefix;
  final String select_language;
  final String short_bio;
  final String system_known;
  final String updated_at;
  final String user_id;

  Profile({
    required this.city,
    required this.country,
    required this.created_at,
    required this.email,
    required this.experience,
    required this.gender,
    required this.id,
    required this.name,
    required this.phone_number,
    required this.phone_prefix,
    required this.select_language,
    required this.short_bio,
    required this.system_known,
    required this.updated_at,
    required this.user_id,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      city: json['city'],
      country: json['country'],
      created_at: json['created_at'],
      email: json['email'],
      experience: json['experience'],
      gender: json['gender'],
      id: json['id'],
      name: json['name'],
      phone_number: json['phone_number'],
      phone_prefix: json['phone_prefix'],
      select_language: json['select_language'],
      short_bio: json['short_bio'],
      system_known: json['system_known'],
      updated_at: json['updated_at'],
      user_id: json['user_id'],
    );
  }
}
