import 'package:flutter/material.dart';
import 'package:flutter_template/pages/tabview.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final List data = [
    {
      'title': '操作反馈',
      'children': [
        {'title': 'ActionSheet', 'url': 'ui_appbar'},
        {'title': 'Dialog', 'url': 'ui_appbar'},
        {'title': 'Half-screen Dialog', 'url': 'ui_appbar'},
        {'title': 'Toast', 'url': 'ui_toast'},
        {'title': 'Picker', 'url': 'ui_picker'},
      ]
    },
    {
      'title': '基础',
      'children': [
        {'title': 'App bar1', 'url': 'ui_appbar'},
        {'title': 'App bar1', 'url': 'ui_appbar'}
      ]
    },
    {
      'title': '表单',
      'children': [
        {'title': 'App bar3', 'url': 'ui_appbar'}
      ]
    },
  ];

  _renderItem(item) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, item['url']);
        },
        child: Text(item['title']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabView(pageTitle: '官方组件', data: data, renderItem: _renderItem));
  }
}
