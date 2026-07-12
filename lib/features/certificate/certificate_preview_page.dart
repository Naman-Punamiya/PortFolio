import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/certificate_utils.dart';

class CertificatePreviewPage extends StatelessWidget {
  final CertificateUtils certificate;

  const CertificatePreviewPage({
    super.key,
    required this.certificate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black87,

      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: certificate.image,
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/${certificate.image}",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 30,
            right: 30,
            child: SafeArea(
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    certificate.title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "${certificate.issuer} • ${certificate.date}",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}