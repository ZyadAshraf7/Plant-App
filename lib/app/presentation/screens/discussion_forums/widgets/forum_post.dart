import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/api_strings.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/style_manager.dart';
import '../../../../data/models/forums.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({Key? key, required this.forum}) : super(key: key);
  final Forum forum;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  forum.user == null
                      ? SizedBox()
                      : ForumPostUserInformation(forum: forum),
                  SizedBox(height: 12),
                  Text(
                    forum.title ?? "",
                    style: getBoldStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    forum.description ?? "",
                    style: getRegularStyle(
                      color: const Color(0xff8F8D8D),
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: (forum.imageUrl == null || forum.imageUrl == "")
                ? Image.asset(
                    "assets/images/p1.png",
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    baseUrl + forum.imageUrl!,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset("assets/images/icons/like.svg"),
              SizedBox(width: 4),
              Text(
                "${forum.forumLikes?.length} Likes",
                style: getMediumStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 11,
                ),
              ),
              SizedBox(width: 44),
              Text(
                "${forum.forumComments?.length} Replies",
                style: getMediumStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 11,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ForumPostUserInformation extends StatelessWidget {
  const ForumPostUserInformation({
    Key? key,
    required this.forum,
  }) : super(key: key);

  final Forum forum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    forum.user!.imageUrl ?? "",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    "${forum.user?.firstName ?? ""} ${forum.user?.lastName ?? ""}",
                    style: getBoldStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "a month ago",
                  style: getRegularStyle(
                    color: AppColors.heavyLightGrey.withOpacity(0.84),
                    fontSize: 11,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
