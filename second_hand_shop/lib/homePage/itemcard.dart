import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.list,
  }) : super(key: key);

  final list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildProductItemCard(context),
        _buildProductItemCard(context),
      ],
    );
  }
}

_buildProductItemCard(BuildContext context) {
  return InkWell(
    onTap: () {
      // Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
    },
    child: const Card(
        //rest of the widget
        ),
  );
}
