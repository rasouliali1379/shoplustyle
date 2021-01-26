class SliderItemModel {
  String bannersId;
  String bannersImage;
  String status;

  SliderItemModel({
    this.bannersId,
    this.bannersImage,
    this.status,
  });

  SliderItemModel.fromJson(dynamic json) {
    bannersId = json["banners_id"];
    bannersImage = json["banners_image"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["banners_id"] = bannersId;
    map["banners_image"] = bannersImage;
    map["status"] = status;
    return map;
  }
}
