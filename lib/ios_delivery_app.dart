import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GroupOrderDemoScreen(),
  ));
}


class GroupOrderDemoScreen extends StatefulWidget {
  const GroupOrderDemoScreen({super.key});

  @override
  State<GroupOrderDemoScreen> createState() => _GroupOrderDemoScreenState();
}

class _GroupOrderDemoScreenState extends State<GroupOrderDemoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // ---------- DEMO STATIC DATA ----------
  final groupName = "Friday Team Lunch";
  final groupCode = "ABC123";
  final restaurantName = "Pizza House";
  final status = "OPEN";
  final isLocked = false;
  final participantCount = 3;
  final maxParticipants = 5;
  final totalAmount = 72.40;

  final List<Map<String, dynamic>> demoItems = [
    {
      "quantity": 2,
      "menuItemName": "Chicken Pizza",
      "addedByName": "John",
      "addedById": 1,
      "specialInstructions": "Extra cheese",
      "totalPrice": 22.50
    },
    {
      "quantity": 1,
      "menuItemName": "Beef Burger",
      "addedByName": "Alex",
      "addedById": 2,
      "specialInstructions": null,
      "totalPrice": 12.90
    },
    {
      "quantity": 3,
      "menuItemName": "Chocolate Shake",
      "addedByName": "You",
      "addedById": 99,
      "specialInstructions": "Less sugar",
      "totalPrice": 14.40
    },
  ];

  final List<Map<String, dynamic>> demoParticipants = [
    {
      "userId": 99,
      "userName": "You",
      "subtotal": 14.40,
      "delivery": 2.00,
      "tax": 1.40,
      "total": 17.80,
      "paymentStatus": "PENDING",
      "confirmed": false,
    },
    {
      "userId": 1,
      "userName": "John",
      "subtotal": 22.50,
      "delivery": 2.00,
      "tax": 1.40,
      "total": 25.90,
      "paymentStatus": "COMPLETED",
      "confirmed": true,
    },
    {
      "userId": 2,
      "userName": "Alex",
      "subtotal": 12.90,
      "delivery": 2.00,
      "tax": 1.40,
      "total": 16.30,
      "paymentStatus": "PENDING",
      "confirmed": false,
    },
  ];

  final List<Map<String, dynamic>> demoChat = [
    {"senderId": 1, "senderName": "John", "message": "Hey everyone!"},
    {"senderId": 99, "senderName": "You", "message": "Hi!"},
    {"senderId": 2, "senderName": "Alex", "message": "Add my burger pls"},
    {"messageType": "SYSTEM", "message": "John added Chicken Pizza"},
    {"senderId": 99, "senderName": "You", "message": "Done!"},
  ];

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _chatScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(groupName),
            Text(
              groupCode,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.restaurant_menu), text: "Items"),
            Tab(icon: Icon(Icons.account_balance_wallet), text: "Bill Split"),
            Tab(icon: Icon(Icons.chat), text: "Chat"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _itemsTab(),
          _billSplitTab(),
          _chatTab(),
        ],
      ),
    );
  }

  // ---------------------------------------------------
  // ITEMS TAB
  // ---------------------------------------------------
  Widget _itemsTab() {
    return Column(
      children: [
        _summaryCard(),
        Expanded(
          child: ListView.builder(
            itemCount: demoItems.length,
            itemBuilder: (context, index) {
              final item = demoItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(child: Text("${item['quantity']}x")),
                  title: Text(item["menuItemName"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Added by ${item["addedByName"]}"),
                      if (item["specialInstructions"] != null)
                        Text(
                          item["specialInstructions"],
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                    ],
                  ),
                  trailing: Text(
                    "\$${item['totalPrice'].toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _summaryCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryRow("Restaurant:", restaurantName),
            const Divider(),
            _summaryRow("Participants:", "$participantCount/$maxParticipants"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Status:"),
                Chip(
                  label: Text(status),
                  backgroundColor: isLocked ? Colors.orange : Colors.green,
                ),
              ],
            ),
            const Divider(),
            _summaryRow(
              "Total Amount:",
              "\$${totalAmount.toStringAsFixed(2)}",
              bold: true,
              bigger: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool bold = false, bool bigger = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: TextStyle(
            fontSize: bigger ? 20 : 14,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------
  // BILL SPLIT TAB
  // ---------------------------------------------------
  Widget _billSplitTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                Text("Order Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _BillSummaryRow("Subtotal", 49.80),
                _BillSummaryRow("Delivery Fee", 6.00),
                _BillSummaryRow("Tax", 6.60),
                Divider(),
                _BillSummaryRow("Total", 62.40, bold: true),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text("Individual Shares",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...demoParticipants.map((p) => _participantCard(p)),
      ],
    );
  }

  Widget _participantCard(Map<String, dynamic> p) {
    final bool isYou = p["userId"] == 99;

    return Card(
      color: isYou ? Colors.blue.shade50 : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  p["userName"] + (isYou ? " (You)" : ""),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${p['total'].toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    if (p["confirmed"])
                      const Icon(Icons.check_circle, color: Colors.green, size: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Items: \$${p['subtotal'].toStringAsFixed(2)}"),
            Text("Delivery: \$${p['delivery'].toStringAsFixed(2)}"),
            Text("Tax: \$${p['tax'].toStringAsFixed(2)}"),
            const SizedBox(height: 4),
            Chip(
              label: Text(p["paymentStatus"]),
              backgroundColor: p["paymentStatus"] == "COMPLETED"
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------
  // CHAT TAB
  // ---------------------------------------------------
  Widget _chatTab() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _chatScroll,
            itemCount: demoChat.length,
            itemBuilder: (context, index) {
              final msg = demoChat[index];
              final bool isSystem = msg["messageType"] == "SYSTEM";
              final bool isMe = msg["senderId"] == 99;

              if (isSystem) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      msg["message"],
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              }

              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    msg["message"],
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const CircleAvatar(child: Icon(Icons.send)),
            ],
          ),
        )
      ],
    );
  }
}

// Helper for Bill Row
class _BillSummaryRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool bold;

  const _BillSummaryRow(this.label, this.amount, {this.bold = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
          ),
        ],
      ),
    );
  }
}
