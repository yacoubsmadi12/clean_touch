import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  // Navigation methods for different user flows

  // Authentication flow
  static void navigateToLogin(BuildContext context) {
    context.go('/login');
  }

  static void navigateToSignUp(BuildContext context,
      {bool isServiceProvider = false}) {
    if (isServiceProvider) {
      context.go('/signUpServiceProvider');
    } else {
      context.go('/signUpUser');
    }
  }

  static void navigateToEmailVerification(BuildContext context) {
    context.go('/emailVerification');
  }

  static void navigateToWelcome(BuildContext context) {
    context.go('/welcome');
  }

  // Main dashboards
  static void navigateToUserDashboard(BuildContext context) {
    context.go('/userDashboard');
  }

  static void navigateToServiceProviderDashboard(BuildContext context) {
    context.go('/serviceProviderDashboard');
  }

  // Service management
  static void navigateToAddService(BuildContext context) {
    context.go('/addservice');
  }

  static void navigateToEditService(BuildContext context, String serviceId) {
    context.go('/editService/$serviceId');
  }

  // Booking flow
  static void navigateToServiceBooking(BuildContext context, String serviceId) {
    context.go('/serviceBooking/$serviceId');
  }

  static void navigateToBookingConfirmation(
      BuildContext context, String bookingId) {
    context.go('/bookingConfirmation/$bookingId');
  }

  static void navigateToMyBookings(BuildContext context) {
    context.go('/myBookings');
  }

  // Profile and settings
  static void navigateToProfileSettings(BuildContext context) {
    context.go('/profileSettings');
  }

  static void navigateToChangePassword(BuildContext context) {
    context.go('/changePassword');
  }

  // Provider specific pages
  static void navigateToOrders(BuildContext context) {
    context.go('/orders');
  }

  static void navigateToEarnings(BuildContext context) {
    context.go('/earnings');
  }

  // Utility pages
  static void navigateToLanguageSelection(BuildContext context) {
    context.go('/languageSelection');
  }

  static void navigateToRefundPolicy(BuildContext context) {
    context.go('/refundPolicy');
  }

  static void navigateToPolice(BuildContext context) {
    context.go('/police');
  }

  static void navigateToPaymentMethods(BuildContext context) {
    context.go('/paymentMethods');
  }

  // Helper methods for navigation with parameters
  static void navigateWithReplacement(BuildContext context, String route) {
    context.pushReplacement(route);
  }

  static void navigateAndClearStack(BuildContext context, String route) {
    context.go(route);
  }

  static void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }

  // Show dialogs and bottom sheets
  static Future<T?> showCustomDialog<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }

  static Future<T?> showCustomBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  }

  // Snackbar helpers
  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static void showInfoSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
