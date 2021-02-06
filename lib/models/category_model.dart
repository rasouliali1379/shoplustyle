class CategoryModel {
  int id;
  String name;
  int parent;
  String description;
  String display;
  dynamic image;
  int count;
  // String slug;
  // int menuOrder;
  // _links links;

  CategoryModel({
      this.id, 
      this.name, 
      this.parent,
      this.description,
      this.display,
      this.image,
      this.count,
      // this.slug,
      // this.menuOrder,
      // this.links
  });

  CategoryModel.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    parent = json["parent"];
    description = json["description"];
    display = json["display"];
    image = json["image"];
    count = json["count"];
    // slug = json["slug"];
    // menuOrder = json["menu_order"];
    // links = json["_links"] != null ? _links.fromJson(json["Links"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["parent"] = parent;
    map["description"] = description;
    map["display"] = display;
    map["image"] = image;
    map["count"] = count;
    // map["slug"] = slug;
    // map["menu_order"] = menuOrder;
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
//   _links({
//       this.self,
//       this.collection,
//       this.up});
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
//
// }

// class Up {
//   String href;
//
//   Up({
//       this.href});
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
//
// }
//
// class Collection {
//   String href;
//
//   Collection({
//       this.href});
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
//
// }
//
// class Self {
//   String href;
//
//   Self({
//       this.href});
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
//
// }