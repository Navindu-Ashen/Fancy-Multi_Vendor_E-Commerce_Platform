import 'package:fancy/data/order.dart';
import 'package:fancy/model/order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<Order> _orders = OrderData.getOrders();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Orders",
          style: GoogleFonts.marcellus(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color.fromARGB(255, 165, 81, 139),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color.fromARGB(255, 165, 81, 139),
          labelStyle: GoogleFonts.marcellus(fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.marcellus(),
          tabs: const [
            Tab(text: "All"),
            Tab(text: "In Progress"),
            Tab(text: "Delivered"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersList(_orders),
          _buildOrdersList(
            _orders
                .where(
                  (order) =>
                      order.status == "Processing" || order.status == "Shipped",
                )
                .toList(),
          ),
          _buildOrdersList(
            _orders.where((order) => order.status == "Delivered").toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<Order> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              "No orders found",
              style: GoogleFonts.marcellus(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(order);
      },
    );
  }

  Widget _buildOrderCard(Order order) {
    Color statusColor;
    switch (order.status) {
      case "Processing":
        statusColor = Colors.deepPurpleAccent;
        break;
      case "Shipped":
        statusColor = Colors.purple;
        break;
      case "Delivered":
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order header with ID and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order #${order.id}",
                  style: GoogleFonts.marcellus(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    order.status,
                    style: GoogleFonts.marcellus(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Order date
            Text(
              "Placed on ${DateFormat('MMM dd, yyyy').format(order.date)}",
              style: GoogleFonts.marcellus(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),

            const Divider(height: 24),

            // First item preview (simplified)
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    order.items[0].imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported_outlined),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.items[0].name,
                        style: GoogleFonts.marcellus(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (order.items.length > 1)
                        Text(
                          "+ ${order.items.length - 1} more items",
                          style: GoogleFonts.marcellus(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      Text(
                        "Rs. ${order.total.toStringAsFixed(2)}",
                        style: GoogleFonts.marcellus(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 165, 81, 139),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Action buttons - track order or return
            if (order.status == "Processing" || order.status == "Shipped")
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Show tracking info
                    _showTrackingInfo(order);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 165, 81, 139),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Track Order",
                    style: GoogleFonts.marcellus(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            if (order.status == "Delivered")
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Show return dialog
                    _showReturnDialog(order);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 165, 81, 139),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    "Return Items",
                    style: GoogleFonts.marcellus(
                      color: const Color.fromARGB(255, 165, 81, 139),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showTrackingInfo(Order order) {
    // Simplified tracking dialog
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Track Order #${order.id}",
              style: GoogleFonts.marcellus(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTrackingStep("Order Placed", true, "March 15, 2025"),
                _buildTrackingStep(
                  "Processing",
                  order.status != "Processing",
                  order.status != "Processing" ? "March 16, 2025" : "",
                ),
                _buildTrackingStep(
                  "Shipped",
                  order.status == "Shipped",
                  order.status == "Shipped" ? "March 17, 2025" : "",
                ),
                _buildTrackingStep("Out for Delivery", false, ""),
                _buildTrackingStep("Delivered", false, ""),
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
          ),
    );
  }

  Widget _buildTrackingStep(String step, bool completed, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  completed
                      ? const Color.fromARGB(255, 165, 81, 139)
                      : Colors.grey.shade300,
            ),
            child:
                completed
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step,
                  style: GoogleFonts.marcellus(
                    fontWeight: completed ? FontWeight.bold : FontWeight.normal,
                    color: completed ? Colors.black : Colors.grey,
                  ),
                ),
                if (date.isNotEmpty)
                  Text(
                    date,
                    style: GoogleFonts.marcellus(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showReturnDialog(Order order) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Return Items",
              style: GoogleFonts.marcellus(fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Do you want to return items from order #${order.id}?",
              style: GoogleFonts.marcellus(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel", style: GoogleFonts.marcellus()),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Return request initiated. Check your email for more details.",
                        style: GoogleFonts.marcellus(),
                      ),
                      backgroundColor: const Color.fromARGB(255, 165, 81, 139),
                    ),
                  );
                },
                child: Text(
                  "Request Return",
                  style: GoogleFonts.marcellus(
                    color: const Color.fromARGB(255, 165, 81, 139),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
