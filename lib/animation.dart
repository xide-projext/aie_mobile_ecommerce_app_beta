import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';



class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}
class _HomeHeaderState extends State<HomeHeader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int duration = 250;
  bool isControllerDisposed = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initializeAnimation();
  }

  void initializeAnimation() {
    isControllerDisposed = false;
    _controller = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );

    _animation = Tween<double>(begin: -0.2, end: 0.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration.zero, () {
          if (mounted) {
            _controller.reverse();
          }
        });
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(Duration(milliseconds: 500), () {
          if (mounted) {
            _controller.forward();
          }

        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    isControllerDisposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBtnWithCounter(
                svgSrc: "assets/icons/Bell.svg",
                numOfitem: 3,
                press: () {},
                animation: _animation,
              ),
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Enter animation duration in milliseconds'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a number';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                duration = int.parse(value!);
                initializeAnimation();
              });
              _controller.dispose();
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

// class _HomeHeaderState extends State<HomeHeader> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 250),
//       vsync: this,
//     );
//
//     _animation = Tween<double>(begin: -0.2, end: 0.2).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.bounceIn,
//       ),
//     );
//
//     // Add this listener to the animation controller
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         // When the animation completes, wait for some time before restarting
//         Future.delayed(Duration(milliseconds: 0), () {
//           if (mounted) { // Check if the widget is still in the widget tree
//             _controller.reverse();
//           }
//         });
//       } else if (status == AnimationStatus.dismissed) {
//         // When the reverse animation completes, wait for some time before restarting
//         Future.delayed(Duration(milliseconds: 500), () {
//           if (mounted) { // Check if the widget is still in the widget tree
//             _controller.forward();
//           }
//         });
//       }
//     });
//
//     // Start the animation
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconBtnWithCounter(
//             svgSrc: "assets/icons/Bell.svg",
//             numOfitem: 3,
//             press: () {},
//             animation: _animation,
//           ),
//         ],
//       ),
//     );
//   }
// }
class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
    required this.animation,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: animation.value,
                  child: SvgPicture.asset(svgSrc),
                );
              },
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: 10,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}