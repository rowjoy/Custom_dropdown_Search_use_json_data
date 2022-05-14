// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dropdown_search/model/country_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;

class TypeHeadSearchField extends StatefulWidget {
  const TypeHeadSearchField({Key? key}) : super(key: key);

  @override
  State<TypeHeadSearchField> createState() => _TypeHeadSearchFieldState();
}

final TextEditingController _controller = TextEditingController();

class _TypeHeadSearchFieldState extends State<TypeHeadSearchField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: TypeAheadFormField<CountryDataModel>(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: _controller,
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                      hintText: "Search your country",
                      fillColor: Colors.green,
                      suffixIcon: Icon(Icons.search, color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    )),
                suggestionsCallback: (filter) async {
                  var responce = await http.get(
                      Uri.parse("https://jsonplaceholder.typicode.com/posts"));
                  List data = jsonDecode(responce.body);
                  var value = data.where((element) => element
                      .toString()
                      .toLowerCase()
                      .contains(filter.toLowerCase()));
                  return value.map((e) {
                    return CountryDataModel.fromJson(e);
                  });
                },
                itemBuilder: (context, valuedata) {
                  return ListTile(
                    title: Text("${valuedata.title}"),
                  );
                },
                onSuggestionSelected: (value) {
                  _controller.text = value.title.toString();
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () async {
                  var responce = await http.get(
                      Uri.parse("https://jsonplaceholder.typicode.com/posts"));
                  List data = jsonDecode(responce.body);

                  print(data);
                },
                child: Text("Hello")),
          ],
        ),
      ),
    );
  }
}
