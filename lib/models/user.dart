class User {
  String id;
  String avatarURL;
  String username;
  int discriminator;
  int level;
  int messageCount;
  int xp;

  User({
    required this.id,
    required this.avatarURL,
    required this.username,
    required this.discriminator,
    required this.level,
    required this.messageCount,
    required this.xp
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      avatarURL: json["avatarURL"],
      username: json["username"],
      discriminator: json["discriminator"],
      level: json["level"],
      messageCount: json["messageCount"],
      xp: json["xp"]
    ); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    
    data["id"] = id;
    data["avatarURL"] = avatarURL;
    data["username"] = username;
    data["discriminator"] = discriminator;
    data["level"] = level;
    data["messageCount"] = messageCount;
    data["xp"] = xp;

    return data;
  }
}