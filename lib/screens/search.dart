import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final List<String> data;
  const Search({Key? key, required this.data}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //declaring variables required
  final _formKey = GlobalKey<FormState>();

  List<String> searchResults = [];
  //the search algorithm
  void searchWord(String value) {
    setState(() {
      searchResults = List.from(widget.data
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 16),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  cursorColor: Colors.black,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    searchWord(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: searchResults
                    .map(
                      (e) => ListTile(
                        title: Text(e),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
