import 'package:flutter/material.dart';
import 'package:test_tpop/providers/provider.dart';

Column seatAll(HomeProvider homeWatch, HomeProvider homeRead) {
  return Column(
    children: [
      Table(
        // border: TableBorder.all(),
        children: [
          TableRow(
            children: List.generate(
              homeWatch.seatList[0].seatLayout!.rows! + 1,
              (index) => index == 0
                  ? Container(
                      width: 60,
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )
                  : Container(
                      width: 60,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        (index).toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
            ),
          ),
        ],
      ),
      Table(
        // border: TableBorder.all(),
        children: List.generate(
          homeWatch.result.length,
          (indexColumn) {
            return TableRow(
              children: List.generate(homeWatch.result[indexColumn].length + 1,
                  (index) {
                return index == 0
                    ? Container(
                        margin: const EdgeInsets.all(8),
                        width: 75,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          String.fromCharCode(indexColumn + 65),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          homeRead.addSelected(index - 1, indexColumn);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          width: 75,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: homeWatch.result[indexColumn]
                                              [index - 1]['status'] ==
                                          'available'
                                      ? Colors.grey.shade400
                                      : Colors.orange.shade400,
                                  offset: const Offset(0, 2),
                                  blurRadius: 5,
                                ),
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                  colors: homeWatch.result[indexColumn]
                                              [index - 1]['status'] ==
                                          'available'
                                      ? [
                                          Colors.grey.shade200,
                                          Colors.grey.shade300,
                                          Colors.grey.shade500,
                                          Colors.grey.shade500,
                                        ]
                                      : [
                                          Colors.orange.shade200,
                                          Colors.orange.shade300,
                                          Colors.orange.shade500,
                                          Colors.orange.shade500,
                                        ],
                                  stops: const [0.1, 0.3, 0.9, 1.0])),
                          child: Text(
                            homeWatch.result[indexColumn][index - 1]
                                ['seatNumber'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
              }),
            );
          },
        ),
      ),
    ],
  );
}
