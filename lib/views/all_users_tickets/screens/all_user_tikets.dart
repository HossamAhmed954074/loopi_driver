import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/views/all_users_tickets/cubit/all_users_tickets_cubit.dart';
import 'package:loopi_driver/views/all_users_tickets/models/user_ticket_model.dart';

class AllUserTiketsScreen extends StatelessWidget {
  const AllUserTiketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, bootomNavigation);
          },
        ),
        title: Text('All User Tickets'),
        centerTitle: true,
        backgroundColor: Colors.blue,

      ),
      body: BlocProvider(
        create: (context) => AllUsersTicketsCubit(),
        child: AllUserTiketsbody(),
      ),
    );
  }
}

class AllUserTiketsbody extends StatefulWidget {
  AllUserTiketsbody({super.key});

  @override
  State<AllUserTiketsbody> createState() => _AllUserTiketsbodyState();
}

class _AllUserTiketsbodyState extends State<AllUserTiketsbody> {
  List<UserTicketModel> userTickets = [];

 @override
  void initState() {
    super.initState();
    // Fetch tickets when the widget is initialized
    BlocProvider.of<AllUsersTicketsCubit>(context).getAllUsersTickets(auth: 'driver2@gmail.com');
  }


  @override
  Widget build(BuildContext context) {
  
    return BlocConsumer<AllUsersTicketsCubit, AllUsersTicketsState>(
      listener: (context, state) {
        if (state is AllUsersTicketsSuccess) {
          userTickets = state.userTickets;
        }
        if (state is AllUsersTicketsFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
        }
        if (state is AllUsersTicketsLoading) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
       
        return ListView.builder(
          itemCount: userTickets.length,
          itemBuilder: (context, index) {
            return TicketInfoCard(userTicketModel: userTickets[index]);
          },
        );
      },
    );
  }
}

class TicketInfoCard extends StatelessWidget {
  const TicketInfoCard({super.key, required this.userTicketModel});

  final UserTicketModel userTicketModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: userTicketModel.isPackUp ? Colors.green.shade100 : Colors.red.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Text(
                    'اسم المستخدم : ',
                    style: TextStyle(color: Colors.black.withAlpha(150)),
                  ),
                  Text(userTicketModel.userName),
                ],
              ),
              Row(
                children: [
                   Text('من : ', style: TextStyle(color: Colors.black.withAlpha(150))),
                  Text(userTicketModel.fromStation),
                ],
              ),
              Row(
                children: [
                   Text('الي : ', style: TextStyle(color: Colors.black.withAlpha(150))),
                  Text(userTicketModel.toStation),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'سعر التذكرة : ',
                style: TextStyle(color: Colors.black.withAlpha(150)),
              ),
              Text('${userTicketModel.price.toStringAsFixed(2)} جنيه'),
            ],
          ),
        ],
      ),
    );
  }
}
