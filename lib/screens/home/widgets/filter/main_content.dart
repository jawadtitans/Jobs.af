import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobs_af/screens/home/widgets/filter/primary_input.dart';
import 'package:jobs_af/screens/home/widgets/filter/selector.dart';
import '../../../../utils/constants/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'Experience_level_button.dart';
import 'labels.dart';

/// Enum for job types
enum JobType { fullTime, partTime }

/// Enum for experience levels
enum ExperienceLevel { junior, mid, senior, lead }

class FilterContents extends StatefulWidget {
  const FilterContents({super.key});

  @override
  State<FilterContents> createState() => _FilterContentsState();
}

class _FilterContentsState extends State<FilterContents> {
  // Selected values
  JobType? _selectedJobType;
  ExperienceLevel? _selectedExperience;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionLabel(title: "Category"),
            const SearchInput(hint: "Search By Category"),
            const SizedBox(height: 16),

            const SectionLabel(title: "Location"),
            const SearchInput(hint: "Search By Location"),
            const SizedBox(height: 16),

            const SectionLabel(title: "Company"),
            const SearchInput(hint: "Search By Company"),
            const SizedBox(height: 16),

            const SectionLabel(title: "Job Type"),
            JobTypeSelector(
              selected: _selectedJobType,
              onChanged: (jobType) =>
                  setState(() => _selectedJobType = jobType),
            ),
            const SizedBox(height: 16),

            const SectionLabel(title: "Experience Level"),
            ExperienceDropdown(
              selected: _selectedExperience,
              onChanged: (exp) => setState(() => _selectedExperience = exp),
            ),
            const SizedBox(height: 32),

            // Filter Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Category, Location, Company (from TextInputs)");
                  debugPrint("Selected Job Type: $_selectedJobType");
                  debugPrint("Selected Experience: $_selectedExperience");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: TColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                ),
                child: const Text(
                  "Filtering",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
