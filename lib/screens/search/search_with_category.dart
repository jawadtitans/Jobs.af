import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../Providers/theme_provider.dart' as custom;
import '../../utils/constants/colors.dart';
import '../home/widgets/customeAPPBar_with_drawer.dart';
import '../home/widgets/filter/main_content.dart';

class SearchWithCategory extends StatefulWidget {
  final String? category;
  final String? query;

  const SearchWithCategory({super.key, this.category, this.query});

  @override
  State<SearchWithCategory> createState() => _SearchWithCategoryState();
}

class _SearchWithCategoryState extends State<SearchWithCategory> {
  late TextEditingController _searchController;
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.query ?? '');
    _currentQuery = widget.query ?? '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _getCategoryTitle(String? category) {
    switch (category) {
      case 'staking':
        return 'استیکینگ تتر';
      case 'gift_cards':
        return 'خرید گیفت کارت';
      case 'crypto_swap':
        return 'سواپ ارز دیجیتال';
      case 'quick_trade':
        return 'معامله سریع';
      case 'professional_trading':
        return 'معاملات حرفه ای';
      case 'asset_conversion':
        return 'تبدیل دارایی های خرد';
      case 'mobile_charge':
        return 'خرید شارژ';
      default:
        return 'همه دسته‌بندی‌ها';
    }
  }

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
            icon: const Icon(Icons.close, size: 21, color: Colors.black87),
          ),
          Expanded(
            child: SearchBar(
              leading: Icon(IconlyLight.search, color: Colors.grey.shade400),
              controller: _searchController,
              constraints: const BoxConstraints(maxHeight: 80, minHeight: 47),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              ),
              elevation: WidgetStateProperty.all(0.0),
              onTap: () {},
              onSubmitted: (value) {
                setState(() {
                  _currentQuery = value;
                });
              },
              backgroundColor: WidgetStatePropertyAll(
                const Color(0xFFeaf3fe).withOpacity(0.7),
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
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          // Category Filter Chip
          if (widget.category != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.category,
                          size: 16,
                          color: Colors.blue.shade700,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _getCategoryTitle(widget.category),
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            // Remove category filter
                            GoRouter.of(context).pushReplacementNamed(
                              'search',
                              queryParameters: {
                                if (_currentQuery.isNotEmpty)
                                  'query': _currentQuery,
                              },
                            );
                          },
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Search Results
          Expanded(child: _buildSearchResults()),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    // Mock data for demonstration
    final List<Map<String, dynamic>> mockJobs = [
      {
        'title': 'Mobile Developer',
        'company': 'Tech Company',
        'location': 'Tehran, Iran',
        'salary': '15,000,000 - 25,000,000 Toman',
        'type': 'Full-time',
        'category': 'mobile_development',
      },
      {
        'title': 'Flutter Developer',
        'company': 'Startup Co',
        'location': 'Remote',
        'salary': '20,000,000 - 30,000,000 Toman',
        'type': 'Full-time',
        'category': 'mobile_development',
      },
      {
        'title': 'Backend Developer',
        'company': 'Enterprise Inc',
        'location': 'Isfahan, Iran',
        'salary': '18,000,000 - 28,000,000 Toman',
        'type': 'Full-time',
        'category': 'backend_development',
      },
    ];

    // Filter jobs based on category and query
    List<Map<String, dynamic>> filteredJobs = mockJobs.where((job) {
      bool matchesCategory =
          widget.category == null || job['category'] == widget.category;
      bool matchesQuery =
          _currentQuery.isEmpty ||
          job['title'].toLowerCase().contains(_currentQuery.toLowerCase()) ||
          job['company'].toLowerCase().contains(_currentQuery.toLowerCase());

      return matchesCategory && matchesQuery;
    }).toList();

    if (filteredJobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No jobs found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search criteria',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredJobs.length,
      itemBuilder: (context, index) {
        final job = filteredJobs[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      job['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      job['type'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                job['company'],
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    job['location'],
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                job['salary'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
