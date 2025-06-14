class  UserTicketModel {
  final String ticketId;
  final String fromStation;
  final String toStation;
  final String userName;
  final double price;
  final String driverTicketId;
 
  final bool isPackUp;
  final bool isDelivered;

  UserTicketModel({
    required this.ticketId,
    required this.fromStation,
    required this.toStation,
    required this.userName,
    required this.price,
    required this.isPackUp,
    required this.driverTicketId,
    required this.isDelivered,
  });

  factory UserTicketModel.fromJson( json, String driverTicketId) {
    return UserTicketModel(
      ticketId: json['ticket_id'],
      fromStation: json['client_from_city'],
      toStation: json['client_to_city'],
      userName: json['client_id'],
      price: json['price'] , 
      isPackUp: json['isPackUp'] ?? false,
      isDelivered: json['isArrived'] ?? false,
      driverTicketId: driverTicketId,
    );
  }

 
}
