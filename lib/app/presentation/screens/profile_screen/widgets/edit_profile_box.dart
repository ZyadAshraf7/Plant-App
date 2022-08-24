import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/style_manager.dart';

class EditProfileBox extends StatelessWidget {
  const EditProfileBox({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 21),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black.withOpacity(0.19),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff6C6C6C1A).withOpacity(0.10),
                //offset: const Offset(0,22),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff1D592C),
                  ),
                  child: SvgPicture.asset(
                    "assets/images/icons/Sell.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style:
                  getSemiBoldStyle(color: Color(0xff2F2E2E), fontSize: 18),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward,
              color: Color(0xff1D592C),
            )
          ],
        ),
      ),
    );
  }
}
