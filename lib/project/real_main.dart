// Import statements for necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch2truth/project/auth_pages/sign_in.dart';
import 'database_management/shared_preferences_service.dart';
import 'localization/app_localization.dart';

// import 'home.dart';

// Entry point for the Flutter application
void realMain() async {
  // Ensure that the Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize shared preferences for the app
    await sharedPrefs.sharePrefsInit();

    // Set default categories in shared preferences
    sharedPrefs.setItems(setCategoriesToDefault: false);

    // Get and set the currency from shared preferences
    sharedPrefs.getCurrency();

    // Get all expense items lists from shared preferences
    sharedPrefs.getAllExpenseItemsLists();
  } catch (e) {
    print("Error during initialization: $e");
  }

  // Run the main application
  runApp(MyApp()
      // AppLock(
      // builder: (args) => MyApp(),
      // lockScreen: MainLockScreen(),
      // enabled: sharedPrefs.isPasscodeOn ? true : false)
      );
}

// Main Flutter application widget
class MyApp extends StatefulWidget {
  // Static method to set the locale for the entire app
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

// State class for the main Flutter application widget
class _MyAppState extends State<MyApp> {
  // Variable to hold the current locale
  late Locale? _locale;

  // Method to set the locale for the app dynamically
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // Called when dependencies change, retrieves the current locale from shared preferences
  @override
  void didChangeDependencies() {
    Locale appLocale = sharedPrefs.getLocale();
    setState(() {
      this._locale = appLocale;
    });
    super.didChangeDependencies();
  }

  // Build method for the main Flutter application widget
  @override
  Widget build(BuildContext context) {
    // Check if the locale is not determined yet
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]!)),
        ),
      );
    } else {
      // Initialize the ScreenUtil and MaterialApp widgets
      return ScreenUtilInit(
        designSize: Size(428.0, 926.0),
        builder: (_, child) => MaterialApp(
          // App title and debug settings
          title: 'Touch2Truth',
          debugShowCheckedModeBanner: false,

          // // Theme configuration
          // theme: ThemeData(
          //   textTheme: TextTheme(
          //       // Custom text styles for various text elements
          //       displaySmall: TextStyle(
          //       fontFamily: 'OpenSans',
          //       fontSize: 45.0,
          //       color: Colors.deepOrangeAccent,
          //     ),
          //     labelLarge: TextStyle(
          //       fontFamily: 'OpenSans',
          //     ),
          //     titleMedium: TextStyle(fontFamily: 'NotoSans'),
          //     bodyMedium: TextStyle(fontFamily: 'NotoSans'),
          //   ),
          //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
          //       .copyWith(secondary: Colors.orange),
          //   textSelectionTheme:
          //       TextSelectionThemeData(cursorColor: Colors.amberAccent),
          // ),

          // Theme configuration
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // Primary color for the app
            hintColor: Colors.orange,
            // Accent color for buttons, etc.

            // Text theme for consistent typography
            textTheme: TextTheme(
              displaySmall: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              titleMedium: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 16.0,
                color: Colors.black87,
              ),
              labelLarge: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),

            // Customizing the app bar theme
            appBarTheme: AppBarTheme(
              color: Colors.blue,
              // App bar background color
              iconTheme: IconThemeData(color: Colors.black87),
              toolbarTextStyle: TextTheme(
                titleLarge: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ).bodyMedium,
              titleTextStyle: TextTheme(
                titleLarge: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ).titleLarge,
            ),

            // Customizing the input field and button theme
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 18.0),
              ),
            ),

            // Setting the cursor color
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.blue,
            ),
          ),

          // MediaQuery settings
          builder: (context, widget) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(1)),
            child: widget!,
          ),

          // Initial route and localization settings
          home: SignIn(),
          // Home(),
          locale: _locale ?? Locale("en", "US"),
          // Add null check and provide a default value if _locale is null
          localizationsDelegates: [
            // Localization delegates for supporting multiple languages
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            // Callback to determine the app's locale based on supported locales
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },

          // List of supported locales
          supportedLocales: [
            Locale("hi", "IN"),
            Locale("en", "US"),
            Locale("de", "DE"),
            Locale("es", "ES"),
            Locale("fr", "FR"),
            Locale("ja", "JP"),
            Locale("ko", "KR"),
            Locale("pt", "PT"),
            Locale("ru", "RU"),
            Locale("tr", "TR"),
            Locale("vi", "VN"),
            Locale("zh", "CN"),
          ],
        ),
      );
    }
  }
}
