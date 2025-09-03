import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import '/flutter_flow/flutter_flow_util.dart';

export 'database/database.dart';

<<<<<<< HEAD
String _kSupabaseUrl = 'https://tsoylkbwzaquxdbylngz.supabase.co';
=======
String _kSupabaseUrl = 'sb_secret_Pl_x4R5zAZMuousF2pHHHQ_I-0JQkVE';
>>>>>>> 637a25698e29cf4ed501d08d19b553933cf724dc
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzb3lsa2J3emFxdXhkYnlsbmd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY1NjkxMDEsImV4cCI6MjA3MjE0NTEwMX0.rxLEShXJcqI7nqlk6aRQRgzttcANad01BH1_c-ZeilQ';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        headers: {
          'X-Client-Info': 'flutterflow',
        },
        anonKey: _kSupabaseAnonKey,
        debug: false,
        authOptions:
            FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
