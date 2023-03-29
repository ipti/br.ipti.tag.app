/// inep_id : "28031610"
/// name : "ASSOC DE AMIGOS DOS DEFICIENTES DE BOQUIM"

class AuthSchool {
  final String inepId;
  final String name;

  AuthSchool({required this.inepId, required this.name});

  factory AuthSchool.fromJson(dynamic json) {
    return AuthSchool(
      inepId: json['inep_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inep_id': inepId,
      'name': name,
    };
  }
}
