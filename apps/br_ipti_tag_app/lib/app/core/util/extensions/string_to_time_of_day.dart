extension StringToTimeExtension on String {
  DateTime get parseDateTime {
    final hour = int.parse(split(":")[0]).toString().padLeft(2,'0');
    final minute = int.parse(split(":")[1]).toString().padLeft(2,'0');

    return DateTime.parse('2012-02-27 $hour:$minute:00');
  }
}
