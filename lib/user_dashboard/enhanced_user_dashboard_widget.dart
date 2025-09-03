import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_theme_enhanced.dart';
import '../components/service_card_widget.dart';
import '../components/category_card_widget.dart';
import '../services/database_service.dart';
import '../services/navigation_service.dart';
import '../backend/supabase/database/database.dart';

class EnhancedUserDashboardWidget extends StatefulWidget {
  const EnhancedUserDashboardWidget({super.key});

  @override
  State<EnhancedUserDashboardWidget> createState() => _EnhancedUserDashboardWidgetState();
}

class _EnhancedUserDashboardWidgetState extends State<EnhancedUserDashboardWidget> {
  final TextEditingController _searchController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();
  
  List<ServicesRow> _services = [];
  List<ServiceProvidersRow> _providers = [];
  List<String> _categories = [
    'House Cleaning',
    'Office Cleaning',
    'Carpet Cleaning',
    'Window Cleaning',
    'Deep Cleaning',
    'Move-in/Move-out Cleaning'
  ];
  
  String _selectedCategory = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    
    try {
      final services = await _databaseService.getAllServices();
      final providers = await _databaseService.getAllServiceProviders();
      
      setState(() {
        _services = services;
        _providers = providers;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        NavigationService.showErrorSnackBar(context, 'Failed to load data: $e');
      }
    }
  }

  Future<void> _searchServices(String query) async {
    if (query.isEmpty) {
      _loadData();
      return;
    }
    
    try {
      final services = await _databaseService.searchServices(query);
      setState(() => _services = services);
    } catch (e) {
      NavigationService.showErrorSnackBar(context, 'Search failed: $e');
    }
  }

  Future<void> _filterByCategory(String category) async {
    setState(() => _selectedCategory = category);
    
    if (category.isEmpty) {
      _loadData();
      return;
    }
    
    try {
      final services = await _databaseService.getServicesByCategory(category);
      setState(() => _services = services);
    } catch (e) {
      NavigationService.showErrorSnackBar(context, 'Filter failed: $e');
    }
  }

