class Photo {
  final String id;
  final String image;
  final String thumbnail;

  Photo({
    required this.id,
    required this.image,
    required this.thumbnail,
  });

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Photo && other.id == id;
  }
}
