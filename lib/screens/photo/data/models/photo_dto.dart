
class PhotoDTO {

  String id;

  Urls urls;

  Map<String, dynamic> details;

  PhotoDTO.fromJson(Map<String, dynamic> json):
        id = json['id'] as String,
        urls = Urls.fromJson(json['urls']),
        details = json;

}

class Urls {

  String regular;
  String thumb;

  Urls.fromJson(Map<String, dynamic> json):
        regular = json['regular'] as String,
        thumb = json['thumb'] as String;

}