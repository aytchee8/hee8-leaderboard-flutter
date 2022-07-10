class User {
  String id;
  String avatarURL;
  String username;
  String discriminator;
  int level;
  int messageCount;
  int xp;
  int? rank;

  User({
    required this.id,
    required this.avatarURL,
    required this.username,
    required this.discriminator,
    required this.level,
    required this.messageCount,
    required this.xp,
    this.rank
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      avatarURL: json["avatarURL"],
      username: json["username"],
      discriminator: json["discriminator"],
      level: json["level"],
      messageCount: json["messageCount"],
      xp: json["xp"],
      rank: json.containsKey("rank") ? json["rank"] : null
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
    data["rank"] = rank;

    return data;
  }
}