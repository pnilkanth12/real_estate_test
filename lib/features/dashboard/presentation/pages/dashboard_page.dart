import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/features/home/presentation/pages/home_page.dart';
import 'package:real_estate_demo/features/map/presentation/pages/map_page.dart';
import 'package:real_estate_demo/features/sample/presentation/pages/sample_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {

  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [Colors.yellow, Colors.red, Colors.green, Colors.blue, Colors.pink];

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
          () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    currentPage = 2;
    tabController.index=2;
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5 ? Colors.black : Colors.white;
    return Scaffold(
      body: BottomBar(
        borderRadius: BorderRadius.circular(100.sp),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: false,
        width: MediaQuery.of(context).size.width * 0.65,
        //TODO: Change Background color
        barColor: colors[currentPage].computeLuminance() > 0.5 ? Colors.black.withOpacity(0.5) : Colors.black,
        start: 2.sp,
        end: 0.sp,
        offset: 40.sp,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 40.sp,
        iconWidth: 40.sp,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            MapPage(),
            SamplePage(icon: Icons.message,),
            HomePage(),
            SamplePage(icon: Icons.favorite,),
            SamplePage(icon: Icons.insert_emoticon_sharp,),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(right: 8.0,left: 0),
          child: TabBar(

            physics: const ClampingScrollPhysics(),
            indicatorPadding: EdgeInsets.only(bottom: 2.sp),
            controller: tabController,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            //indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              _icon(Icons.search, Icons.search_rounded, 0, unselectedColor),
              _icon(Icons.message,Icons.chat_rounded, 1, unselectedColor),
              _icon(Icons.home_filled,Icons.home_filled, 2, unselectedColor),
              _icon(Icons.favorite,Icons.favorite, 3, unselectedColor),
              _icon(Icons.insert_emoticon_sharp,Icons.insert_emoticon_sharp, 4, unselectedColor,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(
      IconData selectedIcon, IconData icon, int index, Color unselectedColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: Icon(icon,color: currentPage==index?AppColors.primaryColor:Colors.white,),
    );
  }
}
