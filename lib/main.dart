import 'exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());

  await Hive.openBox<TransactionModel>("transactions");

  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImageController>(
          create: (context) => ImageController(),
        ),
        ChangeNotifierProvider<CategorySearcherController>(
          create: (context) => CategorySearcherController(),
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider<DateController>(
          create: (context) => DateController(),
        ),
        ChangeNotifierProvider<HiveDB>(
          create: (context) => HiveDB(),
        ),
        ChangeNotifierProvider<IsExpenseController>(
          create: (context) => IsExpenseController(),
        )
      ],
      child: const Root(),
    );
  }
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeC = Provider.of(context);
    HiveDB dbC = Provider.of(context);
    Future.delayed(
      const Duration(milliseconds: 1),
      () {
        dbC.fetchTransactions();
      },
    );
    return MaterialApp(
      themeMode: themeC.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
