import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/cubits/home_cubit/cubit/home_cubit.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getDate(
      auth:
          BlocProvider.of<PhoneAuthCubit>(
            context,
          ).getLoggedInUser().phoneNumber!,
    );
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Personal info'),
            leading: const BackButton(),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.settings),
              ),
            ],
            backgroundColor: Colors.blue.shade800,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _TopCard(
                  screenWidth: screenWidth,
                  imageUrl:
                      state is HomeSuccess ? state.driverModel.driverImage : '',
                  driverName:
                      state is HomeSuccess ? state.driverModel.driverName : '',
                ),
                const SizedBox(height: 20),
                _InfoTile(
                  title: "Name",
                  value:
                      state is HomeSuccess ? state.driverModel.driverName : '',
                ),
                _InfoTile(
                  title: "Phone Number",
                  value:
                      state is HomeSuccess ? state.driverModel.phoneNumber : '',
                ),
                _InfoTile(
                  title: "License Number",
                  value:
                      state is HomeSuccess
                          ? state.driverModel.licenseNumber
                          : '',
                ),
                _InfoTile(
                  title: "Address",
                  value: state is HomeSuccess ? state.driverModel.address : '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TopCard extends StatelessWidget {
  final double screenWidth;
  final String imageUrl;
  final String driverName;
  const _TopCard({
    required this.screenWidth,
    required this.imageUrl,
    required this.driverName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
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
          const SizedBox(height: 10),
          Text(
            driverName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _IconLabel(icon: Icons.account_balance_wallet, label: "Wallet"),
                _IconLabel(icon: Icons.star, label: "Points"),
                _IconLabel(icon: Icons.qr_code, label: "Voucher"),
                _IconLabel(icon: Icons.payment, label: "PayLater"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue.shade700),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const _InfoTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      subtitle: Text(value),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
