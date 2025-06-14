import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/home_cubit/cubit/home_cubit.dart';
import '../../../cubits/login_cubit/cubit/log_in_cubit.dart';
import '../../../models/ticket_model.dart';

class TicketInfoCard extends StatefulWidget {
  final Function() onTap;
  const TicketInfoCard({super.key, required this.onTap});

  @override
  State<TicketInfoCard> createState() => _TicketInfoCardState();
}

class _TicketInfoCardState extends State<TicketInfoCard> {
  TicketsInfo ticketsInfo = TicketsInfo(ticketsCount: 0, fromWere: '', toWere: '', allPrice: 0);
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getTicketsInfo(
      auth: BlocProvider.of<LogInCubit>(context).getLoggedInUser().email!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onTap,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is TicketInfoSuccess) {
            ticketsInfo = state.ticketInfo;
          }
         
        },
        builder:(context, state) =>
            ticketsInfo.allPrice != 0
                ? Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
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
                              const Text(
                                'From Station : ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 8),
                              Text(
                                ticketsInfo.fromWere,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              const Text(
                                'To Station : ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 8),
                              Text(
                                ticketsInfo.toWere,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${ticketsInfo.allPrice} EGP',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                ticketsInfo.ticketsCount.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 2),
                              const Icon(Icons.person, size: 16),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                : SizedBox(),
      ),
    );
  }
}
