import 'package:flutter/material.dart';
import '../../Theme/widget/darkBackground.dart';
import '../home/widgets/customeAPPBar_with_drawer.dart';
import '../home/widgets/latestJobSection.dart';
import '../home/widgets/promote_header.dart';
import '../home/widgets/promotejob_section.dart';

class JobHomePage extends StatelessWidget {
  const JobHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkBackground(
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const CustomAppBar(),
              // Promoted Jobs header
              SliverToBoxAdapter(
                child: promote_Job_title(count: 13, title: "Promoted Jobs"),
              ),
              // Carousel
              SliverToBoxAdapter(child: promote_job_slider()),
              // Latest Jobs header
              SliverToBoxAdapter(
                child: promote_Job_title(title: "Latest Jobs", count: 174),
              ),
              // Latest Jobs list
              LatestJobSection(),
            ],
          ),
        ),
      ),
    );
  }
}
