class Verifyotpres {
  final String message;
  final int user_id;
  final int status_code;

  Verifyotpres({
    required this.message,
    required this.user_id,
    required this.status_code,
  });

  factory Verifyotpres.fromJson(Map<String, dynamic> json) {
    return Verifyotpres(
      message: json['message'],
      user_id: json['user_id'],
      status_code: json['status_code'],
    );
  }
}
