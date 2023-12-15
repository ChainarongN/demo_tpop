import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tpop/pages/home/widgets/seat_all_widget.dart';
import 'package:test_tpop/pages/home/widgets/select_limit_widget.dart';
import 'package:test_tpop/pages/home/widgets/selected_widget.dart';
import 'package:test_tpop/providers/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeProvider>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeRead = context.read<HomeProvider>();
    var homeWatch = context.watch<HomeProvider>();
    return Scaffold(
      body: homeWatch.seatList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, bottom: 18, top: 80),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    selectLimit(homeWatch, homeRead),
                    seatAll(homeWatch, homeRead),
                    const Divider(
                      height: 50,
                    ),
                    const Text('ที่นั่ง',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    selectedWidget(homeWatch, homeRead)
                  ],
                ),
              ),
            ),
    );
  }
}
