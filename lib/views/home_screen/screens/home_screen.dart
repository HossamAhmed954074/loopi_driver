import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/colors_constants.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/views/profile_screen/widgets/divider_custom_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarCustomWidget(),
            SizedBox(height: 20),
            SubComponentCustomWidget(),
            SizedBox(height: 10),



            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) =>   TripCard(
                startTime: '07:30 AM',
                endTime: '09:00 AM',
                startLocation: 'العاشر من رمضان',
                endLocation: 'العبور الجامعة',
                price: '50 EGP' ,
                seats: 1,
              ),),
            ),
           
          ],
        ),
      ),
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
  const AppBarCustomWidget({super.key});

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
            leading: Image.asset('assets/images/icon.png'),
            title: Text(
              '${BlocProvider.of<PhoneAuthCubit>(context).getLoggedInUser().phoneNumber}',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            subtitle: Text(
              'Driver Client',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.notification_add_outlined,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Text(
              'From : العاشر من رمضان',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            title: Text(
              ' | ',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: Text(
              'To : العبور الجامعة',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String startLocation;
  final String endLocation;
  final String price;
  final int seats;

  const TripCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.startLocation,
    required this.endLocation,
    required this.price,
    required this.seats,
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
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimeText(startTime),
                const SizedBox(height: 12),
                _buildTimeText(endTime),
              ],
            ),
          ),
          Container(width: 2, height: 50, color: Colors.blueAccent),
          const SizedBox(width: 15),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLocationText(startLocation),
                const Text('Bus Station', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                _buildLocationText(endLocation),
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
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Text('$seats', style: const TextStyle(fontSize: 12)),
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
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildLocationText(String location) {
    return Text(
      location,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}
