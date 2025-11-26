import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // BottomNavBar container
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCardBackground : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.white.withOpacity(0.05)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(icon: Icons.list_alt, index: 0, isDark: isDark),
                      _buildNavItem(icon: Icons.calendar_today, index: 1, isDark: isDark),
                      _buildNavItem(icon: Icons.folder_outlined, index: 2, isDark: isDark),
                      _buildNavItem(icon: Icons.grid_view, index: 3, isDark: isDark),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 4;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _selectedIndex == 4
                    ? (isDark
                    ? AppColors.accentPurple.withOpacity(0.4)   // ← হালকা ইফেক্ট
                    : AppColors.primaryBlue.withOpacity(0.1))
                    : (isDark ? AppColors.darkCardBackground : Colors.white),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                color: _selectedIndex == 4
                    ? (isDark ? AppColors.accentPurple : AppColors.primaryBlue)
                    : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                size: 28,
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required bool isDark,
  }) {
    final isSelected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? AppColors.accentPurple : AppColors.primaryBlue).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? (isDark ? AppColors.accentPurple : AppColors.primaryBlue)
                : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
            size: 24,
          ),
        ),
      ),
    );
  }
}
