class Review {
  final String name;
  final int rating;
  final String comment;

  Review({
    required this.name,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['user']['name'],
      rating: json['rating'],
      comment: json['comment'],
    );
  }
}

class AddReview {
  final String rating;
  final String comment;

  AddReview({
    required this.rating,
    required this.comment,
  });
}
