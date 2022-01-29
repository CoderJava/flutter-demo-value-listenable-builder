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
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm', 'id').format(now);
    final formattedTime2 = DateFormat(':ss', 'id').format(now);
    final formattedDate = DateFormat('EEEE, dd MMM yyy', 'id').format(now);
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
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
      ),
    );
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
