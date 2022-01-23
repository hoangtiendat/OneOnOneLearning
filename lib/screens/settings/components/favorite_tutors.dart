import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/tutors.dart';
import 'package:one_on_one_learning/provider/tutor.dart';
import 'package:one_on_one_learning/screens/tutors/components/tutor_card.dart';
import 'package:provider/provider.dart';

class FavoriteTutors extends StatelessWidget {
  const FavoriteTutors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Tutors"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder<Tutors>(
                future: Provider.of<TutorProvider>(context, listen: true)
                    .fetchFavTutors(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.count,
                      itemBuilder: (context, index) => TutorCard(
                        tutor: snapshot.data!.rows[index],
                        isPop: false,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.all(50),
                    child: CircularProgressIndicator(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
