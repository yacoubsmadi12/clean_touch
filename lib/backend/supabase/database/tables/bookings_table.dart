import '../database.dart';

class BookingsTable extends SupabaseTable<BookingsRow> {
  @override
  String get tableName => 'bookings';

  @override
  BookingsRow createRow(Map<String, dynamic> data) => BookingsRow(data);
}

class BookingsRow extends SupabaseDataRow {
  BookingsRow(super.data);

  @override
  SupabaseTable get table => BookingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get serviceId => getField<String>('service_id')!;
  set serviceId(String value) => setField<String>('service_id', value);

  String get providerId => getField<String>('provider_id')!;
  set providerId(String value) => setField<String>('provider_id', value);

  DateTime get bookingDate => getField<DateTime>('booking_date')!;
  set bookingDate(DateTime value) => setField<DateTime>('booking_date', value);

  PostgresTime get bookingTime => getField<PostgresTime>('booking_time')!;
  set bookingTime(PostgresTime value) => setField<PostgresTime>('booking_time', value);

  String get status => getField<String>('status') ?? 'pending';
  set status(String value) => setField<String>('status', value);

  double get totalPrice => getField<double>('total_price')!;
  set totalPrice(double value) => setField<double>('total_price', value);

  String? get customerAddress => getField<String>('customer_address');
  set customerAddress(String? value) => setField<String>('customer_address', value);

  String? get specialInstructions => getField<String>('special_instructions');
  set specialInstructions(String? value) => setField<String>('special_instructions', value);

  String get paymentStatus => getField<String>('payment_status') ?? 'pending';
  set paymentStatus(String value) => setField<String>('payment_status', value);

  String? get paymentMethod => getField<String>('payment_method');
  set paymentMethod(String? value) => setField<String>('payment_method', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}

