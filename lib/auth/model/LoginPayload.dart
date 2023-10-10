/// mobile : "8074185129"
/// email : "raydriiger@gmail.com"

class LoginPayload {
  LoginPayload({
      String? mobile, 
      String? email,}){
    _mobile = mobile;
    _email = email;
}

  LoginPayload.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _email = json['email'];
  }
  String? _mobile;
  String? _email;
LoginPayload copyWith({  String? mobile,
  String? email,
}) => LoginPayload(  mobile: mobile ?? _mobile,
  email: email ?? _email,
);
  String? get mobile => _mobile;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['email'] = _email;
    return map;
  }

}