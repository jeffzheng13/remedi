class ActionItem {
  final String title;
  final int frequency;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  ActionItem(
      {required this.title,
      required this.frequency,
      required this.dateStart,
      required this.dateEnd});
}
