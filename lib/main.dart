import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter: ValueListenableBuilder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var paddingTop = 0.0;
  var paddingBottom = 0.0;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    paddingTop = mediaQueryData.padding.top;
    paddingBottom = mediaQueryData.padding.bottom;

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(
          16,
          paddingTop + 16,
          16,
          paddingBottom > 0 ? paddingBottom : 16,
        ),
        child: Column(
          children: [
            buildWidgetHeader(),
            buildWidgetDateTime(),
            buildWidgetButtonPresence(),
            buildWidgetHistoryPresence(),
            buildWidgetMenu(),
          ],
        ),
      ),
    );
  }

  Widget buildWidgetHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Text(
                'Putri',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        ClipOval(
          child: Image.asset(
            'assets/photo_profile.jpeg',
            width: 42,
            height: 42,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget buildWidgetDateTime() {
    // TODO: buat widget yang menampilkan tanggal dan jam sekarang
    return Container();
  }

  Widget buildWidgetButtonPresence() {
    // TODO: buat widget yang menampilkan button presence
    return Container();
  }

  Widget buildWidgetHistoryPresence() {
    // TODO: buat widget yang menampilkan button ijin tidak hadir dan history presensi
    return Container();
  }

  Widget buildWidgetMenu() {
    // TODO: buat widget yang menampilkan menu-nya
    return Container();
  }
}
