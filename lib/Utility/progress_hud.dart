import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProgressHud extends StatefulWidget {
  // ignore: library_private_types_in_public_api
  _ProgressHudState? state;

  ProgressHud({super.key});

  @override
  // ignore: no_logic_in_create_state, library_private_types_in_public_api
  _ProgressHudState createState() {
    state = _ProgressHudState();
    return state!;
  }
}

class _ProgressHudState extends State<ProgressHud> {
  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

  void dismiss() {
    setState(() {
      this.visible = false;
    });
  }

  void show() {
    setState(() {
      this.visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (visible) {
      return Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children: [
            Center(
              child: Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1),
                  ],
                ),
              ),
            ),
            const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Color.fromRGBO(10, 66, 117, 1)),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
