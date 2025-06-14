class  UserTicketModel {
  final String ticketId;
  final String fromStation;
  final String toStation;
  final String userName;
  final double price;
 
  final bool isPackUp;

  UserTicketModel({
    required this.ticketId,
    required this.fromStation,
    required this.toStation,
    required this.userName,
    required this.price,
    required this.isPackUp
  });

  factory UserTicketModel.fromJson( json) {
    return UserTicketModel(
      ticketId: json['ticket_id'],
      fromStation: json['client_from_city'],
      toStation: json['client_to_city'],
      userName: json['client_name'],
      price: json['price'] , 
      isPackUp: json['isPackUp'] ?? false,
    );
  }

 
}
