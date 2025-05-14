import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/colors_constants.dart';
import 'package:loopi_driver/cubits/home_cubit/cubit/home_cubit.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/models/driver_model.dart';
import 'package:loopi_driver/models/ticket_model.dart';
import 'package:loopi_driver/views/profile_screen/widgets/divider_custom_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getDate(
      auth:
          BlocProvider.of<PhoneAuthCubit>(
            context,
          ).getLoggedInUser().phoneNumber!,
    );

    List<TicketModel> ticketList =[];
     BlocProvider.of<HomeCubit>(context).getTicketsDate(
      auth:
          BlocProvider.of<PhoneAuthCubit>(
            context,
          ).getLoggedInUser().phoneNumber!,
    );
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
           if(state is TicketSuccess){
            ticketList = state.ticketModel;
           }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarCustomWidget(
                  driverModell:
                      state is HomeSuccess
                          ? state.driverModel
                          : DriverModel(
                            driverName: '',
                            phoneNumber: '',
                            licenseNumber: '',
                            driverImage: '',
                            fromWhere: '',
                            toWhere: '', address: '',
                          ),
                ),
                SizedBox(height: 20),
                SubComponentCustomWidget(),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: ticketList.length,
                    itemBuilder:
                        (context, index) => TripCard(
                         ticketModel: ticketList[index],
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SubComponentCustomWidget extends StatelessWidget {
  const SubComponentCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '! صباح الخير ',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('... هذه هي رحلاتك القادمة'),
          SizedBox(height: 15),
          DividerCustomWidget(),
        ],
      ),
    );
  }
}

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
              '${BlocProvider.of<PhoneAuthCubit>(context).getLoggedInUser().phoneNumber}',
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

class TripCard extends StatelessWidget {

final TicketModel ticketModel;
  const TripCard({
    super.key, required this.ticketModel,
 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// Time Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTimeText(ticketModel.fromTime),
              const SizedBox(height: 12),
              _buildTimeText(ticketModel.toTime),
            ],
          ),
          const SizedBox(width: 10),
          Container(width: 2, height: 50, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLocationText(ticketModel.fromWhere),
                const Text('Bus Station', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                _buildLocationText(ticketModel.toWhere),
                const Text('Bus Station', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          /// Right Side: Action Button & Price
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Bottom Row: Details, Price, Seats
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                     '${ ticketModel.allPrice} EGP',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Text(ticketModel.personCount.toString(), style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 2),
                        const Icon(Icons.person, size: 16),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeText(String time) {
    return Text(
      time,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildLocationText(String location) {
    return Text(
      location,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}
