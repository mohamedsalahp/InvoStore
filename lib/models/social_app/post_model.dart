class PostModel
{
  late String? name;
  late String? uid;
  late String? coverImage;
  late String ? dateTime;
  late String ?text;
  late String ?postImage;

  PostModel({
    this.name,
    this.uid,
    this.coverImage,
    this.dateTime,
    this.text,
    this.postImage
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    coverImage = json['coverImage'];
    dateTime=json['dateTime'];
    text=json['text'];
    postImage=json['postImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'coverImage': coverImage,
      'dateTime':  dateTime,
      'text': text,
      'postImage': postImage,
    };
  }
}