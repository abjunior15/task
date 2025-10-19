import 'package:flutter/material.dart';

class KNavBarItemData {
  final IconData assetName;
  final String labelName;

  const KNavBarItemData({
    required this.assetName,
    required this.labelName,
  });
}

class KNavBarItem extends StatelessWidget {
  const KNavBarItem({
    super.key,
    required this.data,
  });
  final KNavBarItemData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          data.assetName,
        ),
      ],
    );
  }
}
