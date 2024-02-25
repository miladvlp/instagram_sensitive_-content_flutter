import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool view = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // image
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image1.jpg"), fit: BoxFit.cover),
            ),
          ),
          // blur
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: view ? 0 : 40.0, sigmaY: view ? 0 : 40.0),
            child: Visibility(
              visible: view,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(view ? 0 : 0.1),
                ),
              ),
            ),
          ),
          // text and textbutton
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Visibility(
                visible: !view,
                child: const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: !view,
                child: const Text(
                  "Sensitive Content",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: !view,
                child: const Text(
                  "This photo contains sensitive content which \n some peopel may find offensive or disturbing",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Visibility(
                visible: !view,
                child: const Divider(
                  color: Colors.white,
                  endIndent: 20,
                  indent: 20,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          view = !view;
                        });
                      },
                      child: const Text(
                        "See Photo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
