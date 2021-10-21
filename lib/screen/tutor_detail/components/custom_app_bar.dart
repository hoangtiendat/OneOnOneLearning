import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/tutors/tutors_screen.dart';
import '../../../size_config.dart';




class CustomAppBar extends StatelessWidget  with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);


  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    )
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                // onPressed: () => Navigator.pop(context),
                onPressed: () => Navigator.popAndPushNamed(context, TutorsScreen.routeName),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15,)
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                semanticLabel: 'Remove from saved',
              ),
            )
          ],
        ),
          ),
      ),
    );
  }
}


