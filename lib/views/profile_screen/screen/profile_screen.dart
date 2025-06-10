import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/app_theme_cubit/cubit/app_theme_cubit.dart';
import 'package:loopi_driver/cubits/home_cubit/cubit/home_cubit.dart';
import 'package:loopi_driver/cubits/login_cubit/cubit/log_in_cubit.dart';
import 'package:loopi_driver/models/driver_model.dart';
import 'package:loopi_driver/views/get_started_screen/screens/get_started_screen.dart';
import 'package:loopi_driver/views/home_screen/screens/home_screen.dart';
import 'package:loopi_driver/views/profile_screen/widgets/divider_custom_widget.dart';
import 'package:loopi_driver/views/profile_screen/widgets/list_item_custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
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
                              toWhere: '',
                              address: '',
                              seats: 0,
                            ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(height: 10),
                  ListItemButton(
                    leadingIcon: FontAwesomeIcons.person,
                    title: 'المعلومات الشخصية',
                    trailing: Icon(Icons.arrow_forward_ios),
            
                    onTap: () {
                      Navigator.pushNamed(context, personalInfoPage);
                    },
                  ),
                  DividerCustomWidget(),
                  const SizedBox(height: 10),
                  ListItemButton(
                    leadingIcon: Icons.dark_mode_outlined,
                    title: 'الحالة المظلمة',
                    trailing: CupertinoSwitch(
                      value: BlocProvider.of<AppThemeCubit>(context).isTheme,
                      onChanged: (val) {
                        BlocProvider.of<AppThemeCubit>(
                          context,
                        ).changeTheme(val);
            
                        setState(() {});
                      },
                    ),
            
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  DividerCustomWidget(),
                  const SizedBox(height: 10),
                  ListItemButton(
                    leadingIcon: Icons.settings,
                    title: 'ألاعدادات',
                    trailing: Icon(Icons.arrow_forward_ios),
            
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  DividerCustomWidget(),
                  const SizedBox(height: 10),
                  ListItemButton(
                    leadingIcon: Icons.chat,
                    title: 'الدردشة',
                    trailing: Icon(Icons.arrow_forward_ios),
            
                    onTap: () {
                      Navigator.pushNamed(context, messageScreen);
                    },
                  ),
                  const SizedBox(height: 10),
                  DividerCustomWidget(),
                  const SizedBox(height: 10),
                  ListItemButton(
                    leadingIcon: FontAwesomeIcons.backward,
                    title: 'تسجيل الخروج',
                    trailing: Icon(Icons.arrow_back_ios_new),
            
                    onTap: () async {
                      await BlocProvider.of<LogInCubit>(context).logOut();
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetStartedScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
