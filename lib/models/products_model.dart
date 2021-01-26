class ProductsModel {
  int id;
  String name;
  String type;
  String status;
  bool featured;
  String description;
  String shortDescription;
  String price;
  String regularPrice;
  String salePrice;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool inStock;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<int> relatedIds;
  List<Categories> categories;
  List<Images> images;
  List<Attributes> attributes;
  List<int> variations;
  int menuOrder;
  Store store;
  // String slug;
  // String permalink;
  // String dateCreated;
  // String dateCreatedGmt;
  // String dateModified;
  // String dateModifiedGmt;
  // String catalogVisibility;
  // String sku;
  // dynamic dateOnSaleFrom;
  // dynamic dateOnSaleFromGmt;
  // dynamic dateOnSaleTo;
  // dynamic dateOnSaleToGmt;
  // String priceHtml;
  // bool virtual;
  // bool downloadable;
  // List<dynamic> downloads;
  // int downloadLimit;
  // int downloadExpiry;
  // String externalUrl;
  // String buttonText;
  // String taxStatus;
  // String taxClass;
  // bool manageStock;
  // dynamic stockQuantity;
  // String backorders;
  // bool backordersAllowed;
  // bool backordered;
  // bool soldIndividually;
  // String weight;
  // Dimensions dimensions;
  // bool shippingRequired;
  // bool shippingTaxable;
  // String shippingClass;
  // int shippingClassId;
  // String purchaseNote;
  // List<dynamic> upsellIds;
  // List<dynamic> crossSellIds;
  // int parentId;
  // List<Tags> tags;
  // List<dynamic> defaultAttributes;
  // List<dynamic> groupedProducts;

  ProductsModel({
    this.id,
    this.name,
    this.type,
    this.status,
    this.featured,
    this.description,
    this.shortDescription,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.inStock,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.relatedIds,
    this.categories,
    this.images,
    this.attributes,
    this.variations,
    this.menuOrder,
    this.store,
    // this.groupedProducts,
    // this.slug,
    // this.permalink,
    // this.dateCreated,
    // this.dateCreatedGmt,
    // this.dateModified,
    // this.dateModifiedGmt,
    // this.catalogVisibility,
    // this.sku,
    // this.dateOnSaleFrom,
    // this.dateOnSaleFromGmt,
    // this.dateOnSaleTo,
    // this.dateOnSaleToGmt,
    // this.priceHtml,
    // this.virtual,
    // this.downloadable,
    // this.downloads,
    // this.downloadLimit,
    // this.downloadExpiry,
    // this.externalUrl,
    // this.buttonText,
    // this.taxStatus,
    // this.taxClass,
    // this.manageStock,
    // this.stockQuantity,
    // this.backorders,
    // this.backordersAllowed,
    // this.backordered,
    // this.soldIndividually,
    // this.weight,
    // this.dimensions,
    // this.shippingRequired,
    // this.shippingTaxable,
    // this.shippingClass,
    // this.shippingClassId,
    // this.upsellIds,
    // this.crossSellIds,
    // this.parentId,
    // this.purchaseNote,
    // this.tags,
    // this.defaultAttributes,
    // this.metaData,
    // this.links
  });

  ProductsModel.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    type = json["type"];
    status = json["status"];
    featured = json["featured"];
    description = json["description"];
    shortDescription = json["short_description"];
    price = json["price"];
    regularPrice = json["regular_price"];
    salePrice = json["sale_price"];
    onSale = json["on_sale"];
    purchasable = json["purchasable"];
    totalSales = json["total_sales"];
    inStock = json["in_stock"];
    reviewsAllowed = json["reviews_allowed"];
    averageRating = json["average_rating"];
    ratingCount = json["rating_count"];
    relatedIds =
        json["related_ids"] != null ? json["related_ids"].cast<int>() : [];
    if (json["categories"] != null) {
      categories = [];
      json["categories"].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    if (json["images"] != null) {
      images = [];
      json["images"].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    if (json["attributes"] != null) {
      attributes = [];
      json["attributes"].forEach((v) {
        attributes.add(Attributes.fromJson(v));
      });
    }
    variations =
        json["variations"] != null ? json["variations"].cast<int>() : [];
    menuOrder = json["menu_order"];
    store = json["store"] != null ? Store.fromJson(json["store"]) : null;
    // slug = json["slug"];
    // permalink = json["permalink"];
    // dateCreated = json["date_created"];
    // dateCreatedGmt = json["date_created_gmt"];
    // dateModified = json["date_modified"];
    // dateModifiedGmt = json["date_modified_gmt"];
    // catalogVisibility = json["catalog_visibility"];
    // sku = json["sku"];
    // dateOnSaleFrom = json["date_on_sale_from"];
    // dateOnSaleFromGmt = json["date_on_sale_from_gmt"];
    // dateOnSaleTo = json["date_on_sale_to"];
    // dateOnSaleToGmt = json["date_on_sale_to_gmt"];
    // priceHtml = json["price_html"];
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
    // externalUrl = json["external_url"];
    // buttonText = json["button_text"];
    // taxStatus = json["tax_status"];
    // taxClass = json["tax_class"];
    // manageStock = json["manage_stock"];
    // stockQuantity = json["stock_quantity"];
    // backorders = json["backorders"];
    // backordersAllowed = json["backorders_allowed"];
    // backordered = json["backordered"];
    // soldIndividually = json["sold_individually"];
    // weight = json["weight"];
    // dimensions = json["dimensions"] != null ? Dimensions.fromJson(json["dimensions"]) : null;
    // shippingRequired = json["shipping_required"];
    // shippingTaxable = json["shipping_taxable"];
    // shippingClass = json["shipping_class"];
    // shippingClassId = json["shipping_class_id"];
    // if (json["upsell_ids"] != null) {
    //   upsellIds = [];
    //   json["upsell_ids"].forEach((v) {
    //     upsellIds.add(dynamic.fromJson(v));
    //   });
    // }
    // if (json["cross_sell_ids"] != null) {
    //   crossSellIds = [];
    //   json["cross_sell_ids"].forEach((v) {
    //     crossSellIds.add(dynamic.fromJson(v));
    //   });
    // }
    // parentId = json["parent_id"];
    // purchaseNote = json["purchase_note"];
    // if (json["tags"] != null) {
    //   tags = [];
    //   json["tags"].forEach((v) {
    //     tags.add(Tags.fromJson(v));
    //   });
    // }
    // if (json["default_attributes"] != null) {
    //   defaultAttributes = [];
    //   json["default_attributes"].forEach((v) {
    //     defaultAttributes.add(dynamic.fromJson(v));
    //   });
    // }
    // if (json["grouped_products"] != null) {
    //   groupedProducts = [];
    //   json["grouped_products"].forEach((v) {
    //     groupedProducts.add(dynamic.fromJson(v));
    //   });
    // }
    // if (json["meta_data"] != null) {
    //   metaData = [];
    //   json["meta_data"].forEach((v) {
    //     metaData.add(Meta_data.fromJson(v));
    //   });
    // }
    // links = json["_links"] != null ? _links.fromJson(json["Links"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["type"] = type;
    map["status"] = status;
    map["featured"] = featured;
    map["description"] = description;
    map["short_description"] = shortDescription;
    map["price"] = price;
    map["regular_price"] = regularPrice;
    map["sale_price"] = salePrice;
    map["on_sale"] = onSale;
    map["purchasable"] = purchasable;
    map["total_sales"] = totalSales;
    map["in_stock"] = inStock;
    map["reviews_allowed"] = reviewsAllowed;
    map["average_rating"] = averageRating;
    map["rating_count"] = ratingCount;
    map["related_ids"] = relatedIds;
    if (categories != null) {
      map["categories"] = categories.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      map["images"] = images.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      map["attributes"] = attributes.map((v) => v.toJson()).toList();
    }
    map["variations"] = variations;
    map["menu_order"] = menuOrder;
    if (store != null) {
      map["store"] = store.toJson();
    }
    // map["slug"] = slug;
    // map["permalink"] = permalink;
    // map["date_created"] = dateCreated;
    // map["date_created_gmt"] = dateCreatedGmt;
    // map["date_modified"] = dateModified;
    // map["date_modified_gmt"] = dateModifiedGmt;
    // map["catalog_visibility"] = catalogVisibility;
    // map["sku"] = sku;
    // map["date_on_sale_from"] = dateOnSaleFrom;
    // map["date_on_sale_from_gmt"] = dateOnSaleFromGmt;
    // map["date_on_sale_to"] = dateOnSaleTo;
    // map["date_on_sale_to_gmt"] = dateOnSaleToGmt;
    // map["price_html"] = priceHtml;
    // map["virtual"] = virtual;
    // map["downloadable"] = downloadable;
    // if (downloads != null) {
    //   map["downloads"] = downloads.map((v) => v.toJson()).toList();
    // }
    // map["download_limit"] = downloadLimit;
    // map["download_expiry"] = downloadExpiry;
    // map["external_url"] = externalUrl;
    // map["button_text"] = buttonText;
    // map["tax_status"] = taxStatus;
    // map["tax_class"] = taxClass;
    // map["manage_stock"] = manageStock;
    // map["stock_quantity"] = stockQuantity;
    // map["backorders"] = backorders;
    // map["backorders_allowed"] = backordersAllowed;
    // map["backordered"] = backordered;
    // map["sold_individually"] = soldIndividually;
    // map["weight"] = weight;
    // if (dimensions != null) {
    //   map["dimensions"] = dimensions.toJson();
    // }
    // map["shipping_required"] = shippingRequired;
    // map["shipping_taxable"] = shippingTaxable;
    // map["shipping_class"] = shippingClass;
    // map["shipping_class_id"] = shippingClassId;
    // if (upsellIds != null) {
    //   map["upsell_ids"] = upsellIds.map((v) => v.toJson()).toList();
    // }
    // if (crossSellIds != null) {
    //   map["cross_sell_ids"] = crossSellIds.map((v) => v.toJson()).toList();
    // }
    // map["parent_id"] = parentId;
    // map["purchase_note"] = purchaseNote;
    // if (tags != null) {
    //   map["tags"] = tags.map((v) => v.toJson()).toList();
    // }
    // if (defaultAttributes != null) {
    //   map["default_attributes"] = defaultAttributes.map((v) => v.toJson()).toList();
    // }
    // if (groupedProducts != null) {
    //   map["grouped_products"] = groupedProducts.map((v) => v.toJson()).toList();
    // }
    // if (metaData != null) {
    //   map["meta_data"] = metaData.map((v) => v.toJson()).toList();
    // }
    // if (links != null) {
    //   map["_links"] = links.toJson();
    // }
    return map;
  }
}

class Collection {
  String href;

  Collection({this.href});

  Collection.fromJson(dynamic json) {
    href = json["href"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["href"] = href;
    return map;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(dynamic json) {
    href = json["href"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["href"] = href;
    return map;
  }
}

class Store {
  int id;
  String name;
  String shopName;
  String url;
  Address address;

  Store({this.id, this.name, this.shopName, this.url, this.address});

  Store.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    shopName = json["shop_name"];
    url = json["url"];
    address =
        json["address"] != null ? Address.fromJson(json["address"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["shop_name"] = shopName;
    map["url"] = url;
    if (address != null) {
      map["address"] = address.toJson();
    }
    return map;
  }
}

class Address {
  String street1;
  String street2;
  String city;
  String zip;
  String country;
  String state;

  Address(
      {this.street1,
      this.street2,
      this.city,
      this.zip,
      this.country,
      this.state});

  Address.fromJson(dynamic json) {
    street1 = json["street_1"];
    street2 = json["street_2"];
    city = json["city"];
    zip = json["zip"];
    country = json["country"];
    state = json["state"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["street_1"] = street1;
    map["street_2"] = street2;
    map["city"] = city;
    map["zip"] = zip;
    map["country"] = country;
    map["state"] = state;
    return map;
  }
}

class Attributes {
  int id;
  String name;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  Attributes(
      {this.id,
      this.name,
      this.position,
      this.visible,
      this.variation,
      this.options});

  Attributes.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    position = json["position"];
    visible = json["visible"];
    variation = json["variation"];
    options = json["options"] != null ? json["options"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["position"] = position;
    map["visible"] = visible;
    map["variation"] = variation;
    map["options"] = options;
    return map;
  }
}

class Images {
  int id;
  String src;
  // String dateCreated;
  // String dateCreatedGmt;
  // String dateModified;
  // String dateModifiedGmt;
  // String name;
  // String alt;
  // int position;

  Images(
      {this.id,
      this.src,
      // this.dateCreated,
      // this.dateCreatedGmt,
      // this.dateModified,
      // this.dateModifiedGmt,
      // this.name,
      // this.alt,
      // this.position
      });

  Images.fromJson(dynamic json) {
    id = json["id"];
    src = json["src"];
    // dateCreated = json["date_created"];
    // dateCreatedGmt = json["date_created_gmt"];
    // dateModified = json["date_modified"];
    // dateModifiedGmt = json["date_modified_gmt"];
    // name = json["name"];
    // alt = json["alt"];
    // position = json["position"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["src"] = src;
    // map["date_created"] = dateCreated;
    // map["date_created_gmt"] = dateCreatedGmt;
    // map["date_modified"] = dateModified;
    // map["date_modified_gmt"] = dateModifiedGmt;
    // map["name"] = name;
    // map["alt"] = alt;
    // map["position"] = position;
    return map;
  }
}

class Tags {
  int id;
  String name;
  String slug;

  Tags({this.id, this.name, this.slug});

  Tags.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    return map;
  }
}

class Categories {
  int id;
  String name;
  String slug;

  Categories({this.id, this.name, this.slug});

  Categories.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["slug"] = slug;
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
