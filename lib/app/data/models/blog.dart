import 'package:plant_app/app/data/models/plant.dart';
import 'package:plant_app/app/data/models/seeds.dart';
import 'package:plant_app/app/data/models/tools.dart';

class Blog {
  List<Plant>? plants;
  List<Seed>? seeds;
  List<Tool>? tools;

  Blog({this.plants, this.seeds, this.tools});

  Blog.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <Plant>[];
      json['plants'].forEach((v) {
        plants!.add(new Plant.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = <Seed>[];
      json['seeds'].forEach((v) {
        seeds!.add(new Seed.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = <Tool>[];
      json['tools'].forEach((v) {
        tools!.add(new Tool.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plants != null) {
      data['plants'] = this.plants!.map((v) => v.toJson()).toList();
    }
    if (this.seeds != null) {
      data['seeds'] = this.seeds!.map((v) => v.toJson()).toList();
    }
    if (this.tools != null) {
      data['tools'] = this.tools!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}