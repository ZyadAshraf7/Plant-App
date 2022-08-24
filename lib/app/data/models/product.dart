import 'package:plant_app/app/data/models/plant.dart';
import 'package:plant_app/app/data/models/seeds.dart';
import 'package:plant_app/app/data/models/tools.dart';

class Product {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  int? quantity;
  bool? available;
  Seed? seed;
  Plant? plant;
  Tool? tool;

  Product(
      {this.productId,
        this.name,
        this.description,
        this.imageUrl,
        this.type,
        this.price,
        this.quantity=1,
        this.available,
        this.seed,
        this.plant,
        this.tool});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = json['seed'] != null ? new Seed.fromJson(json['seed']) : null;
    plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
    tool = json['tool'] != null ? new Tool.fromJson(json['tool']) : null;
    quantity=1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['type'] = this.type;
    data['price'] = this.price;
    data['available'] = this.available;
    if (this.seed != null) {
      data['seed'] = this.seed!.toJson();
    }
    if (this.plant != null) {
      data['plant'] = this.plant!.toJson();
    }
    if (this.tool != null) {
      data['tool'] = this.tool!.toJson();
    }
    return data;
  }
}
