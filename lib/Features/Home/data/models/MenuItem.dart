class MenuItems {
  MenuItems({
    this.component,
    this.parameters,
    this.title,
  });

  String component;
  Parameters parameters;
  String title;

  factory MenuItems.fromJson(Map<String, dynamic> json) => MenuItems(
        component: json["component"] == null ? null : json["component"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromJson(json["parameters"]),
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "component": component == null ? null : component,
        "parameters": parameters == null ? null : parameters.toJson(),
        "title": title == null ? null : title,
      };
}

class Parameters {
  Parameters({
    this.apiName,
    this.userId,
    this.url,
  });

  String apiName;
  int userId;
  String url;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        apiName: json["apiName"] == null ? null : json["apiName"],
        userId: json["userId"] == null ? null : json["userId"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "apiName": apiName == null ? null : apiName,
        "userId": userId == null ? null : userId,
        "url": url == null ? null : url,
      };
}
