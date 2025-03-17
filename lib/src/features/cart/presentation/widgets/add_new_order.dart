import 'package:flutter/material.dart';

class AddNewOrder extends StatelessWidget {
  const AddNewOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () {
          // Handle add new address tap
        },
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(2),
          child: const Icon(
            Icons.add,
            size: 12,
            color: Colors.white,
          ),
        ),
        label: const Text(
          'اضافة عنوان جديد',
          style: TextStyle(
            color: Colors.green,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
