import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/theme_viewmodel.dart';
import '../viewmodels/task_viewmodel.dart';
import '../widgets/header_card.dart';
import '../widgets/week_calendar.dart';
import '../widgets/task_list.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Today'),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            Consumer<ThemeViewModel>(
              builder: (context, themeViewModel, _) {
                return IconButton(
                  icon: Icon(
                    themeViewModel.isDarkMode
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                  onPressed: () {
                    themeViewModel.toggleTheme();
                  },
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const HeaderCard(),
                        const SizedBox(height: 20),
                        const WeekCalendar(),
                        const SizedBox(height: 24),
                        const TaskList(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            BottomNavBar(),
            SizedBox(height: 16),
          ],
        ),

      ),

    );
  }
}