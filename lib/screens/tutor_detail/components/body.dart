import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/language_loccal.dart';
import 'package:one_on_one_learning/components/outlined_button_icon.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/components/specialties.dart';
import 'package:one_on_one_learning/components/title_blue_bold.dart';
import 'package:one_on_one_learning/components/video_player_screen.dart';
import 'package:one_on_one_learning/models/tutor/tutor.dart';
import 'package:one_on_one_learning/provider/tutor.dart';
import 'package:one_on_one_learning/screens/booking/booking_screen.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'action_count.dart';
import 'info_tutor.dart';
import 'panel_expand.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Tutor tutor = Provider.of<TutorProvider>(context, listen: false).tutorCurr;
    List<String> languages = (tutor.languages ?? "").split(",");
    var language = LanguageLocal();
    List<String> specialties = (tutor.specialties ?? "").split(",");
    var spec = Specialties();
    return SafeArea(
      child: tutor.id == null
          ? const Center(
              child: Text(
                'No data.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        InfoTutor(
                          tutor: tutor,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButtonIcon(
                            text: " Booking ",
                            icon: const Icon(Icons.bookmark_add),
                            press: () {
                              Navigator.pushNamed(
                                  context, BookingScreen.routeName);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            ActionCount(
                              icon: Icons.message,
                              text: "Message",
                            ),
                            ActionCount(
                              icon: Icons.report,
                              text: "Report",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          tutor.bio ?? "",
                          maxLines: null,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 200,
                          child: VideoPlayerScreen(
                            urlVideo: tutor.video!,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(18)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleBlueBold(
                            text: "Languages",
                          ),
                          SizedBox(
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: languages
                                  .map(
                                    (item) => OutlinedButtonNoIcon(
                                      text: language.getDisplayLanguage(item),
                                      press: () {},
                                    ),
                                  )
                                  .toList()
                                  .cast<Widget>(),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const TitleBlueBold(
                            text: "Interests",
                          ),
                          Text(
                            tutor.interests ?? "",
                            maxLines: null,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const TitleBlueBold(
                            text: "Teaching experience",
                          ),
                          Text(
                            tutor.experience ?? "",
                            maxLines: null,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const TitleBlueBold(
                            text: "Specialties",
                          ),
                          SizedBox(
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: specialties
                                  .map(
                                    (item) => OutlinedButtonNoIcon(
                                      text: spec.getSpecialtie(item),
                                      press: () {},
                                    ),
                                  )
                                  .toList()
                                  .cast<Widget>(),
                            ),
                          ),
                          const TitleBlueBold(
                            text: "Course",
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          PanelExpand(feedbacks: tutor.user!.feedbacks),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
            ),
    );
  }
}
