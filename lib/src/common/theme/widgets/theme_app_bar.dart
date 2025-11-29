import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/utils/extensions.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';

class ThemeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ThemeAppBar({
    super.key,
    this.centerTitle = false,
    this.title,
    this.automaticallyImplyLeading = true,
    this.titleSpacing,
    this.toolbarHeight,
    this.flexibleSpace,
    this.bottom,
    this.actions,
    this.forceShowLeading = false,
    this.leadingIcon,
    this.backgroundColor,
    this.leadingColor,
    this.leading,
    this.onLeadingPressed,
  });

  final Widget? title;
  final bool automaticallyImplyLeading;
  final double? titleSpacing;
  final double? toolbarHeight;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final bool forceShowLeading;
  final String? leadingIcon;
  final Color? backgroundColor;
  final Color? leadingColor;
  final Widget? leading;
  final bool centerTitle;
  final VoidCallback? onLeadingPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;
    final shouldShowLeading =
        forceShowLeading ||
        (canPop || (parentRoute?.impliesAppBarDismissal ?? false)) &&
            automaticallyImplyLeading;

    final actions = this.actions;

    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? theme.colors.surface,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: shouldShowLeading
          ? Padding(
              padding: theme.sizes.asInsets.m.leftOnly,
              child:
                  leading ??
                  ThemeButton.icon(
                    icon: leadingIcon ?? HeroiconsSolid.arrow_long_left,
                    backgroundColor: theme.colors.transparent,
                    color: leadingColor ?? theme.colors.primary100,
                    onPressed:
                        onLeadingPressed ??
                        () => Navigator.of(context).maybePop(),
                  ),
            )
          : null,
      title: title,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      flexibleSpace: flexibleSpace,
      actions: actions != null ? [...actions, const ThemeGap.m()] : null,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
