class DriverModel {
  final String driverName;
  final String phoneNumber;
  final String licenseNumber;
  final String driverImage;
  final int seats;
  final String fromWhere;
  final String toWhere;
  final String address;

  DriverModel({
    required this.driverName,
    required this.phoneNumber,
    required this.licenseNumber,
    required this.driverImage,
    required this.fromWhere,
    required this.toWhere,
    required this.address, 
    required this.seats,
  });

  factory DriverModel.fromJson(json) {
    return DriverModel(
      
      driverName: json['name'] ?? 'unKnown',
      phoneNumber: json['phone_number'] ?? '00000',
      licenseNumber: json['id'] ?? '00000',
      driverImage: 'https://drive.google.com/uc?export=view&id=${json['driver_image'] ?? ''}' ,
      fromWhere: json['from_city']?? '',
      toWhere: json['to_city'] ?? '',
       address: json['address'] ?? '',
       seats: json['seats'] ?? 0,
    );
  }
}
