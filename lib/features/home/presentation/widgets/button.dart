import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_text_style.dart';
class TopSlidingLayer extends StatefulWidget {
  const TopSlidingLayer({super.key});

  @override
  State<TopSlidingLayer> createState() => _TopSlingLayerState();
}

class _TopSlingLayerState extends State<TopSlidingLayer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200));
    _offset = Tween<Offset>(end: Offset.zero, begin: Offset(0.0, 0.20))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
                child: Text(
                  'Hello',
                  style: AppTextStyles.font20w700(context),
                ),
                height: 100.sp),
            InkWell(
              onTap: () {
                print('tapped ${_controller.status}');
                switch (_controller.status) {
                  case AnimationStatus.completed:
                    _controller.reverse();
                    break;
                  case AnimationStatus.dismissed:
                    _controller.forward();
                    break;
                  default:
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'click me',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}