import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class LargeMetricText extends StatelessWidget {
  const LargeMetricText({
    required this.value,
    required this.label,
    this.color = AppColors.whiteText,
    this.fontSize = 86,
    super.key,
  });

  final String value;
  final String label;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            height: 0.92,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            letterSpacing: -3,
            shadows: [
              Shadow(color: color.withValues(alpha: 0.28), blurRadius: 22),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.mutedText,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}

class TargetProgressGauge extends StatelessWidget {
  const TargetProgressGauge({
    this.progress = 0.74,
    this.gapLabel = '추월까지 0.43km',
    super.key,
  });

  final double progress;
  final String gapLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('🎯', style: TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                '오늘의 타겟: 민수',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Text(
              gapLabel,
              style: const TextStyle(
                color: AppColors.mutedText,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        LayoutBuilder(
          builder: (context, constraints) {
            final x = constraints.maxWidth * progress;
            return SizedBox(
              height: 42,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 18,
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 18,
                    width: x,
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF668000), AppColors.neonLime],
                        ),
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.neonLime.withValues(alpha: 0.42),
                            blurRadius: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: math.max(0, x - 12),
                    top: -4,
                    child: const Text('🏃', style: TextStyle(fontSize: 24)),
                  ),
                  const Positioned(
                    right: 0,
                    top: -4,
                    child: Opacity(
                      opacity: 0.5,
                      child: Text('🚶', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class WeeklyCircleCalendar extends StatelessWidget {
  const WeeklyCircleCalendar({super.key});

  static const _days = [
    ('월', true, false),
    ('화', true, false),
    ('수', true, false),
    ('목', false, false),
    ('금', true, false),
    ('토', false, true),
    ('일', false, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final day in _days)
          Column(
            children: [
              Text(
                day.$1,
                style: const TextStyle(
                  color: AppColors.mutedText,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: day.$2 ? AppColors.neonLime : AppColors.card,
                  border: day.$3
                      ? Border.all(color: AppColors.neonLime, width: 2)
                      : Border.all(
                          color: day.$2 ? AppColors.neonLime : AppColors.border,
                        ),
                  boxShadow: day.$2
                      ? [
                          BoxShadow(
                            color: AppColors.neonLime.withValues(alpha: 0.28),
                            blurRadius: 12,
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  day.$2 ? '✓' : (day.$3 ? '🔥' : '-'),
                  style: TextStyle(
                    color: day.$2 ? AppColors.black : AppColors.neonLime,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class MiniRouteMap extends StatelessWidget {
  const MiniRouteMap({this.height = 190, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF101810), Color(0xFF050805)],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CustomPaint(
          painter: _RoutePainter(),
          child: Stack(
            children: [
              Positioned(
                left: 58,
                bottom: 48,
                child: _MapMarker(color: AppColors.neonLime),
              ),
              Positioned(
                right: 78,
                top: 36,
                child: _MapMarker(color: AppColors.redAlert),
              ),
              const Positioned(
                left: 18,
                bottom: 14,
                child: Text(
                  'MAP ROUTE',
                  style: TextStyle(
                    color: AppColors.neonLime,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  const _MapMarker({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteText,
        border: Border.all(color: color, width: 3),
        boxShadow: [BoxShadow(color: color, blurRadius: 12)],
      ),
    );
  }
}

class _RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.neonLime.withValues(alpha: 0.045)
      ..strokeWidth = 1;
    for (var x = 0.0; x < size.width; x += 34) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (var y = 0.0; y < size.height; y += 34) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final routePaint = Paint()
      ..color = AppColors.neonLime
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 4);

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.72)
      ..cubicTo(
        size.width * 0.35,
        size.height * 0.42,
        size.width * 0.52,
        size.height * 0.72,
        size.width * 0.7,
        size.height * 0.24,
      );
    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
