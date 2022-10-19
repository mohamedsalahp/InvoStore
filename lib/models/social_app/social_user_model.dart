class SocialUserModel {
  late String? name;
  late String? email;
  late String? phone;
  late String? uid;
  late String? coverImage;
  late String? cover;
  late String? bio;
  bool? isEmailVerified;

  SocialUserModel({this.name,
    this.email,
    this.phone,
    this.uid,
    this.coverImage,
    this.cover,
    this.bio,
    this.isEmailVerified});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    cover = json['cover'];
    coverImage = json['coverImage'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'cover': cover,
      'coverImage': coverImage,
      'bios': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
