import 'package:flutter/material.dart';

const activeIconWidth = 80.0;
const activeIconHeight = 77.0;
const inactiveIconWidth = 55.0;
const inactiveIconHeight = 64.0;

class NavbarItem extends StatefulWidget {
  final String iconPath;
  final Function onTap;
  final bool isActive;

  // Returns a styled clickable navbar icon
  const NavbarItem({
    Key? key,
    required this.iconPath,
    required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  State<NavbarItem> createState() => NavbarItemState();
}

class NavbarItemState extends State<NavbarItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: widget.isActive ? activeIconWidth : inactiveIconWidth,
          height: widget.isActive ? activeIconHeight : inactiveIconHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isHovering ? Colors.lightBlue.shade100 : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Opacity(
            opacity: widget.isActive ? 1.0 : 0.8,
            child: Image.asset(
              widget.iconPath,
              height: widget.isActive ? activeIconHeight : inactiveIconHeight,
            ),
          ),
        ),
      ),
    );
  }
}