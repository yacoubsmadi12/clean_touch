import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    'suxubljk': {
      'en': 'CleanTouch',
      'ar': '',
    },
    's2bx96mm': {
      'en': '\\\"Cleanliness is next to godliness\\\"',
      'ar': '',
    },
  },
  // LanguageSelection
  {
    'o41o0456': {
      'en': 'Choose your language',
      'ar': '',
    },
    'qkd9yuzn': {
      'en': 'العربية',
      'ar': '',
    },
    'qcsy43dx': {
      'en': 'English',
      'ar': '',
    },
  },
  // Welcome
  {
    '5w2jl8pw': {
      'en': 'Cleanliness is the key to comfort',
      'ar': '',
    },
    'mfl6h9l8': {
      'en': 'Sign in as User',
      'ar': '',
    },
    '2npezca4': {
      'en': 'Sign in as Service Provider',
      'ar': '',
    },
  },
  // Login
  {
    'v3xd828w': {
      'en': 'Email',
      'ar': '',
    },
    '6kexy2f6': {
      'en': 'Password',
      'ar': '',
    },
    'c8439x5g': {
      'en': 'Forgot Password?',
      'ar': '',
    },
    'ffy41dh3': {
      'en': 'Login',
      'ar': '',
    },
    'n80zfy13': {
      'en': 'Sign in with Google',
      'ar': '',
    },
    'ywlo8sa5': {
      'en': 'Don\'t have an account?',
      'ar': '',
    },
    'prft7dvs': {
      'en': 'Register Now',
      'ar': '',
    },
  },
  // SignUpUser
  {
    'qlm2ek1w': {
      'en': 'Register as a Customer',
      'ar': '',
    },
    'ul6akrnd': {
      'en': 'Name *',
      'ar': '',
    },
    'b0zn5iow': {
      'en': 'Enter your full name',
      'ar': '',
    },
    '9ewz0196': {
      'en': 'Email *',
      'ar': '',
    },
    'fbo472rd': {
      'en': 'Enter your email address',
      'ar': '',
    },
    '2dbw6i9r': {
      'en': 'Phone Number *',
      'ar': '',
    },
    'co00lkhd': {
      'en': 'Enter your phone number',
      'ar': '',
    },
    'tm8i4b36': {
      'en': 'Password *',
      'ar': '',
    },
    'mrvqjbpr': {
      'en': 'Enter password (min 6 characters)',
      'ar': '',
    },
    'zysj525z': {
      'en': 'Confirm Password *',
      'ar': '',
    },
    '4mne3sl4': {
      'en': 'Re-enter your password',
      'ar': '',
    },
    '5zogr3vb': {
      'en': 'Register',
      'ar': '',
    },
    'jz8u6atf': {
      'en': 'Already have an account? ',
      'ar': '',
    },
    '83yfrgus': {
      'en': 'Login',
      'ar': '',
    },
  },
  // SignUpServiceProvider
  {
    'u6o8uf0v': {
      'en': 'CleanTouch',
      'ar': '',
    },
    'o3qpq7r0': {
      'en': 'Register as a Service Provider',
      'ar': '',
    },
    'ytccea8y': {
      'en': 'Full Name',
      'ar': '',
    },
    'oj1dsj60': {
      'en': 'Enter your full name',
      'ar': '',
    },
    'zwk3vrzq': {
      'en': 'Email Address',
      'ar': '',
    },
    'eh00888f': {
      'en': 'Enter your email address',
      'ar': '',
    },
    'pik4zkyi': {
      'en': 'Phone Number',
      'ar': '',
    },
    'smrpbqrd': {
      'en': 'Enter your phone number',
      'ar': '',
    },
    'r40p07y0': {
      'en': 'Password',
      'ar': '',
    },
    '9gvojfi6': {
      'en': 'Enter password (min 6 characters)',
      'ar': '',
    },
    '7esf1fub': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '5vluxl7c': {
      'en': 'Confirm your password',
      'ar': '',
    },
    'kqgq47kx': {
      'en': 'Service Title',
      'ar': '',
    },
    '0rzo81g1': {
      'en': 'e.g., Professional House Cleaning',
      'ar': '',
    },
    'i2k5vqoj': {
      'en': 'Service Description',
      'ar': '',
    },
    '9e4fdc44': {
      'en': 'Describe your cleaning services in detail',
      'ar': '',
    },
    '8h301ao9': {
      'en': 'Service Address',
      'ar': '',
    },
    'larmi027': {
      'en': 'Enter your service area address',
      'ar': '',
    },
    'y6cihtmp': {
      'en': 'Years of Experience',
      'ar': '',
    },
    '8xyurgxa': {
      'en': 'Years',
      'ar': '',
    },
    'evezaz0c': {
      'en': 'Price per Hour',
      'ar': '',
    },
    'jtvyacae': {
      'en': '\$25',
      'ar': '',
    },
    '1ldc43bd': {
      'en': 'Upload Service Photos (Optional)',
      'ar': '',
    },
    'zavp6t5a': {
      'en': 'Tap to upload photos',
      'ar': '',
    },
    'khrgyaqj': {
      'en': 'Show your work quality',
      'ar': '',
    },
    'x986218t': {
      'en': 'Register as Service Provider',
      'ar': '',
    },
    't9l0vm2q': {
      'en': 'Already have an account?',
      'ar': '',
    },
    'dd0g5v6x': {
      'en': 'Login',
      'ar': '',
    },
  },
  // UserDashboard
  {
    'ip0ylvk2': {
      'en': 'Search services',
      'ar': '',
    },
    'tkcceaa0': {
      'en': 'Map View',
      'ar': '',
    },
    'aeztk76k': {
      'en': 'Nearby Service Providers',
      'ar': '',
    },
    'w55malzs': {
      'en': 'Sarah Johnson',
      'ar': '',
    },
    '1boqkc6m': {
      'en': '4.8 (127 reviews)',
      'ar': '',
    },
    'hlzuaxew': {
      'en': 'House Cleaning • \$25/hour',
      'ar': '',
    },
    '41lbq98v': {
      'en': 'Book Now',
      'ar': '',
    },
    'xc6001n2': {
      'en': 'S',
      'ar': '',
    },
    'e5dm1ak4': {
      'en': 'ServiceHub',
      'ar': '',
    },
    'wg0oic4s': {
      'en': 'John Smith',
      'ar': '',
    },
    '9xmnbg7b': {
      'en': 'john.smith@email.com',
      'ar': '',
    },
    'el7k2y09': {
      'en': 'Personal Information',
      'ar': '',
    },
    'kouezvbx': {
      'en': 'Dark Theme',
      'ar': '',
    },
    'gsyq6gvh': {
      'en': 'Language',
      'ar': '',
    },
    'c6qwk4np': {
      'en': 'Privacy Policy',
      'ar': '',
    },
    'k718dnzo': {
      'en': 'Refund Policy',
      'ar': '',
    },
    '7q2gfdrq': {
      'en': 'Contact Support via WhatsApp',
      'ar': '',
    },
  },
  // ServiceProviderDashboard
  {
    'xj0pa2ra': {
      'en': 'SP',
      'ar': '',
    },
    '0rmjvx3y': {
      'en': 'Service Provider',
      'ar': '',
    },
    'nh0iiz1l': {
      'en': 'Dashboard',
      'ar': '',
    },
    'l3igvw9y': {
      'en': 'Ahmad Hassan',
      'ar': '',
    },
    'pkq8wcpy': {
      'en': 'Service Provider',
      'ar': '',
    },
    'e2zr07lp': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'spfixact': {
      'en': 'Change Password',
      'ar': '',
    },
    '6n3xpzti': {
      'en': 'View Policies',
      'ar': '',
    },
    'rd9l37aq': {
      'en': 'Contact Support',
      'ar': '',
    },
    'zl4j7af5': {
      'en': 'Logout',
      'ar': '',
    },
    'qk83anbu': {
      'en': 'Services',
      'ar': '',
    },
    '1w79mbqd': {
      'en': 'Orders',
      'ar': '',
    },
    'nq2opac5': {
      'en': 'Earnings',
      'ar': '',
    },
    '6p754oas': {
      'en': 'Plumbing Services',
      'ar': '',
    },
    'lkjv8zgu': {
      'en':
          'Professional plumbing repair and installation services for homes and offices',
      'ar': '',
    },
    'g6jxhk7x': {
      'en': '25 JOD',
      'ar': '',
    },
  },
  // ProfileSettings
  {
    'so02yzax': {
      'en': 'Profile & Settings',
      'ar': '',
    },
    'zjnki2p1': {
      'en': 'John Anderson',
      'ar': '',
    },
    '3u3v9qam': {
      'en': 'john.anderson@email.com',
      'ar': '',
    },
    'vd6mln0l': {
      'en': '+1 (555) 123-4567',
      'ar': '',
    },
    'o6yeqtg7': {
      'en': 'Dark Theme',
      'ar': '',
    },
    'fcuo487v': {
      'en': 'Language',
      'ar': '',
    },
    'rdrzho5s': {
      'en': 'English',
      'ar': '',
    },
    '3aju3dzc': {
      'en': 'App Policies',
      'ar': '',
    },
    'y8nej6x9': {
      'en': 'Refund Policy',
      'ar': '',
    },
    'zsjt2bz3': {
      'en': 'Change Password',
      'ar': '',
    },
    'p7rvp220': {
      'en': 'Contact Support via WhatsApp',
      'ar': '',
    },
  },
  // OrdersPage
  {
    'vc5nv2iu': {
      'en': 'Orders',
      'ar': '',
    },
    '04mp7d77': {
      'en': 'Sarah Johnson',
      'ar': '',
    },
    '2em84dnw': {
      'en': 'Deep House Cleaning',
      'ar': '',
    },
    'nil87uuj': {
      'en': 'Dec 15, 2024 • 2:00 PM',
      'ar': '',
    },
    '5sv13lo8': {
      'en': '123 Oak Street, Downtown',
      'ar': '',
    },
    'j2agq4ei': {
      'en': 'Pending',
      'ar': '',
    },
    'r361211w': {
      'en': '\$85.00',
      'ar': '',
    },
    '9bvnjo8r': {
      'en': 'Accept',
      'ar': '',
    },
    'eolsqwbd': {
      'en': 'Decline',
      'ar': '',
    },
    'kldb74kx': {
      'en': 'Michael Chen',
      'ar': '',
    },
    'pybmzwel': {
      'en': 'Office Cleaning',
      'ar': '',
    },
    '251do3pw': {
      'en': 'Dec 14, 2024 • 10:00 AM',
      'ar': '',
    },
    'cnbr6na5': {
      'en': '456 Business Plaza, Suite 201',
      'ar': '',
    },
    'gnf9o9jv': {
      'en': 'In Progress',
      'ar': '',
    },
    '865ocvcd': {
      'en': '\$120.00',
      'ar': '',
    },
    '2ifvgyxi': {
      'en': 'Mark Completed',
      'ar': '',
    },
    'c2wey4uy': {
      'en': 'Emily Rodriguez',
      'ar': '',
    },
    'aj31rgav': {
      'en': 'Apartment Cleaning',
      'ar': '',
    },
    'zaql43q9': {
      'en': 'Dec 13, 2024 • 3:30 PM',
      'ar': '',
    },
    'cd9k7jml': {
      'en': '789 Maple Avenue, Apt 4B',
      'ar': '',
    },
    'kqkl63fe': {
      'en': 'Completed',
      'ar': '',
    },
    'tifynzxc': {
      'en': '\$65.00',
      'ar': '',
    },
    'otnly9r2': {
      'en': 'Orders',
      'ar': '',
    },
    'wk834ty9': {
      'en': 'Sarah Johnson',
      'ar': '',
    },
    '74182e5f': {
      'en': 'Deep House Cleaning',
      'ar': '',
    },
    'cxh0abg0': {
      'en': 'Dec 15, 2024 • 2:00 PM',
      'ar': '',
    },
    '0au0d75y': {
      'en': '123 Oak Street, Downtown',
      'ar': '',
    },
    'kvw59r22': {
      'en': 'Pending',
      'ar': '',
    },
    'ghnbwh6x': {
      'en': '\$85.00',
      'ar': '',
    },
    '4kvglxsb': {
      'en': 'Accept',
      'ar': '',
    },
    'sfq9trrm': {
      'en': 'Decline',
      'ar': '',
    },
    'tgh826ey': {
      'en': 'Michael Chen',
      'ar': '',
    },
    '0wpusbr2': {
      'en': 'Office Cleaning',
      'ar': '',
    },
    'jk5x042k': {
      'en': 'Dec 14, 2024 • 10:00 AM',
      'ar': '',
    },
    'zqiu3m58': {
      'en': '456 Business Plaza, Suite 201',
      'ar': '',
    },
    '48kn5vqs': {
      'en': 'In Progress',
      'ar': '',
    },
    'xodvpnzo': {
      'en': '\$120.00',
      'ar': '',
    },
    'sfg3sjey': {
      'en': 'Mark Completed',
      'ar': '',
    },
    'iqgu0jgc': {
      'en': 'Emily Rodriguez',
      'ar': '',
    },
    '0nanzhke': {
      'en': 'Apartment Cleaning',
      'ar': '',
    },
    'q4e5sgkz': {
      'en': 'Dec 13, 2024 • 3:30 PM',
      'ar': '',
    },
    'gct60g2c': {
      'en': '789 Maple Avenue, Apt 4B',
      'ar': '',
    },
    'dyvo4n05': {
      'en': 'Completed',
      'ar': '',
    },
    '31vxuizx': {
      'en': '\$65.00',
      'ar': '',
    },
  },
  // EarningsPage
  {
    '7hlqz31y': {
      'en': 'Earnings',
      'ar': '',
    },
    'o6eqehur': {
      'en': 'Wallet Balance',
      'ar': '',
    },
    '7ircsepa': {
      'en': '150 JOD',
      'ar': '',
    },
    'ffg6w89r': {
      'en': 'Total Monthly',
      'ar': '',
    },
    'xqu5bsjz': {
      'en': 'Earnings',
      'ar': '',
    },
    '2r9ir7xu': {
      'en': '85 JOD',
      'ar': '',
    },
    'zogl4tql': {
      'en': 'Total',
      'ar': '',
    },
    'tqcqlezb': {
      'en': 'Earnings',
      'ar': '',
    },
    'wf4t6o2n': {
      'en': '1,250 JOD',
      'ar': '',
    },
    '0m5p6m5p': {
      'en': 'Last',
      'ar': '',
    },
    'pl3gu523': {
      'en': 'Withdrawal',
      'ar': '',
    },
    'yw08015j': {
      'en': '100 JOD',
      'ar': '',
    },
    'x7usggps': {
      'en': 'Commission',
      'ar': '',
    },
    'v78qz1bq': {
      'en': 'Deducted',
      'ar': '',
    },
    'ibdmvv1q': {
      'en': '25 JOD',
      'ar': '',
    },
    'wde3bwdh': {
      'en': 'Recent Transactions',
      'ar': '',
    },
    'dw1kxanc': {
      'en': 'Dec 15, 2024',
      'ar': '',
    },
    'kthmhafy': {
      'en': 'Order #CT-2024-001',
      'ar': '',
    },
    'a4wbcpcz': {
      'en': 'Balance: 150 JOD',
      'ar': '',
    },
    '0zd5vug6': {
      'en': '+25 JOD',
      'ar': '',
    },
    '1jhyxp5i': {
      'en': 'Dec 12, 2024',
      'ar': '',
    },
    'o2wdyekh': {
      'en': 'Withdrawal Request',
      'ar': '',
    },
    'ihrf67b4': {
      'en': 'Balance: 125 JOD',
      'ar': '',
    },
    'kuzpfnef': {
      'en': '-100 JOD',
      'ar': '',
    },
    'k0gbsj3v': {
      'en': 'Dec 10, 2024',
      'ar': '',
    },
    'n8uq2msf': {
      'en': 'Order #CT-2024-002',
      'ar': '',
    },
    'e3mge6r0': {
      'en': 'Balance: 225 JOD',
      'ar': '',
    },
    'qf3zrjf0': {
      'en': '+30 JOD',
      'ar': '',
    },
    'rv72jlah': {
      'en': 'Dec 8, 2024',
      'ar': '',
    },
    'fowlundd': {
      'en': 'Commission Deducted',
      'ar': '',
    },
    'sdck2wle': {
      'en': 'Balance: 195 JOD',
      'ar': '',
    },
    'f6eifs5d': {
      'en': '-5 JOD',
      'ar': '',
    },
    '63cgef1q': {
      'en': 'Dec 5, 2024',
      'ar': '',
    },
    'lgwgiyd6': {
      'en': 'Order #CT-2024-003',
      'ar': '',
    },
    'c84alaoc': {
      'en': 'Balance: 200 JOD',
      'ar': '',
    },
    'frnvly3j': {
      'en': '+20 JOD',
      'ar': '',
    },
    'vuhvs5kt': {
      'en': 'Withdraw Earnings',
      'ar': '',
    },
  },
  // RefundPolicy
  {
    'xka840vi': {
      'en': 'Refund Policy',
      'ar': '',
    },
    '14coigni': {
      'en': 'Cancellation Before Service Starts',
      'ar': '',
    },
    '4hsqz16n': {
      'en':
          'If you cancel your cleaning service before our team arrives at your location, you are eligible for a ',
      'ar': '',
    },
    'mniadbmw': {
      'en': 'Full Refund',
      'ar': '',
    },
    '3u81zlei': {
      'en':
          '. The refund will be processed within 3-5 business days to your original payment method.',
      'ar': '',
    },
    '367corc9': {
      'en': 'Cancellation After Service Starts',
      'ar': '',
    },
    '9zjopkik': {
      'en':
          'If you cancel after our cleaning team has started working, you will receive a ',
      'ar': '',
    },
    'sdcjy6rd': {
      'en': 'Partial Refund',
      'ar': '',
    },
    'n8t0a7m8': {
      'en': ' calculated based on the ',
      'ar': '',
    },
    'wpzu9zc3': {
      'en': 'hours of service completed',
      'ar': '',
    },
    'ujnu0z2e': {
      'en':
          '. You will only be charged for the actual time spent cleaning your space.',
      'ar': '',
    },
    'lwij9e35': {
      'en': 'No-Show by Service Provider',
      'ar': '',
    },
    'dw1hpk3f': {
      'en':
          'If our cleaning team fails to show up for your scheduled appointment without prior notice, you will automatically receive a ',
      'ar': '',
    },
    'aqdm3zbq': {
      'en': 'Full Refund',
      'ar': '',
    },
    'elygpmz2': {
      'en': ' plus a ',
      'ar': '',
    },
    '4gbjehrw': {
      'en': 'service credit',
      'ar': '',
    },
    'x12maysi': {
      'en': ' for your next booking.',
      'ar': '',
    },
    'pk4xk4l8': {
      'en': 'Refund Processing Time',
      'ar': '',
    },
    'mzts85tg': {
      'en': 'All approved refunds will be processed within ',
      'ar': '',
    },
    'phglqhjn': {
      'en': '3-5 business days',
      'ar': '',
    },
    'je6cmmk9': {
      'en':
          ' and credited back to your original payment method. You will receive an email confirmation once the refund has been initiated.',
      'ar': '',
    },
    'yz5h2zat': {
      'en': 'Contact Support',
      'ar': '',
    },
    'od6syufz': {
      'en':
          'For any questions regarding refunds or to request a refund, please contact our ',
      'ar': '',
    },
    've7luzdu': {
      'en': 'customer support team',
      'ar': '',
    },
    'j6rzuq9r': {
      'en': ' at support@cleantouch.com or through the in-app chat feature.',
      'ar': '',
    },
    'fjh4wg4y': {
      'en': 'I Understand',
      'ar': '',
    },
  },
  // ChangePassword
  {
    '0kmoxn8p': {
      'en': 'Change Password',
      'ar': '',
    },
    'adl5yecr': {
      'en': 'Current Password',
      'ar': '',
    },
    'kfvmho1h': {
      'en': 'Enter your current password',
      'ar': '',
    },
    '19jykvs2': {
      'en': 'New Password',
      'ar': '',
    },
    '67nu97zi': {
      'en': 'Enter new password (min 6 characters)',
      'ar': '',
    },
    'ujtsuf2y': {
      'en': 'Confirm New Password',
      'ar': '',
    },
    '7etvqe7r': {
      'en': 'Re-enter your new password',
      'ar': '',
    },
    'n1odm8z1': {
      'en': 'Password must be at least 6 characters long',
      'ar': '',
    },
    'dni2rtz4': {
      'en': 'Update Password',
      'ar': '',
    },
    '3blios4e': {
      'en': 'Password updated successfully',
      'ar': '',
    },
    '5obg5mm3': {
      'en': 'Incorrect current password',
      'ar': '',
    },
  },
  // addservice
  {
    'ynkh74pi': {
      'en': 'Add New Service',
      'ar': '',
    },
    '91bx2zw1': {
      'en': 'Service Title',
      'ar': '',
    },
    'mqo1km6p': {
      'en': 'Enter service name',
      'ar': '',
    },
    'eqrpku7p': {
      'en': 'Category',
      'ar': '',
    },
    'ozoibxhi': {
      'en': 'Select category',
      'ar': '',
    },
    'j77hj2if': {
      'en': 'Cleaning',
      'ar': '',
    },
    '1re4r6zc': {
      'en': 'Electrical',
      'ar': '',
    },
    'px2udx2q': {
      'en': 'Painting',
      'ar': '',
    },
    'az0effhf': {
      'en': 'Plumbing',
      'ar': '',
    },
    'qo2dxckg': {
      'en': 'Other',
      'ar': '',
    },
    'ndp5ib82': {
      'en': 'Description',
      'ar': '',
    },
    'x9j1vuwv': {
      'en': 'Describe your service in detail',
      'ar': '',
    },
    's6z2di88': {
      'en': 'Price (JD)',
      'ar': '',
    },
    '05e5brhp': {
      'en': 'Enter price in JD',
      'ar': '',
    },
    '74tlawav': {
      'en': 'Service Image',
      'ar': '',
    },
    'ebjn7qgp': {
      'en': 'Tap to upload image',
      'ar': '',
    },
    'yfinrtc2': {
      'en': 'Camera',
      'ar': '',
    },
    'mj3fwdfb': {
      'en': 'Gallery',
      'ar': '',
    },
    'vc3nz12u': {
      'en': 'Save Service',
      'ar': '',
    },
  },
  // police_page
  {
    'lk81qsn0': {
      'en': 'App Policies',
      'ar': '',
    },
    '97molal0': {
      'en': 'Terms of Service',
      'ar': '',
    },
    '2icvq25z': {
      'en':
          'Welcome to CleanTouch! By using our application, you agree to comply with and be bound by the following terms and conditions. These terms govern your use of the CleanTouch app and all related services. Please read these terms carefully before using our app. If you do not agree to these terms, please do not use our application.\n\nCleanTouch reserves the right to modify these terms at any time without prior notice. Your continued use of the app after any changes indicates your acceptance of the new terms. The app is provided \'as is\' without any warranties, express or implied.',
      'ar': '',
    },
    '4nbcyo9i': {
      'en': 'Privacy Policy',
      'ar': '',
    },
    't4ylrhgn': {
      'en':
          'At CleanTouch, we are committed to protecting your privacy and personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our application.\n\nWe may collect personal information such as your name, email address, and usage data to improve our services. We do not sell, trade, or rent your personal information to third parties. Your data is stored securely and is only used for the purposes outlined in this policy. We may use cookies and similar technologies to enhance your user experience.',
      'ar': '',
    },
    'gnocyofh': {
      'en': 'User Responsibilities',
      'ar': '',
    },
    '0e2kexrv': {
      'en': '•',
      'ar': '',
    },
    'vfjao8e5': {
      'en':
          'Use the app in accordance with all applicable laws and regulations',
      'ar': '',
    },
    'hkk07epd': {
      'en': '•',
      'ar': '',
    },
    'easfjwfd': {
      'en': 'Maintain the confidentiality of your account credentials',
      'ar': '',
    },
    'yzgx0w45': {
      'en': '•',
      'ar': '',
    },
    '6232epqf': {
      'en': 'Report any bugs or security vulnerabilities to our support team',
      'ar': '',
    },
    'vy4m7xlk': {
      'en': '•',
      'ar': '',
    },
    'wiaeg7sp': {
      'en':
          'Respect other users and refrain from harmful or inappropriate behavior',
      'ar': '',
    },
    'ha6dh1ty': {
      'en': '•',
      'ar': '',
    },
    'u0rzihc4': {
      'en':
          'Keep your app updated to the latest version for optimal performance',
      'ar': '',
    },
    'gf5667oq': {
      'en': 'I have read and agree to the policies',
      'ar': '',
    },
    '5jzlauy2': {
      'en': 'Accept',
      'ar': '',
    },
  },
  // BookingConfirmationPage
  {
    '1ob7zrrm': {
      'en': 'Booking Confirmed!',
      'ar': '',
    },
    'by96e13c': {
      'en': 'Your service has been booked successfully.',
      'ar': '',
    },
    'wrsfxld7': {
      'en': 'Booking Summary',
      'ar': '',
    },
    'qgkgb7u3': {
      'en': 'Service',
      'ar': '',
    },
    'zthmmc3u': {
      'en': 'Home Cleaning Service',
      'ar': '',
    },
    'rix8kfvc': {
      'en': 'Date',
      'ar': '',
    },
    'crqvv1b6': {
      'en': 'March 15, 2024',
      'ar': '',
    },
    's62c4q70': {
      'en': 'Time',
      'ar': '',
    },
    '2pqn6slo': {
      'en': '2:00 PM - 4:00 PM',
      'ar': '',
    },
    '2ihousnr': {
      'en': 'Address',
      'ar': '',
    },
    'uvvilzry': {
      'en': '123 Oak Street, Downtown\nNew York, NY 10001',
      'ar': '',
    },
    'ukx8w5ad': {
      'en': 'Provider',
      'ar': '',
    },
    'ykbrzkre': {
      'en': 'CleanPro Services',
      'ar': '',
    },
    '2xn8w696': {
      'en': 'Go to My Bookings',
      'ar': '',
    },
  },
  // EditServicePage
  {
    '1plf0j2d': {
      'en': 'Edit Service',
      'ar': '',
    },
    'w4xpr5jx': {
      'en': 'Service Title *',
      'ar': '',
    },
    'hk5xn27i': {
      'en': 'Enter service title',
      'ar': '',
    },
    'sf59k1g5': {
      'en': 'Professional House Cleaning',
      'ar': '',
    },
    '4xx1wawy': {
      'en': 'Service Description *',
      'ar': '',
    },
    'x7zl339g': {
      'en': 'Describe your service in detail',
      'ar': '',
    },
    'nf2w3h42': {
      'en':
          'Complete residential cleaning service including dusting, vacuuming, mopping, bathroom and kitchen deep cleaning. Eco-friendly products available upon request.',
      'ar': '',
    },
    '3xqsltey': {
      'en': 'Price per Hour *',
      'ar': '',
    },
    'b7aduy5v': {
      'en': '\$0.00',
      'ar': '',
    },
    'w11pscdv': {
      'en': '\$45.00',
      'ar': '',
    },
    'sdri408e': {
      'en': 'Years of Experience *',
      'ar': '',
    },
    '9l97ejaf': {
      'en': '0',
      'ar': '',
    },
    'zwr7jfhu': {
      'en': '8',
      'ar': '',
    },
    'bxtu7ebw': {
      'en': 'Service Address *',
      'ar': '',
    },
    'hwzsitot': {
      'en': 'Enter your service area address',
      'ar': '',
    },
    'y5t970tn': {
      'en': '123 Main Street, Downtown, NY 10001',
      'ar': '',
    },
    'dyqfn8x9': {
      'en': 'Service Photos',
      'ar': '',
    },
    'awpadp04': {
      'en': 'Add Photo',
      'ar': '',
    },
    'zdajofdu': {
      'en': 'Save Changes',
      'ar': '',
    },
    'cnt4nbhl': {
      'en': 'Delete Service',
      'ar': '',
    },
  },
  // ServiceBooking
  {
    'nuk64je7': {
      'en': 'Deep House Cleaning Service',
      'ar': '',
    },
    't1z1hdxg': {
      'en': 'CleanPro Services',
      'ar': '',
    },
    'lnnxf1vp': {
      'en': '4.5 (127 reviews)',
      'ar': '',
    },
    '9bhwpsmw': {
      'en': 'Service Details',
      'ar': '',
    },
    'my6mdl2l': {
      'en':
          'Professional deep cleaning service for your entire home. Our experienced team uses eco-friendly products and advanced equipment to ensure every corner of your house is spotless. Includes kitchen deep clean, bathroom sanitization, floor mopping, dusting, and window cleaning.',
      'ar': '',
    },
    'ibb5dwuk': {
      'en': '\$89.99',
      'ar': '',
    },
    'x751pan1': {
      'en': '8 Years Experience',
      'ar': '',
    },
    '7qedk8ge': {
      'en': 'Book This Service',
      'ar': '',
    },
    'osyb60uh': {
      'en': 'Select Date',
      'ar': '',
    },
    'le3uxq30': {
      'en': 'Select Date',
      'ar': '',
    },
    'z0pwrmb0': {
      'en': 'Select Time',
      'ar': '',
    },
    '14zrdmv3': {
      'en': 'Select Time',
      'ar': '',
    },
    'p384nctq': {
      'en': 'Service Address',
      'ar': '',
    },
    'dn2ptqzw': {
      'en': 'Enter your address',
      'ar': '',
    },
    'xhdsidw0': {
      'en': '123 Main Street, Apartment 4B, New York, NY 10001',
      'ar': '',
    },
    'hr1ptvtm': {
      'en': 'Additional Notes (Optional)',
      'ar': '',
    },
    '2kq13q3t': {
      'en': 'Any special instructions or requirements...',
      'ar': '',
    },
    '8ta9z5mh': {
      'en': 'Payment Method',
      'ar': '',
    },
    '1wir3uyz': {
      'en': 'Pay on Service',
      'ar': '',
    },
    '7bspt6n4': {
      'en': 'Cash payment when service is completed',
      'ar': '',
    },
    '03nbks0e': {
      'en': 'Pay Now',
      'ar': '',
    },
    'vhaxfpv0': {
      'en': 'Secure online payment via card or e-wallet',
      'ar': '',
    },
    'uytyguxb': {
      'en': 'Book Service - \$89.99',
      'ar': '',
    },
    '1050b35p': {
      'en': 'Service Details',
      'ar': '',
    },
  },
  // MyBookingspage
  {
    'ndxvaaet': {
      'en': 'My Bookings',
      'ar': '',
    },
    'spaquk0b': {
      'en': 'Deep House Cleaning',
      'ar': '',
    },
    'ke0b7l3u': {
      'en': 'CleanPro Services',
      'ar': '',
    },
    'lt602oki': {
      'en': 'Dec 15, 2024 at 2:00 PM',
      'ar': '',
    },
    'po2i61p5': {
      'en': '\$120',
      'ar': '',
    },
    '7rjbnm6g': {
      'en': 'Confirmed',
      'ar': '',
    },
    'xuod5gqf': {
      'en': 'Office Cleaning',
      'ar': '',
    },
    'wqcnpr66': {
      'en': 'Sparkle Clean Co.',
      'ar': '',
    },
    'dqaj22ay': {
      'en': 'Dec 18, 2024 at 10:00 AM',
      'ar': '',
    },
    'gqq1pyup': {
      'en': '\$85',
      'ar': '',
    },
    'kos8u6qf': {
      'en': 'Pending Payment',
      'ar': '',
    },
    'wiwet3zj': {
      'en': 'Carpet Cleaning',
      'ar': '',
    },
    '3hwbie66': {
      'en': 'Fresh Clean Solutions',
      'ar': '',
    },
    'l3lvpy4p': {
      'en': 'Dec 10, 2024 at 3:30 PM',
      'ar': '',
    },
    'bbs224ki': {
      'en': '\$95',
      'ar': '',
    },
    'mxmhje9j': {
      'en': 'Completed',
      'ar': '',
    },
    '5vdcd1yp': {
      'en': 'Window Cleaning',
      'ar': '',
    },
    '1cel7cq5': {
      'en': 'Crystal Clear Windows',
      'ar': '',
    },
    '15m5o0pn': {
      'en': 'Dec 8, 2024 at 1:00 PM',
      'ar': '',
    },
    'yravohct': {
      'en': '\$65',
      'ar': '',
    },
    'cx0oye7h': {
      'en': 'Cancelled',
      'ar': '',
    },
  },
  // EmailVerification
  {
    '5pcwoqbv': {
      'en': 'CleanTouch',
      'ar': '',
    },
    'nbvr4vm3': {
      'en': 'Verify Your Email',
      'ar': '',
    },
    'iqztxm3c': {
      'en':
          'We\'ve sent a verification link to your email. Please check your inbox and click the link to continue.',
      'ar': '',
    },
    '8enk0o7h': {
      'en': 'Resend Email',
      'ar': '',
    },
    'ybt9n217': {
      'en':
          'Didn\'t receive the email? Check your spam folder or try resending.',
      'ar': '',
    },
  },
  // PaymentMethods
  {
    'ekvjt27r': {
      'en': 'Payment Method',
      'ar': '',
    },
    'kb676gp4': {
      'en': 'Choose how you want to pay',
      'ar': '',
    },
    'n5lqwxby': {
      'en': 'Credit/Debit Card',
      'ar': '',
    },
    'lbm774en': {
      'en': '**** **** **** 1234',
      'ar': '',
    },
    '7eeyltqi': {
      'en': 'Credit/Debit Card',
      'ar': '',
    },
    'mbre75wc': {
      'en': '**** **** **** 5678',
      'ar': '',
    },
    'q2p3bf04': {
      'en': 'Add New Card',
      'ar': '',
    },
    '4ztf0td2': {
      'en': 'Order Summary',
      'ar': '',
    },
    'cu9diw6e': {
      'en': 'House Cleaning Service',
      'ar': '',
    },
    'hytrym8d': {
      'en': '\$89.99',
      'ar': '',
    },
    'mn8y0bor': {
      'en': 'Service Fee',
      'ar': '',
    },
    'sk1ky9fs': {
      'en': '\$5.00',
      'ar': '',
    },
    '24hwyuwu': {
      'en': 'Total',
      'ar': '',
    },
    'ppncwv84': {
      'en': '\$94.99',
      'ar': '',
    },
    'rk7zo4ng': {
      'en': 'Pay Now',
      'ar': '',
    },
    'v9uwae8e': {
      'en': 'Payment',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '8bvqyiuq': {
      'en': '',
      'ar': '',
    },
    'xaa6v493': {
      'en': '',
      'ar': '',
    },
    'cfn2oewn': {
      'en': '',
      'ar': '',
    },
    '0lo2xk3y': {
      'en': '',
      'ar': '',
    },
    'mckcf56i': {
      'en': '',
      'ar': '',
    },
    'xih7d89l': {
      'en': '',
      'ar': '',
    },
    'dydfp88u': {
      'en': '',
      'ar': '',
    },
    'rckazjj7': {
      'en': '',
      'ar': '',
    },
    'o8gruepx': {
      'en': '',
      'ar': '',
    },
    'ieznzi0j': {
      'en': '',
      'ar': '',
    },
    '244ygb7b': {
      'en': '',
      'ar': '',
    },
    '9we499j9': {
      'en': '',
      'ar': '',
    },
    'xysn4ahz': {
      'en': '',
      'ar': '',
    },
    'by3vv4bs': {
      'en': '',
      'ar': '',
    },
    'b6ecfgeq': {
      'en': '',
      'ar': '',
    },
    'j8vn75bq': {
      'en': '',
      'ar': '',
    },
    '38atj8e3': {
      'en': '',
      'ar': '',
    },
    'z6ini0t1': {
      'en': '',
      'ar': '',
    },
    'tefj4lml': {
      'en': '',
      'ar': '',
    },
    'g69or4mv': {
      'en': '',
      'ar': '',
    },
    'ufi5ikya': {
      'en': '',
      'ar': '',
    },
    'psl3u08t': {
      'en': '',
      'ar': '',
    },
    '9w24y15p': {
      'en': '',
      'ar': '',
    },
    'fv795o0t': {
      'en': '',
      'ar': '',
    },
    '2opeofwt': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
