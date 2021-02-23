class VariationModel {
  int id;
  String price;
  String regularPrice;
  String salePrice;
  bool onSale;
  bool visible;
  bool purchasable;
  bool inStock;
  List<Attributes> attributes;
  // String dateCreated;
  // String dateCreatedGmt;
  // String dateModified;
  // String dateModifiedGmt;
  // String description;
  // String permalink;
  // String sku;
  // dynamic dateOnSaleFrom;
  // dynamic dateOnSaleFromGmt;
  // dynamic dateOnSaleTo;
  // dynamic dateOnSaleToGmt;
  // bool virtual;
  // bool downloadable;
  // List<dynamic> downloads;
  // int downloadLimit;
  // int downloadExpiry;
  // String taxStatus;
  // String taxClass;
  // bool manageStock;
  // dynamic stockQuantity;
  // String backorders;
  // bool backordersAllowed;
  // bool backordered;
  // String weight;
  // Dimensions dimensions;
  // String shippingClass;
  // int shippingClassId;
  // Image image;
  // int menuOrder;
  // List<dynamic> metaData;
  // _links links;

  VariationModel({
    this.id,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.visible,
    this.purchasable,
    this.inStock,
    this.attributes,
    // this.dateCreated,
    // this.dateCreatedGmt,
    // this.dateModified,
    // this.dateModifiedGmt,
    // this.description,
    // this.permalink,
    // this.sku,
    // this.dateOnSaleFrom,
    // this.dateOnSaleFromGmt,
    // this.dateOnSaleTo,
    // this.dateOnSaleToGmt,
    // this.virtual,
    // this.downloadable,
    // this.downloads,
    // this.downloadLimit,
    // this.downloadExpiry,
    // this.taxStatus,
    // this.taxClass,
    // this.manageStock,
    // this.stockQuantity,
    // this.backorders,
    // this.backordersAllowed,
    // this.backordered,
    // this.weight,
    // this.dimensions,
    // this.shippingClass,
    // this.shippingClassId,
    // this.image,
    // this.menuOrder,
    // this.metaData,
    // this.links
  });

  VariationModel.fromJson(dynamic json) {
    id = json["id"];
    price = json["price"];
    regularPrice = json["regular_price"];
    salePrice = json["sale_price"];
    onSale = json["on_sale"];
    visible = json["visible"];
    purchasable = json["purchasable"];
    inStock = json["in_stock"];
    if (json["attributes"] != null) {
      attributes = [];
      json["attributes"].forEach((v) {
        attributes.add(Attributes.fromJson(v));
      });
    }
    // dateCreated = json["date_created"];
    // dateCreatedGmt = json["date_created_gmt"];
    // dateModified = json["date_modified"];
    // dateModifiedGmt = json["date_modified_gmt"];
    // description = json["description"];
    // permalink = json["permalink"];
    // sku = json["sku"];
    // dateOnSaleFrom = json["date_on_sale_from"];
    // dateOnSaleFromGmt = json["date_on_sale_from_gmt"];
    // dateOnSaleTo = json["date_on_sale_to"];
    // dateOnSaleToGmt = json["date_on_sale_to_gmt"];
    // virtual = json["virtual"];
    // downloadable = json["downloadable"];
    // if (json["downloads"] != null) {
    //   downloads = [];
    //   json["downloads"].forEach((v) {
    //     downloads.add(dynamic.fromJson(v));
    //   });
    // }
    // downloadLimit = json["download_limit"];
    // downloadExpiry = json["download_expiry"];
    // taxStatus = json["tax_status"];
    // taxClass = json["tax_class"];
    // manageStock = json["manage_stock"];
    // stockQuantity = json["stock_quantity"];
    // backorders = json["backorders"];
    // backordersAllowed = json["backorders_allowed"];
    // backordered = json["backordered"];
    // weight = json["weight"];
    // dimensions = json["dimensions"] != null ? Dimensions.fromJson(json["dimensions"]) : null;
    // shippingClass = json["shipping_class"];
    // shippingClassId = json["shipping_class_id"];
    // image = json["image"] != null ? Image.fromJson(json["image"]) : null;
    //
    // menuOrder = json["menu_order"];
    // if (json["meta_data"] != null) {
    //   metaData = [];
    //   json["meta_data"].forEach((v) {
    //     metaData.add(dynamic.fromJson(v));
    //   });
    // }
    // links = json["_links"] != null ? _links.fromJson(json["Links"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["price"] = price;
    map["regular_price"] = regularPrice;
    map["sale_price"] = salePrice;
    map["on_sale"] = onSale;
    map["visible"] = visible;
    map["purchasable"] = purchasable;
    map["in_stock"] = inStock;
    if (attributes != null) {
      map["attributes"] = attributes.map((v) => v.toJson()).toList();
    }
    // map["date_created"] = dateCreated;
    // map["date_created_gmt"] = dateCreatedGmt;
    // map["date_modified"] = dateModified;
    // map["date_modified_gmt"] = dateModifiedGmt;
    // map["description"] = description;
    // map["permalink"] = permalink;
    // map["sku"] = sku;
    // map["date_on_sale_from"] = dateOnSaleFrom;
    // map["date_on_sale_from_gmt"] = dateOnSaleFromGmt;
    // map["date_on_sale_to"] = dateOnSaleTo;
    // map["date_on_sale_to_gmt"] = dateOnSaleToGmt;
    // map["virtual"] = virtual;
    // map["downloadable"] = downloadable;
    // if (downloads != null) {
    //   map["downloads"] = downloads.map((v) => v.toJson()).toList();
    // }
    // map["download_limit"] = downloadLimit;
    // map["download_expiry"] = downloadExpiry;
    // map["tax_status"] = taxStatus;
    // map["tax_class"] = taxClass;
    // map["manage_stock"] = manageStock;
    // map["stock_quantity"] = stockQuantity;
    // map["backorders"] = backorders;
    // map["backorders_allowed"] = backordersAllowed;
    // map["backordered"] = backordered;
    // map["weight"] = weight;
    // if (dimensions != null) {
    //   map["dimensions"] = dimensions.toJson();
    // }
    // map["shipping_class"] = shippingClass;
    // map["shipping_class_id"] = shippingClassId;
    // if (image != null) {
    //   map["image"] = image.toJson();
    // }
    // map["menu_order"] = menuOrder;
    // if (metaData != null) {
    //   map["meta_data"] = metaData.map((v) => v.toJson()).toList();
    // }
    // if (links != null) {
    //   map["_links"] = links.toJson();
    // }
    return map;
  }
}

