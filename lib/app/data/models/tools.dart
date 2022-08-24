class Tool {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;
  int? quantity;

  Tool({this.toolId, this.name, this.description, this.imageUrl,this.quantity=1});

  Tool.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    quantity = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toolId'] = toolId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}