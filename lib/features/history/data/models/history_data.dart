class HistoryData {
  DateTime? date;
  Map<String, double>? entries;
  HistoryData({this.date, this.entries});
  factory HistoryData.fromJson(String date, Map<String, dynamic> json) {
    return HistoryData(
      date: DateTime.tryParse(date),
      entries: json.cast<String, double>(),
    );
  }
}
