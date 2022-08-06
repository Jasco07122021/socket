import 'package:flutter/material.dart';
import 'package:socket/service/socket_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketService.connectSocketChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: SocketService.channel.stream,
          builder: (context, snapshot) {
            return Center(
                child: Text(
              snapshot.hasData ? snapshot.data.toString() : "No Data",
              style: const TextStyle(fontSize: 22),
            ));
          },
        ),
      ),
    );
  }
}