// class _links {
//   List<Self> self;
//   List<Collection> collection;
//   List<Up> up;
//
//   _links({this.self, this.collection, this.up});
//
//   _links.fromJson(dynamic json) {
//     if (json["self"] != null) {
//       self = [];
//       json["self"].forEach((v) {
//         self.add(Self.fromJson(v));
//       });
//     }
//     if (json["collection"] != null) {
//       collection = [];
//       json["collection"].forEach((v) {
//         collection.add(Collection.fromJson(v));
//       });
//     }
//     if (json["up"] != null) {
//       up = [];
//       json["up"].forEach((v) {
//         up.add(Up.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     if (self != null) {
//       map["self"] = self.map((v) => v.toJson()).toList();
//     }
//     if (collection != null) {
//       map["collection"] = collection.map((v) => v.toJson()).toList();
//     }
//     if (up != null) {
//       map["up"] = up.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }

// class Up {
//   String href;
//
//   Up({this.href});
//
//   Up.fromJson(dynamic json) {
//     href = json["href"];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["href"] = href;
//     return map;
//   }
// }

// class Collection {
//   String href;
//
//   Collection({this.href});
//
//   Collection.fromJson(dynamic json) {
//     href = json["href"];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["href"] = href;
//     return map;
//   }
// }

// class Self {
//   String href;
//
//   Self({this.href});
//
//   Self.fromJson(dynamic json) {
//     href = json["href"];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["href"] = href;
//     return map;
//   }
// }

class Attributes {
  int id;
  String name;
  String option;

  Attributes({this.id, this.name, this.option});

  Attributes.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    option = json["option"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["option"] = option;
    return map;
  }
}

class Image {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String src;
  String name;
  String alt;
  int position;

  Image(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.src,
      this.name,
      this.alt,
      this.position});

  Image.fromJson(dynamic json) {
    id = json["id"];
    dateCreated = json["date_created"];
    dateCreatedGmt = json["date_created_gmt"];
    dateModified = json["date_modified"];
    dateModifiedGmt = json["date_modified_gmt"];
    src = json["src"];
    name = json["name"];
    alt = json["alt"];
    position = json["position"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["date_created"] = dateCreated;
    map["date_created_gmt"] = dateCreatedGmt;
    map["date_modified"] = dateModified;
    map["date_modified_gmt"] = dateModifiedGmt;
    map["src"] = src;
    map["name"] = name;
    map["alt"] = alt;
    map["position"] = position;
    return map;
  }
}

class Dimensions {
  String length;
  String width;
  String height;

  Dimensions({this.length, this.width, this.height});

  Dimensions.fromJson(dynamic json) {
    length = json["length"];
    width = json["width"];
    height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["length"] = length;
    map["width"] = width;
    map["height"] = height;
    return map;
  }
}
