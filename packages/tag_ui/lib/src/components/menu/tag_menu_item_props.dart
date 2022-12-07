import 'package:tag_ui/src/components/icons/tag_icon.dart';
import 'package:tag_ui/src/components/shared/path.dart';

class TagMenuItemProps {
  final TagPath path;
  final bool isActive;
  final TagIcon? icon;
  final void Function(String route)? onTap;

  const TagMenuItemProps({
    required this.path,
    this.icon,
    this.onTap,
    this.isActive = false,
  });
}
