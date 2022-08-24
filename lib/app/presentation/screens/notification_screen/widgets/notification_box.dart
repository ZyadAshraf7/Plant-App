import 'package:flutter/material.dart';

import '../../../../core/constants/style_manager.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox(
      {Key? key,
      required this.imageUrl,
      required this.title,
      this.description,
      required this.time})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String? description;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              description != null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 3,
                              decoration: BoxDecoration(
                                color: Color(0xffDDDEE1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                description!,
                                style: getMediumStyle(
                                  color: Color(0xff1A1F36),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 10,),
              Text(time,style: getRegularStyle(color: Color(0xffA5ACB8),fontSize: 14,),),
              SizedBox(height: 10,),
            ],
          ),
        ],
      ),
    );
  }
}
