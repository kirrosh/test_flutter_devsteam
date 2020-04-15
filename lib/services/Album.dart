class AlbumUrls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  AlbumUrls({this.raw, this.full, this.regular, this.small, this.thumb});

  factory AlbumUrls.fromJson(Map<String, dynamic> json) {
    return AlbumUrls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }
}

class User {
  final String name;

  User({
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
    );
  }
}

class Album {
  final String id;
  final String created_at;
  final String updated_at;
  final String promoted_at;
  final int width;
  final int height;
  final String color;
  final String description;
  final String alt_description;
  final AlbumUrls urls;
  final links;
  final int likes;
  final bool liked_by_user;
  final user;
  final sponsorship;

  Album({
    this.id,
    this.created_at,
    this.updated_at,
    this.promoted_at,
    this.width,
    this.height,
    this.color,
    this.description,
    this.alt_description,
    this.urls,
    this.links,
    this.likes,
    this.liked_by_user,
    this.user,
    this.sponsorship,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      promoted_at: json['promoted_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      description: json['description'],
      alt_description: json['alt_description'],
      urls: AlbumUrls.fromJson(json['urls']),
      links: json['links'],
      likes: json['likes'],
      liked_by_user: json['liked_by_user'],
      user: User.fromJson(json['user']),
      sponsorship: json['sponsorship'],
    );
  }
}
