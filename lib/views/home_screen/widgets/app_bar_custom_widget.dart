
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/colors_constants.dart';
import '../../../cubits/login_cubit/cubit/log_in_cubit.dart';
import '../../../models/driver_model.dart';

class AppBarCustomWidget extends StatelessWidget {
  const AppBarCustomWidget({super.key, required this.driverModell});
  final DriverModel driverModell;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 120,
      decoration: BoxDecoration(
        color: MyColor.kAppBarColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: driverModell.driverImage,
                  imageBuilder:
                      (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            title: Text(
              '${BlocProvider.of<LogInCubit>(context).getLoggedInUser().email}',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            subtitle: Text(
              driverModell.driverName,
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.notification_add_outlined,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Text(
              'From : ${driverModell.fromWhere}',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            title: Text(
              ' | ',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: Text(
              'To : ${driverModell.toWhere} ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

