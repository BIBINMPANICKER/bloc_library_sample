import 'package:badges/badges.dart';
import 'package:bloc_library_sample/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartIcon extends StatefulWidget {
  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  CartBloc _cartBloc;

  @override
  void didChangeDependencies() {
    _cartBloc = BlocProvider.of<CartBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _cartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Badge(
            padding: EdgeInsets.all(3),
            badgeContent: BlocBuilder<CartBloc, int>(
                bloc: _cartBloc,
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  );
                }),
            position: BadgePosition.topRight(right: 6, top: 2),
            child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.shopping_cart,
                  size: 32,
                  color: Colors.black45,
                ),
                onPressed: null)));
  }
}
