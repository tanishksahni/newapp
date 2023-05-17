import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverMultilineAppBar(
              title: "Summer Trip to Tokyo and Kyoto",
              
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
              tabbar: const TabBar(
                labelColor: Colors.orange,
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                Tab(text: "data"),
                Tab(text: "data"),
                Tab(text: "data"),
              ]),
            ),
            
            //todo: error encountered
            // SliverToBoxAdapter(
            //   child: TabBarView(children: [
            //     SliverList(
            //         delegate: SliverChildBuilderDelegate((context, index) {
            //       return ListTile(
            //         title: Text("Item ${1 + index}"),
            //       );
            //     }, childCount: 20)),
            //   ]),
            // )
          ],
        ),
      ),
    );
  }
}

class SliverMultilineAppBar extends StatelessWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  final TabBar tabbar;

  const SliverMultilineAppBar(
      {super.key,
      required this.title,
      required this.leading,
      required this.actions,
      required this.tabbar});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double availableWidth = size.width;
    if (actions != null) {
      availableWidth -= 32 * actions.length;
    }
    if (leading != null) {
      availableWidth -= 32;
    }
    return SliverAppBar(
      // pinned: true,
      floating: true,
      backgroundColor: Colors.transparent,
      expandedHeight: 150.0,
      forceElevated: true,
      leading: leading,
      actions: actions,
      bottom: tabbar,
      flexibleSpace: FlexibleSpaceBar(
        title: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: availableWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              title,
              textScaleFactor: .8,
            ),
          ),
        ),
      ),
    );
  }
}
