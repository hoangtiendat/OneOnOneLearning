import 'package:flutter/material.dart';
import 'package:one_on_one_learning/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenWidth! * 0.3,
      width: SizeConfig.screenWidth! * 0.3,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar/avatar3.jpg"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white, width: 2),
                  ),
                  primary: const Color(0xFFF5F6F9),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.add_a_photo_rounded,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
