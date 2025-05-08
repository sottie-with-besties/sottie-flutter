abstract interface class DTO {
  /// 외부로부터 데이터를 받은 후 엔티티로 변환
  Object toEntity();
}
