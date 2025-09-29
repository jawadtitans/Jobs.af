import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/theme_provider.dart' as custom;
import '../../../../utils/constants/colors.dart';
import 'main_content.dart';

class JobTypeSelector extends StatelessWidget {
  final JobType? selected;
  final ValueChanged<JobType> onChanged;

  const JobTypeSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    return Row(
      children: JobType.values.map((type) {
        final isSelected = type == selected;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(type),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
              decoration: BoxDecoration(
                color: isSelected ? TColors.primary.withOpacity(0.09) : null,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? TColors.primary : Colors.grey.shade400,
                  width: isSelected ? 1 : 0.8,
                ),
              ),
              child: Text(
                type == JobType.fullTime ? "Full Time" : "Part Time",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? TColors.primary
                      : themeProvider.isdarkMode
                      ? Colors.white70
                      : Colors.black87,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
