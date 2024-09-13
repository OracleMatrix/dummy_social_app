class GetUserPost {
  List<Post>? posts;
  int? total;
  int? skip;
  int? limit;

  GetUserPost({
    this.posts,
    this.total,
    this.skip,
    this.limit,
  });

  factory GetUserPost.fromJson(Map<String, dynamic> json) {
    return GetUserPost(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }
}

class Post {
  int? id;
  String? title;
  String? body;
  List<String>? tags;
  Reactions? reactions;
  int? views;
  int? userId;

  Post({
    this.id,
    this.title,
    this.body,
    this.tags,
    this.reactions,
    this.views,
    this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reactions: json['reactions'] != null
          ? Reactions.fromJson(json['reactions'] as Map<String, dynamic>)
          : null,
      views: json['views'] as int?,
      userId: json['userId'] as int?,
    );
  }
}

class Reactions {
  int? likes;
  int? dislikes;

  Reactions({
    this.likes,
    this.dislikes,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
    );
  }
}
