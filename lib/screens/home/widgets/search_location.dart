import 'package:flutter/material.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key, required this.onPressed}) : super(key: key);
  final Future<void> Function(String) onPressed;
  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search a location',
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: IconButton(
                splashRadius: 20.0,
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.search),
                iconSize: 25,
                onPressed: () => widget.onPressed,
              )),
          onSubmitted: widget.onPressed,
        ),
      ),
    );
  }
}
