
import 'package:flutter/material.dart';

import '../../../location/data/model/address_response.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.address,
  });

  final AddressData address;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${address.title}, ${address.mapDesc}',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}