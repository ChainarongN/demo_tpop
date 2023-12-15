import 'package:flutter/material.dart';
import 'package:test_tpop/providers/provider.dart';

Wrap selectedWidget(HomeProvider homeWatch, HomeProvider homeRead) {
  return Wrap(
    children: List.generate(
      homeWatch.selected.length,
      (index) => Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10, left: 10),
        width: 65,
        height: 30,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              homeWatch.selected[index]['seatNumber'],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                homeRead.removeSelected(index);
              },
              child: Container(
                alignment: Alignment.center,
                width: 20,
                child: const Text(
                  'x',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
