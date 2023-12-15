import 'package:flutter/material.dart';
import 'package:test_tpop/providers/provider.dart';

Container selectLimit(HomeProvider homeWatch, HomeProvider homeRead) {
  return Container(
    margin: const EdgeInsets.only(bottom: 35),
    child: DropdownMenu<String>(
      initialSelection: homeWatch.limit,
      onSelected: (String? value) {
        homeRead.setLimit(value!);
      },
      dropdownMenuEntries:
          ['2', '4', '6', '8'].map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    ),
  );
}
