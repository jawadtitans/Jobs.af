import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../Providers/theme_provider.dart' as custom;
import '../../utils/constants/colors.dart';
import '../home/widgets/customeAPPBar_with_drawer.dart';
import '../home/widgets/filter/main_content.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottomOpacity: 0.1,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 13),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.close, size: 21, color: Colors.black87),
          ),
          Expanded(
            child: SearchBar(
              constraints: BoxConstraints(maxHeight: 80, minHeight: 47),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              ),
              elevation: WidgetStateProperty.all(0.0),
              onTap: () {},
              backgroundColor: WidgetStatePropertyAll(
                Color(0xFFeaf3fe).withOpacity(0.7),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide.none,
                ),
              ),
              hintText: "i.e Mobile Developer",
              hintStyle: WidgetStateProperty.all(
                TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const FilterBottomSheet(),
              );
            },
            child: Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.black38,
                highlightColor: Colors.transparent,
                onTap: () {
                  showModalBottomSheet(
                    useSafeArea: false,
                    enableDrag: false,
                    elevation: 0.0,
                    barrierLabel: "Filter",
                    isDismissible: true,
                    backgroundColor: themeProvider.isdarkMode
                        ? Color(0xFF000C19)
                        : const Color(0xFFf1f1f1),
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    builder: (context) => DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.84,
                      minChildSize: 0.1,
                      maxChildSize: 0.93,
                      builder: (context, scrollController) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 21,
                            vertical: 13,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /// TODO: header part in here:
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.close, size: 24),
                                  ),
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: themeProvider.isdarkMode
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              FilterContents(),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    IconlyLight.filter,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Not Found in Search!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
