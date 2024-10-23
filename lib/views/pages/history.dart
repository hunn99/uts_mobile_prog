import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Transaction History')),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'Done'),
          ],
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(width: 4.0, color: Colors.red),
            insets: const EdgeInsets.symmetric(horizontal: 100.0),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTransactionList(pendingTransactions),
          _buildTransactionList(doneTransactions),
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<Transaction> transactions) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp${transaction.amount}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(transaction.date,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                Text(
                  transaction.status,
                  style: TextStyle(
                    color: transaction.status == 'Pending'
                        ? const Color.fromARGB(255, 198, 181, 25)
                        : Colors.green,
                  ),
                ),
                const SizedBox(height: 5),
                Text(transaction.description,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Transaction {
  final String title;
  final String amount;
  final String date;
  final String status;
  final String description;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.description,
  });
}

final pendingTransactions = [
  Transaction(
    title: 'Pay Merchant',
    amount: '45.400',
    date: '15 Sep 2024, 17:32 WIB',
    status: 'Pending',
    description: 'Indomaret_purchase',
  ),
  Transaction(
    title: 'Top Up from Bank',
    amount: '100.000',
    date: '15 Sep 2024, 17:26 WIB',
    status: 'Pending',
    description: 'Top Up from artajasa',
  ),
];

final doneTransactions = [
  Transaction(
    title: 'Pay Merchant',
    amount: '55.000',
    date: '15 Sep 2024, 17:28 WIB',
    status: 'Success',
    description: 'Indomaret_purchase',
  ),
  Transaction(
    title: 'Top Up from Bank',
    amount: '100.000',
    date: '15 Sep 2024, 17:26 WIB',
    status: 'Success',
    description: 'Top Up from artajasa',
  ),
  Transaction(
    title: 'Pay QRIS',
    amount: '21.000',
    date: '31 Aug 2024, 11:49 WIB',
    status: 'Success',
    description: 'SBY - MOG TP S1',
  ),
];
