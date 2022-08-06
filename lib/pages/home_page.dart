import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket/model.dart';
import 'package:socket/service/socket_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? response;
  DataSocked data = DataSocked();

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  initSocketServer() {
    SocketService.connectSocketChannel();
    SocketService.channel.stream.listen((event) {
      setState(() {
        data = DataSocked.fromJson(jsonDecode(event));
        response = data.data!.price;
      });
    }, onError: (error) {
      setState(() {
        response = 0.0;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initSocketServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: response != null
              ? Text("$response")
              : const CircularProgressIndicator(),
          // ),
        ),
      ),
    );
  }
}
