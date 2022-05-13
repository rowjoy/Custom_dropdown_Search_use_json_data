// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';

class DropdownSearch extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Random _random = Random();
  DropdownSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              // labelText: "Select your item",
                              hintText: "Search this item",
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.5),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 300,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 30,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: InkWell(
                                        onTap: () {
                                          _controller.text =
                                              "Item   ${_random.nextInt(30)}";
                                          Navigator.pop(context);
                                          print(_controller.text);
                                        },
                                        child: Text(
                                            "Item   ${_random.nextInt(30)}")),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: IgnorePointer(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  // labelText: "Select your item",
                  hintText: "Select your item",
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.5),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
