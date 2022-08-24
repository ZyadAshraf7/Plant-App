class Plant {
  String? plantId;
  String? name;
  String? description;
  int? waterCapacity;
  int? sunLight;
  int? temperature;
  int? quantity;
  String? imageUrl;

  Plant({
    this.plantId,
    this.name,
    this.description,
    this.waterCapacity,
    this.sunLight,
    this.temperature,
    this.imageUrl,
    this.quantity=1,
  });

  Plant.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
    quantity = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['plantId'] = plantId;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['waterCapacity'] = waterCapacity;
    data['sunLight'] = sunLight;
    data['temperature'] = temperature;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
