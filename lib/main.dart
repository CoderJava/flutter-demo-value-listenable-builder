import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', '');
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
  var widthScreen = 0.0;

  Timer? timer;
  late ValueNotifier<DateTime> valueNotifierNow;

  @override
  void initState() {
    valueNotifierNow = ValueNotifier<DateTime>(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      valueNotifierNow.value = DateTime.now();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('ini method build');
    final mediaQueryData = MediaQuery.of(context);
    widthScreen = mediaQueryData.size.width;
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
            const SizedBox(height: 24),
            ValueListenableBuilder<DateTime>(
              valueListenable: valueNotifierNow,
              builder: (BuildContext context, DateTime now, Widget? child) {
                return buildWidgetDateTime(now);
              },
            ),
            buildWidgetButtonPresence(),
            buildWidgetHistoryPresence(),
            const SizedBox(height: 24),
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

  Widget buildWidgetDateTime(DateTime now) {
    print('ini method buildWidgetDateTime');
    final formattedTime = DateFormat('HH:mm', 'id').format(now);
    final formattedTime2 = DateFormat(':ss', 'id').format(now);
    final formattedDate = DateFormat('EEEE, dd MMM yyy', 'id').format(now);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Text(
              formattedTime,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
            ),
            Text(
              formattedTime2,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
            ),
          ],
        ),
        Text(
          formattedDate,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  Widget buildWidgetButtonPresence() {
    return Expanded(
      child: Container(
        width: widthScreen / 1.5,
        height: widthScreen / 1.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.orange[900]!,
              Colors.orange,
              Colors.orange[200]!,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.3),
              offset: const Offset(0, 8),
              blurRadius: 8,
              spreadRadius: 8,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fingerprint,
              color: Colors.white,
              size: widthScreen / 3,
            ),
            Text(
              'Absen Masuk',
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWidgetHistoryPresence() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Ijin Tidak Hadir'),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.article_rounded,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 8),
            const Text("Lihat History"),
          ],
        ),
      ],
    );
  }

  Widget buildWidgetMenu() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(
                Icons.fingerprint,
                color: Colors.orange,
              ),
              const SizedBox(height: 4),
              Text(
                'Absensi',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 12,
                      color: Colors.orange,
                    ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.local_activity,
                color: Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                'Kegiatan',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.help,
                color: Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                'Problem',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                'Lokasi',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
