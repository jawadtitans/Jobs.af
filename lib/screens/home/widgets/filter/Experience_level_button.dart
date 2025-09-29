import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/theme_provider.dart' as custom;
import 'main_content.dart';
import 'package:flutter/material.dart';

/// Experience dropdown
class ExperienceDropdown extends StatelessWidget {
  final ExperienceLevel? selected;
  final ValueChanged<ExperienceLevel?> onChanged;

  const ExperienceDropdown({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    return SizedBox(
      width: double.infinity, // adjust as you want
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<ExperienceLevel>(
          value: selected,
          isExpanded: true,
          hint: Text(
            "Select Experience Level",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
            ),
          ),
          items: ExperienceLevel.values.map((exp) {
            return DropdownMenuItem(
              value: exp,
              child: Text(exp.name[0].toUpperCase() + exp.name.substring(1)),
            );
          }).toList(),
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            height: 55,
            width: 250, // control dropdown width
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade400, width: 0.8),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeProvider.isdarkMode
                  ? Color(0xFF0C1826)
                  : Colors.white,
            ),
            offset: const Offset(0, -5),
            openInterval: const Interval(
              0.0,
              1.0,
              curve: Curves.easeOutBack,
            ), // animation
          ),
          iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_drop_down)),
        ),
      ),
    );
  }
}
