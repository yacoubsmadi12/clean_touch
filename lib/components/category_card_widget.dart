import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme_enhanced.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String? description;
  final String? iconPath;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryCardWidget({
    Key? key,
    required this.title,
    this.description,
    this.iconPath,
    this.icon,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: CleanTouchTheme.mediumRadius,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected 
                  ? CleanTouchTheme.primaryTurquoise.withOpacity(0.1)
                  : CleanTouchTheme.surfaceLight,
              borderRadius: CleanTouchTheme.mediumRadius,
              border: Border.all(
                color: isSelected 
                    ? CleanTouchTheme.primaryTurquoise
                    : const Color(0xFFE0E0E0),
                width: isSelected ? 2 : 1,
              ),
              boxShadow: isSelected 
                  ? [
                      BoxShadow(
                        color: CleanTouchTheme.primaryTurquoise.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : [CleanTouchTheme.cardShadow],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? CleanTouchTheme.primaryTurquoise.withOpacity(0.2)
                        : CleanTouchTheme.backgroundLight,
                    borderRadius: CleanTouchTheme.mediumRadius,
                  ),
                  child: iconPath != null
                      ? Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            iconPath!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Icon(
                          icon ?? Icons.cleaning_services,
                          size: 32,
                          color: isSelected 
                              ? CleanTouchTheme.primaryTurquoise
                              : CleanTouchTheme.textSecondary,
                        ),
                ),
                const SizedBox(height: 12),
                // Title
                Text(
                  title,
                  style: CleanTouchTheme.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected 
                        ? CleanTouchTheme.primaryTurquoise
                        : CleanTouchTheme.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Description
                if (description != null && description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: CleanTouchTheme.bodySmall,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

