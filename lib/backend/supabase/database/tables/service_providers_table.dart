import '../database.dart';

class ServiceProvidersTable extends SupabaseTable<ServiceProvidersRow> {
  @override
  String get tableName => 'service_providers';

  @override
  ServiceProvidersRow createRow(Map<String, dynamic> data) => ServiceProvidersRow(data);
}

class ServiceProvidersRow extends SupabaseDataRow {
  ServiceProvidersRow(super.data);

  @override
  SupabaseTable get table => ServiceProvidersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get passwordHash => getField<String>('password_hash')!;
  set passwordHash(String value) => setField<String>('password_hash', value);

  String get fullName => getField<String>('full_name')!;
  set fullName(String value) => setField<String>('full_name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get profileImageUrl => getField<String>('profile_image_url');
  set profileImageUrl(String? value) => setField<String>('profile_image_url', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double get rating => getField<double>('rating') ?? 0.0;
  set rating(double value) => setField<double>('rating', value);

  int get totalReviews => getField<int>('total_reviews') ?? 0;
  set totalReviews(int value) => setField<int>('total_reviews', value);

  bool get isVerified => getField<bool>('is_verified') ?? false;
  set isVerified(bool value) => setField<bool>('is_verified', value);

  bool get isActive => getField<bool>('is_active') ?? true;
  set isActive(bool value) => setField<bool>('is_active', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}

