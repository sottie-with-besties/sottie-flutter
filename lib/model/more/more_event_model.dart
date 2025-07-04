final class MoreEventModel {
  final String eventTitle;
  final String eventContents;
  final DateTime eventDateStart;
  final DateTime eventDateEnd;
  final String eventImageUrl;

  MoreEventModel({
    required this.eventTitle,
    required this.eventContents,
    required this.eventDateStart,
    required this.eventDateEnd,
    required this.eventImageUrl,
  });

  factory MoreEventModel.fromJson(Map<String, dynamic> json) {
    return MoreEventModel(
      eventTitle: json['eventTitle'],
      eventContents: json['eventContents'],
      eventDateStart: DateTime.parse(json['eventDateStart']),
      eventDateEnd: DateTime.parse(json['eventDateEnd']),
      eventImageUrl: json['eventImageUrl'],
    );
  }
}
