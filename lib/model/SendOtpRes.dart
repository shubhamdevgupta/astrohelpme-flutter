class Sendotpres {
  final String message;
  final String otp;
  final int user_id;
  final int status_code;

  Sendotpres({
    required this.message,
    required this.otp,
    required this.user_id,
    required this.status_code,
  });

  factory Sendotpres.fromJson(Map<String, dynamic> json) {
    return Sendotpres(
      message: json['message'],
      otp: json['otp'],
      user_id: json['user_id'],
      status_code: json['status_code'],
    );
  }
}
