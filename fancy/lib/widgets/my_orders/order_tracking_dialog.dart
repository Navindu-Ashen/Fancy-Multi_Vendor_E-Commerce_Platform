import 'package:fancy/model/order.dart';
import 'package:fancy/widgets/my_orders/tracking_step.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTrackingDialog extends StatelessWidget {
  final Order order;

  const OrderTrackingDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Track Order #${order.id}",
        style: GoogleFonts.marcellus(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TrackingStep(
            step: "Order Placed",
            completed: true,
            date: "March 15, 2025",
          ),
          TrackingStep(
            step: "Processing",
            completed: order.status != "Processing",
            date: order.status != "Processing" ? "March 16, 2025" : "",
          ),
          TrackingStep(
            step: "Shipped",
            completed: order.status == "Shipped",
            date: order.status == "Shipped" ? "March 17, 2025" : "",
          ),
          TrackingStep(step: "Out for Delivery", completed: false, date: ""),
          TrackingStep(step: "Delivered", completed: false, date: ""),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Close",
            style: GoogleFonts.marcellus(
              color: const Color.fromARGB(255, 165, 81, 139),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
