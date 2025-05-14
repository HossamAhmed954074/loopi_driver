
class TicketModel {
  final String fromWhere;
  final String toWhere;
  final String fromTime;
  final String toTime;
  final String personCount;
  final double allPrice;

  TicketModel({
    required this.fromWhere,
    required this.toWhere,
    required this.fromTime,
    required this.toTime,
    required this.personCount,
    required this.allPrice,
  });


  factory TicketModel.fromJson(json){
    return TicketModel(
      fromWhere: json['fromWhere'], 
      toWhere: json['toWhere'], 
      fromTime: json['fromTime'], 
      toTime: json['toTime'], 
      personCount: json['personCount'], 
      allPrice: double.parse(json['personPrice']) * double.parse(json['personCount']),
      );
  }
}
