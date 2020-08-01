import 'package:bloc_library_sample/cart/cart_bloc.dart';
import 'package:bloc_library_sample/cart/cart_event.dart';
import 'package:bloc_library_sample/home/home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/helpers.dart';

class ItemListView extends StatefulWidget {
  final List<CategoryDish> categoryDishes;

  @override
  _ItemListViewState createState() => _ItemListViewState();

  ItemListView({this.categoryDishes});
}

class _ItemListViewState extends State<ItemListView>
    with AutomaticKeepAliveClientMixin {
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
    print('rebuild happened');
    return ListView.separated(
        padding: EdgeInsets.only(top: 10),
        separatorBuilder: (context, index) => Divider(
              color: Colors.black45,
            ),
        itemCount: widget.categoryDishes.length,
        itemBuilder: (context, index) =>
            listItem(widget.categoryDishes[index]));
  }

  Widget listItem(CategoryDish item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 6, left: 8),
          child: Image.asset(
            'assets/images/veg.png',
            scale: 100,
            // green color for veg and red for non veg dishes
            color: item.dishType == 1 ? Colors.red : Colors.green,
          ),
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 4, right: 6),
            title:
                Text(item.dishName, style: Theme.of(context).textTheme.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${item.dishCurrency} ${item.dishPrice}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text('${item.dishCalories} calories',
                          style: Theme.of(context).textTheme.subtitle2)
                    ],
                  ),
                ),
                SizedBox(
                    height: screenHeight(
                  context,
                  dividedBy: 62,
                )),
                Text(
                  item.dishDescription,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                    height: screenHeight(
                  context,
                  dividedBy: 62,
                )),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: new BorderRadius.circular(30)),
                    height: screenHeight(
                      context,
                      dividedBy: 18,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            _cartBloc.add(Decrement());
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                        IconButton(
                          onPressed: () {
                            _cartBloc.add(Increment());
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                          padding: EdgeInsets.all(0),
                        )
                      ],
                    )),
                SizedBox(
                    height: screenHeight(
                  context,
                  dividedBy: 92,
                )),
                item.addonCat.isNotEmpty
                    ? Text(
                        'Customizations Available',
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.red),
                      )
                    : SizedBox()
              ],
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: CachedNetworkImage(
                height: screenHeight(context, dividedBy: 3.8),
                width: screenWidth(context, dividedBy: 5.5),
                fit: BoxFit.fill,
                imageUrl: '${item.dishImage}',
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/no_image.jpg',
                  height: screenHeight(context, dividedBy: 3.8),
                  width: screenWidth(context, dividedBy: 5.5),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
