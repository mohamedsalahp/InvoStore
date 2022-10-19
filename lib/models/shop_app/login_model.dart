class ShopLoginModel
{
  UserData? data;
  late String token;

  //named constructor
  ShopLoginModel.formJson(Map<String,dynamic> json)
  {
    data= json['data'] !=null ? UserData.formJson(json['data']) :null;
    token = json['token'];

  }

}
class UserData
{
   int ? id;
   String ? name;
   String  ? email;
   String ? emailVerifiedAt;
   String ? createdAt;
   String ? updatedAt;

  UserData.formJson(Map<String,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}