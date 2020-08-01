import 'package:bloc_library_sample/cart/cart_bloc.dart';
import 'package:bloc_library_sample/cart/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';
import 'home_bloc.dart';
import 'home_state.dart';
import 'item_list_view.dart';

class HomeTabs extends StatefulWidget {
  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final _homeBloc = HomeBloc();
  CartBloc _cartBloc = CartBloc();

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc,
          builder: (BuildContext context, HomeState state) {
            if (state is HomeUninitialized) {
              print('print from tabbar HomeUninitialized');

              return Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return DefaultTabController(
                  length: state.restaurantModel.tableMenuList.length,
                  child: Scaffold(
                      appBar: AppBar(
                          title: Text(
                            state.restaurantModel.restaurantName,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          leading: BackButton(
                            color: Colors.black45,
                          ),
                          actions: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('My Orders',
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                                BlocProvider.value(
                                    value: _cartBloc, child: CartIcon())
                              ],
                            )
                          ],
                          bottom: TabBar(
                            tabs: tabList(state.restaurantModel.tableMenuList),
                            isScrollable: true,
                          )),
                      body: TabBarView(
                          children: state.restaurantModel.tableMenuList
                              .map((tableMenuItem) => BlocProvider.value(
                                    value: _cartBloc,
                                    child: ItemListView(
                                        categoryDishes:
                                            tableMenuItem.categoryDishes),
                                  ))
                              .toList())));
            } else
              return Container();
          }),
    );
  }

  // creating list for tab bar
  List<Tab> tabList(List<TableMenuList> tableMenuList) {
    List<Tab> _tabList = [];
    tableMenuList.forEach((f) {
      _tabList.add(Tab(
        text: '${f.menuCategory}',
      ));
    });
    return _tabList;
  }
}
