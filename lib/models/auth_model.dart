class AuthModel{
  String ?accesstoken;
  String ?refreshtoken;
  AuthModel(
  {
    required this.accesstoken,
    required this.refreshtoken
});
  AuthModel.fromJson(Map<String,dynamic> json)
  {
    accesstoken=json['access_token'];
    refreshtoken=json['refresh_token'];


  }
}