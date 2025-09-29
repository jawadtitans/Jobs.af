import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:toastification/toastification.dart';

class PromotedJobCard extends StatefulWidget {
  final String title, company, location, date;
  final String? vacancies;

  const PromotedJobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.date,
    this.vacancies,
  });

  @override
  State<PromotedJobCard> createState() => PromotedJobCardState();
}

class PromotedJobCardState extends State<PromotedJobCard> {
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
    return Container(
      height: 310,
      width: 320,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/images/banners/bam.jpg"), // fixed image
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.1), // overlay for readability
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 21),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      width: 50,
                      height: 50,
                      "assets/icons/brands/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "Arabic",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${widget.company} • ${widget.location} ${widget.date}",
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (widget.vacancies != null && widget.vacancies!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white30,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 2,
                    ),
                    child: Text(
                      widget.vacancies!,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),

                  InkWell(
                    onTap: _toggleSaved,
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: _isSaved ? Colors.green : Colors.white30,
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
    );
  }
}
