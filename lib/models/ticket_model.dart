import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory TicketModel.fromJson(json) {
    return TicketModel(
      fromWhere: json['client_from_city'],
      toWhere: json['client_to_city'],
      fromTime: json['fromTime'],
      toTime: json['toTime'],
      personCount: json['personCount'],
      allPrice:
          double.parse(json['personPrice']) * double.parse(json['personCount']),
    );
  }
}

class TicketsInfo {
  final int ticketsCount;
  final String fromWere;
  final String toWere;
  final double allPrice;


  TicketsInfo({
    required this.ticketsCount,
    required this.fromWere,
    required this.toWere,
    required this.allPrice,
  });
  factory TicketsInfo.fromJson(json, int count, double allPrice) {
    return TicketsInfo(
      ticketsCount: count,
      fromWere: json['client_from_city'],
      toWere: json['client_to_city'],
      allPrice: allPrice,
    );
  }
}
