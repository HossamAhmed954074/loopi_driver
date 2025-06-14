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
      body: AllUserTiketsbody(),
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
    BlocProvider.of<AllUsersTicketsCubit>(
      context,
    ).getAllUsersTickets(auth: 'driver2@gmail.com');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersTicketsCubit, AllUsersTicketsState>(
      builder: (context, state) {
        if (state is AllUsersTicketsLoading) {
          return c();
        }
        if (state is AllUsersTicketsFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }
        if (state is AllUsersTicketsSuccess) {
          userTickets = state.userTickets;
        }
        return ListView.builder(
          itemCount: userTickets.length,
          itemBuilder: (context, index) {
            return TicketInfoCard(userTicketModel: userTickets[index]);
          },
        );
      },
    );
  }

  c() {
    return Center(child: CircularProgressIndicator());
  }
}

class TicketInfoCard extends StatefulWidget {
  const TicketInfoCard({super.key, required this.userTicketModel});

  final UserTicketModel userTicketModel;

  @override
  State<TicketInfoCard> createState() => _TicketInfoCardState();
}

class _TicketInfoCardState extends State<TicketInfoCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap if needed
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Ticket Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Name: ${widget.userTicketModel.userName}'),
                  Text('From Station: ${widget.userTicketModel.fromStation}'),
                  Text('To Station: ${widget.userTicketModel.toStation}'),
                  Text(
                    'Price: ${widget.userTicketModel.price.toStringAsFixed(2)} جنيه',
                  ),
                  Text(
                    'Is Pack Up: ${widget.userTicketModel.isPackUp ? "Yes" : "No"}',
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<AllUsersTicketsCubit>(
                      context,
                    ).updateUserTicketIsPackup(
                      auth: FirebaseAuth.instance.currentUser!.email!,
                      ticketId: widget.userTicketModel.driverTicketId,
                      userId: widget.userTicketModel.userName,
                      userTickedId: widget.userTicketModel.ticketId,
                    );

                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text('pack up'),
                ),
                if (widget.userTicketModel.isPackUp)
                TextButton(
                  onPressed: () {
                      BlocProvider.of<AllUsersTicketsCubit>(
                      context,
                    ).updateUserTicketIsDelivered(
                      auth: FirebaseAuth.instance.currentUser!.email!,
                      ticketId: widget.userTicketModel.driverTicketId,
                      userId: widget.userTicketModel.userName,
                      userTickedId: widget.userTicketModel.ticketId,
                    );
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text('Arrived'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color:
              widget.userTicketModel.isPackUp
                  ? Colors.green.shade100
                  : Colors.red.shade100,
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
                    Text(widget.userTicketModel.userName),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'من : ',
                      style: TextStyle(color: Colors.black.withAlpha(150)),
                    ),
                    Text(widget.userTicketModel.fromStation),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'الي : ',
                      style: TextStyle(color: Colors.black.withAlpha(150)),
                    ),
                    Text(widget.userTicketModel.toStation),
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
                Text('${widget.userTicketModel.price.toStringAsFixed(2)} جنيه'),
                SizedBox(height: 8),
                if (widget.userTicketModel.isDelivered)
                  Text(
                    'تم الوصل',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else
                  Text(
                    'لم يتم الوصل',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
