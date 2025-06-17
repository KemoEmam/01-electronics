import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final bool showBackButton;
  final Color backgroundColor;
  final bool isSliver;
  final double expandedHeight;
  final Widget? background;
  final double topPadding;
  final double toolbarHeight;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.showBackButton = true,
    this.backgroundColor = Colors.white,
    this.isSliver = false,
    this.expandedHeight = 200.0,
    this.background,
    this.topPadding = 0,
    this.toolbarHeight = 75,
  });

  @override
  Widget build(BuildContext context) {
    return isSliver ? _buildSliverAppBar(context) : _buildNormalAppBar(context);
  }

  AppBar _buildNormalAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      toolbarHeight: toolbarHeight,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.black12,
          height: 1,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      leading: leading ?? (showBackButton ? _defaultBackButton(context) : null),
      actions: [
        if (trailing != null)
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: trailing!,
          ),
        const SizedBox(width: 12),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      backgroundColor: backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(bottom: topPadding),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        background: background ?? Container(color: Colors.blue),
      ),
      leading: leading ?? (showBackButton ? _defaultBackButton(context) : null),
      actions: [if (trailing != null) trailing!],
    );
  }

  Widget _defaultBackButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
