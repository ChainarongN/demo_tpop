import 'dart:convert';

import 'package:test_tpop/models/seat_model.dart';
import 'package:test_tpop/network/api_service.dart';
import 'package:test_tpop/network/end_points.dart';
import 'package:test_tpop/repositorys/home/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<SeatModel> getSeat() async {
    var jsonData = await APIService().get(Endpoints.baseUrl);
    SeatModel seatData = SeatModel.fromJson(jsonDecode(jsonData));

    return seatData;
  }
}
