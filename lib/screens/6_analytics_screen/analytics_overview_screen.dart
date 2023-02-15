import 'package:flutter/material.dart';
import 'package:foodport_app/utils/colors.dart';

import '../../widgets/charts/total_page_visit_chart.dart';

class AnalyticsOverview extends StatelessWidget {
  const AnalyticsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: webBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Title
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                left: 32,
                right: 32,
                top: 32,
              ),
              child: const Text(
                "Overview",
                style: TextStyle(
                  fontSize: 32,
                  color: neutral1Color,
                ),
              ),
            ),

            // HEADING 1 - TRAFFIC
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 32,
              ),
              child: const Text(
                "Traffic",
                style: TextStyle(
                  fontSize: 20,
                  color: neutral1Color,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: Row(
                children: [
                  // Total Page Visit From Tagged Post
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Page Visit from Tagged Post",
                              style: TextStyle(
                                color: neutral1Color,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 150,
                              color: Colors.amber,
                              child: TotalPageVisitChart(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),

                  // Total Menu Visit From Tagged Post
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Total Menu Visit from Tagged Post",
                              style: TextStyle(
                                color: neutral1Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),

                  // Total Tagged Post
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Total Tagged Post",
                              style: TextStyle(
                                color: neutral1Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: Row(
                children: [
                  // New & Returning Tagging User
                  // Pie Chart
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "New & Returning Tagging User",
                              style: TextStyle(
                                color: neutral1Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),

                  // Traffic Sources
                  // List
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Traffic Sources",
                              style: TextStyle(
                                color: neutral1Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // HEADING 1 - CUSTOMER FEEDBACK
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 32,
              ),
              child: const Text(
                "Customer Feedback",
                style: TextStyle(
                  fontSize: 20,
                  color: neutral1Color,
                ),
              ),
            ),

            // HEADING 1 - CUSTOMER PROFILE
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 32,
              ),
              child: const Text(
                "Customer Profile",
                style: TextStyle(
                  fontSize: 20,
                  color: neutral1Color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
