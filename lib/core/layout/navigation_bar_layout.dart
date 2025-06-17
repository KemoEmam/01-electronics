import 'package:electronics_task/core/layout/destination_entity.dart';
import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavigationBarLayout extends StatefulWidget {
  const NavigationBarLayout({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  State<NavigationBarLayout> createState() => _NavigationBarLayoutPState();
}

class _NavigationBarLayoutPState extends State<NavigationBarLayout> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        PersistentTabController(initialIndex: widget.shell.currentIndex);
  }

  @override
  void didUpdateWidget(covariant NavigationBarLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller.index != widget.shell.currentIndex) {
      _controller.jumpToTab(widget.shell.currentIndex);
    }
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return getDestinationEntity(context).map((destination) {
      return PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset(
            destination.icon,
            width: 30,
            height: 30,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          destination.icon,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        title: destination.label,
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        contentPadding: 2,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.shell,
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: getDestinationEntity(context)
            .map(
              (destination) => destination.screen,
            )
            .toList(),
        items: _navBarItems(),
        navBarHeight: 65,
        backgroundColor: Colors.white,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        navBarStyle: NavBarStyle.style3,
        onItemSelected: (index) {
          widget.shell.goBranch(index);
        },
      ),
    );
  }
}
