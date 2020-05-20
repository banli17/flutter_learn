import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  String pageTitle;
  List data;
  Function renderItem;

  TabView({this.data, this.renderItem, this.pageTitle});

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.data.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _createTabBar() {
    List tabs = <Widget>[];
    widget.data.forEach((element) {
      tabs.add(Tab(text: element['title']));
    });
    print(tabs);
    return TabBar(
      tabs: tabs,
      controller: _tabController, // 记得要带上tabController
    );
  }

  _renderItem() {}

  _createItemView(items) {
    List itemView = <Widget>[];
    items['children'].forEach((item) {
      itemView.add(widget.renderItem(item));
    });
    return itemView;
  }

  _createTabBarView() {
    List tabBarView = <Widget>[];
    widget.data.forEach((element) {
      tabBarView.add(ListView(
        children: _createItemView(element),
      ));
    });
    return tabBarView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        bottom: _createTabBar(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _createTabBarView(),
      ),
    );
  }
}
