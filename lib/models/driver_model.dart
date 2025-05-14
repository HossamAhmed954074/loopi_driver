class DriverModel {
  final String driverName;
  final String phoneNumber;
  final String licenseNumber;
  final String driverImage;
  final String fromWhere;
  final String toWhere;

  DriverModel({
    required this.driverName,
    required this.phoneNumber,
    required this.licenseNumber,
    required this.driverImage,
    required this.fromWhere,
    required this.toWhere,
  });

  factory DriverModel.fromJson(json) {
    return DriverModel(
      driverName: json['driverName'],
      phoneNumber: json['phoneNumber'],
      licenseNumber: json['licenseNumber'],
      driverImage: 'https://drive.google.com/uc?export=view&id=${json['deiverImage']}',
      fromWhere: json['from'],
      toWhere: json['to'],
    );
  }
}
