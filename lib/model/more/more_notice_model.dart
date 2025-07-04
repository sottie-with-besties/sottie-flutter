final class MoreNoticeModel {
  final String noticeTitle;
  final String noticeContents;
  final DateTime noticeDate;

  MoreNoticeModel({
    required this.noticeTitle,
    required this.noticeContents,
    required this.noticeDate,
  });

  factory MoreNoticeModel.fromJson(Map<String, dynamic> json) {
    return MoreNoticeModel(
      noticeTitle: json['noticeTitle'],
      noticeContents: json['noticeContents'],
      noticeDate: DateTime.parse(json['noticeDate']),
    );
  }
}
