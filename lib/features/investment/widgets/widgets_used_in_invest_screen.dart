import 'package:flutter/material.dart';
import 'package:task/common/extensions/build_context.dart';
import 'dart:math' as math;
import 'package:task/common/theme/colors/color_scheme.dart';
import 'package:task/common/theme/theme_utils/basic_theme_elements.dart';
import 'package:task/gen/fonts.gen.dart';

class PortfolioCard extends StatelessWidget {
  final String title;
  final String riskLevel;
  final Color riskColor;
  final Color riskTextColor;
  final String balance;
  final String profitAmount;
  final Color profitColor;
  final String investment;
  final Color chartColor;
  final List<double> chartData;
  final bool isPositive;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.riskLevel,
    required this.riskColor,
    required this.riskTextColor,
    required this.balance,
    required this.profitAmount,
    required this.profitColor,
    required this.investment,
    required this.chartColor,
    required this.chartData,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(
          BaseTheme.padding * 1.25,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            BaseTheme.padding * 1.25,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: BaseTheme.unit * 1.5,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: riskColor,
                        borderRadius: BorderRadius.circular(
                          BaseTheme.unit,
                        ),
                      ),
                      child: Text(
                        riskLevel,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: riskTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: BaseTheme.unit,
                    ),
                    Text(
                      title,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: BaseTheme.padding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '﷼',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: BaseTheme.unit / 2,
                ),
                Text(
                  balance,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: BaseTheme.padding * 1.5,
            ),
            SizedBox(
              height: media.height * 0.2,
              child: CustomLineChart(
                data: chartData,
                color: chartColor,
              ),
            ),
            const SizedBox(height: 8),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'الأرباح',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF65686C),
                        ),
                      ),
                      const SizedBox(
                        width: BaseTheme.unit / 2,
                      ),
                      Text(
                        profitAmount,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: profitColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: BaseTheme.unit / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'الاستثمار الأولي',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF65686C),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        investment,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: awqafColorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'سحب',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: awqafColorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: BaseTheme.unit * 1.5,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          awqafColorScheme.secondary,
                          awqafColorScheme.secondary.withOpacity(0.9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'إيداع أموال',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: awqafColorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLineChart extends StatelessWidget {
  final List<double> data;
  final Color color;

  const CustomLineChart({
    super.key,
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            size: Size.infinite,
            painter: LineChartPainter(
              data: data,
              lineColor: color,
              fillColor: color.withOpacity(0.15),
            ),
          ),
        ),
        const SizedBox(
          height: BaseTheme.unit,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMonthLabel('يوليو'),
            _buildMonthLabel('أغسطس'),
            _buildMonthLabel('سبتمبر'),
            _buildMonthLabel('أكتوبر'),
            _buildMonthLabel('نوفمبر'),
            _buildMonthLabel('ديسمبر'),
          ],
        ),
      ],
    );
  }

  Widget _buildMonthLabel(String month) {
    return Text(
      month,
      style: const TextStyle(
        fontFamily: FontFamily.tryClother,
        fontSize: 12,
        color: Color(0xFF65686C),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;
  final Color fillColor;

  LineChartPainter({
    required this.data,
    required this.lineColor,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final dotPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    final whiteBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final maxValue = data.reduce(math.max);
    final minValue = data.reduce(math.min);
    final range = maxValue - minValue;

    final path = Path();
    final fillPath = Path();

    final stepX = size.width / (data.length - 1);

    fillPath.moveTo(0, size.height);

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final normalizedValue = (data[i] - minValue) / range;
      final y = size.height -
          (normalizedValue * size.height * 0.8 + size.height * 0.1);

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.lineTo(x, y);
      } else {
        final prevX = (i - 1) * stepX;
        final prevNormalizedValue = (data[i - 1] - minValue) / range;
        final prevY = size.height -
            (prevNormalizedValue * size.height * 0.8 + size.height * 0.1);

        final controlPointX = prevX + (x - prevX) / 2;

        path.quadraticBezierTo(controlPointX, prevY, x, y);
        fillPath.quadraticBezierTo(controlPointX, prevY, x, y);
      }
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);

    canvas.drawPath(path, paint);

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final normalizedValue = (data[i] - minValue) / range;
      final y = size.height -
          (normalizedValue * size.height * 0.8 + size.height * 0.1);

      canvas.drawCircle(Offset(x, y), 4, whiteBorderPaint);
      canvas.drawCircle(Offset(x, y), 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(LineChartPainter oldDelegate) => false;
}
