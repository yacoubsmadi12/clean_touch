import '../backend/supabase/database/database.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  // Table instances
  final UsersTable _usersTable = UsersTable();
  final ServiceProvidersTable _serviceProvidersTable = ServiceProvidersTable();
  final ServicesTable _servicesTable = ServicesTable();
  final BookingsTable _bookingsTable = BookingsTable();

  // User operations
  Future<List<UsersRow>> getAllUsers() async {
    return await _usersTable.queryRows(
      queryFn: (query) => query,
    );
  }

  Future<UsersRow?> getUserById(String userId) async {
    final users = await _usersTable.querySingleRow(
      queryFn: (query) => query.eq('id', userId),
    );
    return users.isNotEmpty ? users.first : null;
  }

  Future<UsersRow?> getUserByEmail(String email) async {
    final users = await _usersTable.querySingleRow(
      queryFn: (query) => query.eq('email', email),
    );
    return users.isNotEmpty ? users.first : null;
  }

  Future<UsersRow> createUser(Map<String, dynamic> userData) async {
    return await _usersTable.insert(userData);
  }

  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    await _usersTable.update(
      data: userData,
      matchingRows: (query) => query.eq('id', userId),
    );
  }

  // Service Provider operations
  Future<List<ServiceProvidersRow>> getAllServiceProviders() async {
    return await _serviceProvidersTable.queryRows(
      queryFn: (query) => query.eq('is_active', true),
    );
  }

  Future<ServiceProvidersRow?> getServiceProviderById(String providerId) async {
    final providers = await _serviceProvidersTable.querySingleRow(
      queryFn: (query) => query.eq('id', providerId),
    );
    return providers.isNotEmpty ? providers.first : null;
  }

  Future<List<ServiceProvidersRow>> getNearbyServiceProviders({
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  }) async {
    // Note: This is a simplified version. In production, you'd use PostGIS functions
    return await _serviceProvidersTable.queryRows(
      queryFn: (query) => query
          .eq('is_active', true)
          .not('latitude', 'is', null)
          .not('longitude', 'is', null),
    );
  }

  Future<ServiceProvidersRow> createServiceProvider(Map<String, dynamic> providerData) async {
    return await _serviceProvidersTable.insert(providerData);
  }

  Future<void> updateServiceProvider(String providerId, Map<String, dynamic> providerData) async {
    await _serviceProvidersTable.update(
      data: providerData,
      matchingRows: (query) => query.eq('id', providerId),
    );
  }

  // Service operations
  Future<List<ServicesRow>> getAllServices() async {
    return await _servicesTable.queryRows(
      queryFn: (query) => query.eq('is_active', true),
    );
  }

  Future<List<ServicesRow>> getServicesByProvider(String providerId) async {
    return await _servicesTable.queryRows(
      queryFn: (query) => query
          .eq('provider_id', providerId)
          .eq('is_active', true),
    );
  }

  Future<List<ServicesRow>> getServicesByCategory(String category) async {
    return await _servicesTable.queryRows(
      queryFn: (query) => query
          .eq('category', category)
          .eq('is_active', true),
    );
  }

  Future<ServicesRow?> getServiceById(String serviceId) async {
    final services = await _servicesTable.querySingleRow(
      queryFn: (query) => query.eq('id', serviceId),
    );
    return services.isNotEmpty ? services.first : null;
  }

  Future<ServicesRow> createService(Map<String, dynamic> serviceData) async {
    return await _servicesTable.insert(serviceData);
  }

  Future<void> updateService(String serviceId, Map<String, dynamic> serviceData) async {
    await _servicesTable.update(
      data: serviceData,
      matchingRows: (query) => query.eq('id', serviceId),
    );
  }

  Future<void> deleteService(String serviceId) async {
    await _servicesTable.update(
      data: {'is_active': false},
      matchingRows: (query) => query.eq('id', serviceId),
    );
  }

  // Booking operations
  Future<List<BookingsRow>> getAllBookings() async {
    return await _bookingsTable.queryRows(
      queryFn: (query) => query,
    );
  }

  Future<List<BookingsRow>> getBookingsByUser(String userId) async {
    return await _bookingsTable.queryRows(
      queryFn: (query) => query.eq('user_id', userId),
    );
  }

  Future<List<BookingsRow>> getBookingsByProvider(String providerId) async {
    return await _bookingsTable.queryRows(
      queryFn: (query) => query.eq('provider_id', providerId),
    );
  }

  Future<List<BookingsRow>> getBookingsByStatus(String status) async {
    return await _bookingsTable.queryRows(
      queryFn: (query) => query.eq('status', status),
    );
  }

  Future<BookingsRow?> getBookingById(String bookingId) async {
    final bookings = await _bookingsTable.querySingleRow(
      queryFn: (query) => query.eq('id', bookingId),
    );
    return bookings.isNotEmpty ? bookings.first : null;
  }

  Future<BookingsRow> createBooking(Map<String, dynamic> bookingData) async {
    return await _bookingsTable.insert(bookingData);
  }

  Future<void> updateBooking(String bookingId, Map<String, dynamic> bookingData) async {
    await _bookingsTable.update(
      data: bookingData,
      matchingRows: (query) => query.eq('id', bookingId),
    );
  }

  Future<void> updateBookingStatus(String bookingId, String status) async {
    await _bookingsTable.update(
      data: {
        'status': status,
        'updated_at': DateTime.now().toIso8601String(),
      },
      matchingRows: (query) => query.eq('id', bookingId),
    );
  }

  // Search operations
  Future<List<ServicesRow>> searchServices(String searchTerm) async {
    return await _servicesTable.queryRows(
      queryFn: (query) => query
          .or('title.ilike.%$searchTerm%,description.ilike.%$searchTerm%')
          .eq('is_active', true),
    );
  }

  Future<List<ServiceProvidersRow>> searchServiceProviders(String searchTerm) async {
    return await _serviceProvidersTable.queryRows(
      queryFn: (query) => query
          .or('full_name.ilike.%$searchTerm%,business_name.ilike.%$searchTerm%')
          .eq('is_active', true),
    );
  }

  // Statistics operations
  Future<Map<String, dynamic>> getProviderStats(String providerId) async {
    final bookings = await getBookingsByProvider(providerId);
    final completedBookings = bookings.where((b) => b.status == 'completed').toList();
    final totalRevenue = completedBookings.fold<double>(
      0.0,
      (sum, booking) => sum + booking.totalPrice,
    );

    return {
      'total_bookings': bookings.length,
      'completed_bookings': completedBookings.length,
      'total_revenue': totalRevenue,
      'pending_bookings': bookings.where((b) => b.status == 'pending').length,
      'in_progress_bookings': bookings.where((b) => b.status == 'in_progress').length,
    };
  }

  Future<Map<String, dynamic>> getUserStats(String userId) async {
    final bookings = await getBookingsByUser(userId);
    final completedBookings = bookings.where((b) => b.status == 'completed').toList();
    final totalSpent = completedBookings.fold<double>(
      0.0,
      (sum, booking) => sum + booking.totalPrice,
    );

    return {
      'total_bookings': bookings.length,
      'completed_bookings': completedBookings.length,
      'total_spent': totalSpent,
      'pending_bookings': bookings.where((b) => b.status == 'pending').length,
      'cancelled_bookings': bookings.where((b) => b.status == 'cancelled').length,
    };
  }
}

