
import 'package:flutter/material.dart';

import '../../../models/ticket_model.dart';

class TripCard extends StatelessWidget {
  final TicketModel ticketModel;
  const TripCard({super.key, required this.ticketModel});

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
                      '${ticketModel.allPrice} EGP',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Text(
                          ticketModel.personCount.toString(),
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
