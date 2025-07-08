import 'package:amrajajabor_maps/app/constants/colors.dart';
import 'package:amrajajabor_maps/app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GoogleUserAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final String? displayName; // e.g. "John Doe"

  const GoogleUserAvatar({
    super.key,
    required this.imageUrl,
    this.displayName,
    this.size = 48.0,
  });

  bool get _hasValidImageUrl => imageUrl != null && imageUrl!.trim().isNotEmpty;

  bool get _hasDisplayName =>
      displayName != null && displayName!.trim().isNotEmpty;

  String _getInitial() {
    return displayName!.trim()[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasValidImageUrl) return _buildFallback();

    return ClipOval(
      child: Image.network(
        imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.lightGrey,
            highlightColor: THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.darkerGrey
                    : TColors.lightGrey,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFallback() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: TColors.lightGrey,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: _hasDisplayName
          ? Text(
              _getInitial(),
              style: TextStyle(
                fontSize: size * 0.6,
                fontWeight: FontWeight.bold,
                color: TColors.darkerGrey,
              ),
            )
          : Icon(Icons.account_circle, size: size, color: TColors.darkGrey),
    );
  }
}
