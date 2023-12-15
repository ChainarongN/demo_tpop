import 'package:flutter/material.dart';
import 'package:test_tpop/models/seat_model.dart';
import 'package:test_tpop/repositorys/repository.dart';

class HomeProvider extends ChangeNotifier {
  final IHomeRepository _homeRepository;
  HomeProvider(this._homeRepository);
  final List<SeatModel> _seatList = [];
  List _selected = [];
  String _limit = '2';
  List _result = [];

  List<SeatModel> get seatList => _seatList;
  List get result => _result;
  List get selected => _selected;
  String get limit => _limit;

  init() async {
    getSeat();
  }

  setLimit(String value) {
    for (var i = 0; i < _selected.length; i++) {
      int columnIndex = _selected[i]['indexColumn'];
      int rowIndex = _selected[i]['indexRow'];
      _result[columnIndex][rowIndex]['status'] = 'available';
    }
    _limit = value;
    _selected = [];
    notifyListeners();
  }

  addSelected(int indexRow, int indexColumn) {
    if (_result[indexColumn][indexRow]['status'] == 'available' &&
        _selected.length < int.parse(_limit)) {
      _result[indexColumn][indexRow]['status'] = 'not available';
      _selected.add({
        "seatNumber": _result[indexColumn][indexRow]['seatNumber'],
        "indexColumn": indexColumn,
        "indexRow": indexRow
      });
    }
    notifyListeners();
  }

  removeSelected(int index) {
    int columnIndex = _selected[index]['indexColumn'];
    int rowIndex = _selected[index]['indexRow'];
    _result[columnIndex][rowIndex]['status'] = 'available';
    _selected.removeAt(index);
    notifyListeners();
  }

  getSeat() async {
    var seatModel = await _homeRepository.getSeat();
    _seatList.add(seatModel);
    _result = List.generate(_seatList[0].seatLayout!.columns!, (index) => []);

    for (var i = 0; i < _result.length; i++) {
      for (var j = 0; j < _seatList[0].seatLayout!.seats!.length; j++) {
        if (_seatList[0].seatLayout!.seats![j].seatNumber![0] ==
            String.fromCharCode(i + 65)) {
          _result[i].add({
            "seatNumber": _seatList[0].seatLayout!.seats![j].seatNumber!,
            "status": _seatList[0].seatLayout!.seats![j].status!
          });
        }
      }
    }
    notifyListeners();
  }
}
