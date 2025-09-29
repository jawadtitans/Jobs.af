import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../../../Providers/theme_provider.dart' as custom;

/// Latest Job Card Widget
class LatestJobCard extends StatefulWidget {
  final String title, company, location, date;
  final String? tag;
  final String? vacancies;

  const LatestJobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.date,
    this.tag,
    this.vacancies,
  });

  @override
  State<LatestJobCard> createState() => LatestJobCardState();
}

class LatestJobCardState extends State<LatestJobCard> {
  bool _isSaved = false;

  void _toggleSaved() {
    setState(() {
      _isSaved = !_isSaved;
    });
    toastification.show(
      direction: TextDirection.rtl,

      applyBlurEffect: true,
      context: context,
      type: _isSaved ? ToastificationType.success : ToastificationType.info,
      style: ToastificationStyle.flatColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(milliseconds: 1600),
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(
        borderRadius: BorderRadius.circular(20),
        color: _isSaved ? Colors.green : Colors.black,
      ),
      borderRadius: BorderRadius.circular(15),
      title: Text(
        _isSaved ? 'شغل تان ذخیره گردید.' : 'شغل انتخابی تان حذف گردید.',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: "Arabic",
        ),
      ),
      description: Text(
        style: TextStyle(fontFamily: "IRANSansX", fontSize: 11),
        _isSaved
            ? 'در بخش شغل های ذخیره شده یافت میتوانید.'
            : 'بوک مارک حذف گردید.',
      ),
      primaryColor: _isSaved ? Colors.green : Colors.blueGrey,
      closeButtonShowType: CloseButtonShowType.onHover,
      animationDuration: const Duration(milliseconds: 280),
      dragToClose: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: themeProvider.isdarkMode ? Color(0xFF0C1826) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          splashFactory: InkRipple.splashFactory,
          onTap: () {},
          splashColor: Colors.black87.withOpacity(0.08),
          highlightColor: Colors.black87.withOpacity(0.009765),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 52),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.black12,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(50),
                          child: Image.asset("assets/icons/brands/logo.png"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.company}",
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "${widget.location}  .  ${widget.date} ",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(vertical: 7),
                            child: Row(
                              children: [
                                if (widget.tag != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.186),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      widget.tag!,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                const SizedBox(width: 8),
                                if (widget.vacancies != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                      horizontal: 7,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(
                                        0.187,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      widget.vacancies!,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: _toggleSaved,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: _isSaved
                              ? Colors.green
                              : themeProvider.isdarkMode
                              ? Color(0xFF0C1826)
                              : Colors.grey,
                        ),
                        child: Icon(
                          _isSaved ? IconlyBold.bookmark : IconlyLight.bookmark,
                          size: 21,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
