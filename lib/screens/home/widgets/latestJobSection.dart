import 'package:flutter/material.dart';

import 'cards/lates_Job_card.dart';

class LatestJobSection extends StatelessWidget {
  const LatestJobSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
      sliver: SliverList(
        delegate: SliverChildListDelegate(const [
          LatestJobCard(
            title: "Gender And PSEA Officer",
            company: "Moore Afghanistan",
            location: "Kabul",
            date: "Sep 25, 2025",
            tag: "New",
          ),
          LatestJobCard(
            title: "Livelihood Officer",
            company: "Moore Afghanistan",
            location: "Multi Location",
            date: "Sep 25, 2025",
            vacancies: "7 Vacancies",
            tag: "Male",
          ),
          LatestJobCard(
            title: "Gender And PSEA Officer",
            company: "Moore Afghanistan",
            location: "Kabul",
            date: "Sep 25, 2025",
            tag: "male",
            vacancies: "10 Vacancies",
          ),
          LatestJobCard(
            title: "Livelihood Officer",
            company: "Moore Afghanistan",
            location: "Multi Location",
            date: "Sep 25, 2025",
            vacancies: "7 Vacancies",
          ),
        ]),
      ),
    );
  }
}