  ServiceProvidersRow? _getProviderForService(ServicesRow service) {
    try {
      return _providers.firstWhere((provider) => provider.id == service.providerId);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CleanTouchTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: CleanTouchTheme.primaryWhite,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: CleanTouchTheme.textPrimary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Image.asset(
          'assets/images/clean_touch_logo.png',
          height: 40,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: CleanTouchTheme.textPrimary),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: CleanTouchTheme.textPrimary),
            onPressed: () => NavigationService.navigateToProfileSettings(context),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: RefreshIndicator(
        onRefresh: _loadData,
        color: CleanTouchTheme.primaryTurquoise,
        child: CustomScrollView(
          slivers: [
            // Welcome Section
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: CleanTouchTheme.primaryGradient,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      style: CleanTouchTheme.headingLarge.copyWith(
                        color: CleanTouchTheme.textLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Find the perfect cleaning service for your needs',
                      style: CleanTouchTheme.bodyLarge.copyWith(
                        color: CleanTouchTheme.textLight.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Search Bar
                    Container(
                      decoration: BoxDecoration(
                        color: CleanTouchTheme.primaryWhite,
                        borderRadius: CleanTouchTheme.mediumRadius,
                        boxShadow: const [CleanTouchTheme.cardShadow],
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _searchServices,
                        decoration: CleanTouchTheme.getInputDecoration(
                          hintText: 'Search for cleaning services...',
                          prefixIcon: Icon(Icons.search, color: CleanTouchTheme.primaryTurquoise),
                        ).copyWith(
                          border: OutlineInputBorder(
                            borderRadius: CleanTouchTheme.mediumRadius,
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: CleanTouchTheme.mediumRadius,
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: CleanTouchTheme.mediumRadius,
                            borderSide: const BorderSide(color: CleanTouchTheme.primaryTurquoise, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Categories Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service Categories',
                      style: CleanTouchTheme.headingMedium,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          return SizedBox(
                            width: 100,
                            child: CategoryCardWidget(
                              title: category,
                              isSelected: _selectedCategory == category,
                              onTap: () => _filterByCategory(
                                _selectedCategory == category ? '' : category,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Services Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedCategory.isEmpty 
                          ? 'Available Services' 
                          : _selectedCategory,
                      style: CleanTouchTheme.headingMedium,
                    ),
                    if (_selectedCategory.isNotEmpty)
                      TextButton(
                        onPressed: () => _filterByCategory(''),
                        child: Text(
                          'View All',
                          style: CleanTouchTheme.bodyMedium.copyWith(
                            color: CleanTouchTheme.primaryTurquoise,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            
            // Services List
            if (_isLoading)
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: CircularProgressIndicator(
                      color: CleanTouchTheme.primaryTurquoise,
                    ),
                  ),
                ),
              )
            else if (_services.isEmpty)
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: CleanTouchTheme.textSecondary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No services found',
                          style: CleanTouchTheme.headingSmall.copyWith(
                            color: CleanTouchTheme.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your search or filters',
                          style: CleanTouchTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final service = _services[index];
                    final provider = _getProviderForService(service);
                    
                    if (provider == null) return const SizedBox.shrink();
                    
                    return ServiceCardWidget(
                      service: service,
                      provider: provider,
                      onTap: () {
                        // TODO: Navigate to service details
                      },
                      onBookNow: () {
                        NavigationService.navigateToServiceBooking(context, service.id);
                      },
                    );
                  },
                  childCount: _services.length,
                ),
              ),
            
            // Bottom padding
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Quick booking or emergency service
        },
        backgroundColor: CleanTouchTheme.primaryOrange,
        icon: const Icon(Icons.flash_on, color: CleanTouchTheme.textLight),
        label: Text(
          'Quick Book',
          style: CleanTouchTheme.buttonText.copyWith(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: CleanTouchTheme.primaryWhite,
      child: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: CleanTouchTheme.primaryGradient,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: CleanTouchTheme.primaryWhite,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: CleanTouchTheme.primaryTurquoise,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'John Smith',
                    style: CleanTouchTheme.headingSmall.copyWith(
                      color: CleanTouchTheme.textLight,
                    ),
                  ),
                  Text(
                    'john.smith@email.com',
                    style: CleanTouchTheme.bodyMedium.copyWith(
                      color: CleanTouchTheme.textLight.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildDrawerItem(
                    icon: Icons.home_outlined,
                    title: 'Dashboard',
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    icon: Icons.bookmark_outline,
                    title: 'My Bookings',
                    onTap: () => NavigationService.navigateToMyBookings(context),
                  ),
                  _buildDrawerItem(
                    icon: Icons.person_outline,
                    title: 'Profile Settings',
                    onTap: () => NavigationService.navigateToProfileSettings(context),
                  ),
                  _buildDrawerItem(
                    icon: Icons.payment_outlined,
                    title: 'Payment Methods',
                    onTap: () => NavigationService.navigateToPaymentMethods(context),
                  ),
                  _buildDrawerItem(
                    icon: Icons.language_outlined,
                    title: 'Language',
                    onTap: () => NavigationService.navigateToLanguageSelection(context),
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    icon: Icons.policy_outlined,
                    title: 'Refund Policy',
                    onTap: () => NavigationService.navigateToRefundPolicy(context),
                  ),
                  _buildDrawerItem(
                    icon: Icons.support_agent_outlined,
                    title: 'Contact Support',
                    onTap: () {
                      // TODO: Open WhatsApp or support chat
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.logout_outlined,
                    title: 'Logout',
                    onTap: () {
                      // TODO: Implement logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: CleanTouchTheme.textSecondary),
      title: Text(
        title,
        style: CleanTouchTheme.bodyLarge,
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: CleanTouchTheme.smallRadius,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

