class RaingDetails {
  final double rate;
  final int count;

  RaingDetails({
    required this.rate,
    required this.count,
  });

  factory RaingDetails.fromJson(Map<String, dynamic> json) => RaingDetails(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
