import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/home_cubit/cubit/home_cubit.dart';
import 'package:loopi_driver/cubits/login_cubit/cubit/log_in_cubit.dart';

import '../widgets/app_bar_custom_widget.dart';
import '../widgets/sub_header_text.dart';
import '../widgets/ticket_info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getDate(
      auth: BlocProvider.of<LogInCubit>(context).getLoggedInUser().email!,
    );
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state is HomeLoading)
                Center(child: CircularProgressIndicator()),
              if (state is HomeSuccess)
                AppBarCustomWidget(driverModell: state.driverModel),
              SizedBox(height: 20),
              SubComponentCustomWidget(),
              SizedBox(height: 10),
              TicketInfoCard(
                onTap: () {
                  Navigator.pushReplacementNamed(context, allUserInfoTickets);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
