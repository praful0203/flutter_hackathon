class AppData {
  List<All> all;
  List<Featured> featured;
  List<Bookmark> bookmark;

  AppData({this.all, this.featured, this.bookmark});

  AppData.fromJson(Map<String, dynamic> json) {
    if (json['all'] != null) {
      all = new List<All>();
      json['all'].forEach((v) {
        all.add(new All.fromJson(v));
      });
    }
    if (json['featured'] != null) {
      featured = new List<Featured>();
      json['featured'].forEach((v) {
        featured.add(new Featured.fromJson(v));
      });
    }
    if (json['bookmark'] != null) {
      bookmark = new List<Bookmark>();
      json['bookmark'].forEach((v) {
        bookmark.add(new Bookmark.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.all != null) {
      data['all'] = this.all.map((v) => v.toJson()).toList();
    }
    if (this.featured != null) {
      data['featured'] = this.featured.map((v) => v.toJson()).toList();
    }
    if (this.bookmark != null) {
      data['bookmark'] = this.bookmark.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class All {
  String image;
  String title;
  String description;
  List<Comments> comments;
  int likes;
  String category;
  String url;

  All(
      {this.image,
      this.title,
      this.description,
      this.comments,
      this.likes,
      this.category,
      this.url});

  All.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    likes = json['likes'];
    category = json['category'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['likes'] = this.likes;
    data['category'] = this.category;
    data['url'] = this.url;
    return data;
  }
}

class Comments {
  String userNmae;
  String userImage;
  String userComment;

  Comments({this.userNmae, this.userImage, this.userComment});

  Comments.fromJson(Map<String, dynamic> json) {
    userNmae = json['user_nmae'];
    userImage = json['user_image'];
    userComment = json['user_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_nmae'] = this.userNmae;
    data['user_image'] = this.userImage;
    data['user_comment'] = this.userComment;
    return data;
  }
}

class Featured {
  String image;
  String title;
  String description;
  List<Comments> comments;
  int likes;
  String category;
  String url;

  Featured(
      {this.image,
      this.title,
      this.description,
      this.comments,
      this.likes,
      this.category,
      this.url});

  Featured.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    likes = json['likes'];
    category = json['category'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['likes'] = this.likes;
    data['category'] = this.category;
    data['url'] = this.url;
    return data;
  }
}

class Bookmark {
  String image;
  String title;
  String description;
  List<Comments> comments;
  int likes;
  String category;
  String url;

  Bookmark(
      {this.image,
      this.title,
      this.description,
      this.comments,
      this.likes,
      this.category,
      this.url});

  Bookmark.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    likes = json['likes'];
    category = json['category'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['likes'] = this.likes;
    data['category'] = this.category;
    data['url'] = this.url;
    return data;
  }
}
