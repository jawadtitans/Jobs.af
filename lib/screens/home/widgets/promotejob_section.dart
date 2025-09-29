import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'cards/promote_job_card.dart';

class promote_job_slider extends StatelessWidget {
  const promote_job_slider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.86,
          disableCenter: true,
          animateToClosest: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          pageSnapping: true,
          height: 185,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        items:
            const [
                  PromotedJobCard(
                    title: "آمر تطبیقات حسابی",
                    company: "Moore Afghanistan",
                    location: "Kabul",
                    date: "Sep 25, 2025",
                  ),
                  PromotedJobCard(
                    vacancies: "2 Vacancies",
                    title: "Livelihood Officer",
                    company: "Moore Afghanistan",
                    location: "Multi Location",
                    date: "Sep 25, 2025",
                  ),
                  PromotedJobCard(
                    vacancies: "5 Vacancies",
                    title: "مرکز عالی آموزشی کاج",
                    company: "Moore Afghanistan",
                    location: "Kabul",
                    date: "Sep 25, 2025",
                  ),
                  PromotedJobCard(
                    vacancies: "1 Vacancies",
                    title: "Livelihood Officer",
                    company: "Moore Afghanistan",
                    location: "Multi Location",
                    date: "Sep 25, 2025",
                  ),
                ]
                .map(
                  (card) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: card,
                  ),
                )
                .toList(),
      ),
    );
  }
}
