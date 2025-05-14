class DriverModel {
  final String driverName;
  final String phoneNumber;
  final String licenseNumber;
  final String driverImage;
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
  });

  factory DriverModel.fromJson(json) {
    return DriverModel(
      
      driverName: json['driverName'] ?? 'unKnown',
      phoneNumber: json['phoneNumber'] ?? '00000',
      licenseNumber: json['licenseNumber'] ?? '00000',
      driverImage: 'https://drive.google.com/uc?export=view&id=${json['driverImage'] ?? ''}' ,
      fromWhere: json['from']?? '',
      toWhere: json['to'] ?? '',
       address: json['address'] ?? '',
    );
  }
}
