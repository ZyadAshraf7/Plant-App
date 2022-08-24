class Seed {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;
  int ? quantity;
  Seed({this.seedId, this.name, this.description, this.imageUrl,this.quantity=1});

  Seed.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    quantity = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seedId'] = seedId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}