import 'package:flutter/material.dart';
import 'package:plant_app/app/presentation/screens/notification_screen/widgets/notification_box.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        separatorBuilder: (context, _) {
          return SizedBox(height: 10);
        },
        itemBuilder: (context, i) {
          return Column(
            children: [
              const NotificationBox(
                  description:
                      "“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”",
                  imageUrl:
                      "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg",
                  title:
                      "Dennis Nedry commented on Isla Nublar SOC2 compliance report    ",
                  time: "Yesterday at 11:42 PM"),
              Container(
                color: Color(0xffE8EBF0),
                height: 1,
              ),
              SizedBox(height: 10),
              const NotificationBox(imageUrl:
                  "https://media.istockphoto.com/photos/handsome-in-spectacles-picture-id656673020?k=20&m=656673020&s=612x612&w=0&h=kJ5fq_Exi0FG0yw7tqwTdfXuUPBac0o0eH3kSyQyxWs=",
                  title:
                  "Joy Arnold left 6 comments on Your Post",
                  time: "Joy Arnold left 6 comments on Your Post"),
              Container(
                color: Color(0xffE8EBF0),
                height: 1,
              ),
              SizedBox(height: 10)
            ],
          );
        },
        itemCount: 2,
      ),
    );
  }
}
