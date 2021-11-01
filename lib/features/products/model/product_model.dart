class ProductModel {
  String? sId;
  String? name;
  String? image;
  int? total;
  int? price;

  ProductModel({this.sId, this.name, this.image, this.total, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    total = json['total'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['total'] = total;
    data['price'] = price;
    return data;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProductModel &&
        o.sId == sId &&
        o.name == name &&
        o.image == image &&
        o.total == total &&
        o.price == price;
  }

  @override
  int get hashCode {
    return sId.hashCode ^
        name.hashCode ^
        image.hashCode ^
        total.hashCode ^
        price.hashCode;
  }
}
