import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme_enhanced.dart';
import '../backend/supabase/database/database.dart';

class ServiceCardWidget extends StatelessWidget {
  final ServicesRow service;
  final ServiceProvidersRow provider;
  final VoidCallback? onTap;
  final VoidCallback? onBookNow;

  const ServiceCardWidget({
    Key? key,
    required this.service,
    required this.provider,
    this.onTap,
    this.onBookNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: CleanTouchTheme.serviceProviderCardDecoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: CleanTouchTheme.largeRadius,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Image and Provider Info Row
                Row(
                  children: [
                    // Service Image
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: CleanTouchTheme.mediumRadius,
                        color: CleanTouchTheme.backgroundLight,
                        image: service.imageUrl != null
                            ? DecorationImage(
                                image: NetworkImage(service.imageUrl!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: service.imageUrl == null
                          ? Icon(
                              Icons.cleaning_services,
                              size: 40,
                              color: CleanTouchTheme.primaryTurquoise,
                            )
                          : null,
                    ),
                    const SizedBox(width: 16),
                    // Service and Provider Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Service Title
                          Text(
                            service.title,
                            style: CleanTouchTheme.headingSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          // Provider Name
                          Text(
                            provider.businessName ?? provider.fullName,
                            style: CleanTouchTheme.bodyMedium.copyWith(
                              color: CleanTouchTheme.primaryTurquoise,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Rating and Reviews
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: CleanTouchTheme.primaryOrange,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                provider.rating.toStringAsFixed(1),
                                style: CleanTouchTheme.bodySmall.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '(${provider.totalReviews})',
                                style: CleanTouchTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Service Description
                if (service.description != null && service.description!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      service.description!,
                      style: CleanTouchTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                // Price and Duration Row
                Row(
                  children: [
                    // Price
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: CleanTouchTheme.primaryTurquoise.withOpacity(0.1),
                        borderRadius: CleanTouchTheme.smallRadius,
                      ),
                      child: Text(
                        '${service.price.toStringAsFixed(0)} JOD',
                        style: CleanTouchTheme.bodyMedium.copyWith(
                          color: CleanTouchTheme.primaryTurquoise,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Duration
                    if (service.durationMinutes != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: CleanTouchTheme.primaryOrange.withOpacity(0.1),
                          borderRadius: CleanTouchTheme.smallRadius,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: CleanTouchTheme.primaryOrange,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${service.durationMinutes} min',
                              style: CleanTouchTheme.bodySmall.copyWith(
                                color: CleanTouchTheme.primaryOrange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                    // Book Now Button
                    ElevatedButton(
                      onPressed: onBookNow,
                      style: CleanTouchTheme.primaryButtonStyle.copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ),
                      child: Text(
                        'Book Now',
                        style: CleanTouchTheme.buttonText.copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

