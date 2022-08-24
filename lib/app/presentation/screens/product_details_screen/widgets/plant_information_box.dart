import 'package:flutter/material.dart';

import '../../../../core/constants/style_manager.dart';

class PlantInformationBox extends StatelessWidget {
  const PlantInformationBox({
    Key? key,
    required this.sunLight, this.temprature, this.waterCapacity,
  }) : super(key: key);

  final String? sunLight;
  final String? temprature;
  final String? waterCapacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.64),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/images/sun.png"),
              ),
              SizedBox(width: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sunLight!+' %',style: getSemiBoldStyle(color: Colors.white,fontSize: 20),),
                  Text("Sun light",style: getRegularStyle(color: Colors.white),),
                ],
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.64),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/images/water.png",width: 26,),
              ),
              SizedBox(width: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(waterCapacity!+' %',style: getSemiBoldStyle(color: Colors.white,fontSize: 20),),
                  Text("Water Capacity",style: getRegularStyle(color: Colors.white),),
                ],
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.64),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/images/thermometer.png"),
              ),
              SizedBox(width: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(temprature!+' C',style: getSemiBoldStyle(color: Colors.white,fontSize: 20),),
                  Text("Temprature",style: getRegularStyle(color: Colors.white),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
