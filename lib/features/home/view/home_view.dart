// lib/views/awqaf_home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/common/extensions/build_context.dart';
import 'package:task/common/theme/colors/color_scheme.dart';
import 'package:task/common/theme/theme_utils/basic_theme_elements.dart';
import 'package:task/features/home/view/widget/widget_used_in_home.dart';

class AwqafHomeView extends StatelessWidget {
  const AwqafHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: awqafColorScheme.primary,
        body: Stack(
          children: [
            // 🔹 Blue Gradient Background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    awqafColorScheme.primaryContainer,
                    awqafColorScheme.primary
                  ],
                ),
              ),
            ),
            // 🔹 Top Bar with Logo and Notification Icon
            Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: BaseTheme.padding,
                    vertical: BaseTheme.unit,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/white.svg',
                        height: 44,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                              BaseTheme.unit,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Positioned(
                            top: -media.height * 0.0010,
                            right: -media.width * 0.015,
                            child: Container(
                              width: 18,
                              height: 18,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '1',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 🔹 White Rounded Sheet
            Positioned(
              top: media.height * 0.32,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: awqafColorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    BaseTheme.padding,
                    BaseTheme.unit * 3,
                    BaseTheme.padding,
                    BaseTheme.unit * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: media.height * 0.12),
                      const WalletsSection(),
                      SizedBox(height: media.height * 0.04),
                      const RecentTransactions(),
                      SizedBox(height: media.height * 0.02),
                    ],
                  ),
                ),
              ),
            ),

            // 🔹 Balance Card
            Positioned(
              top: media.height * 0.20,
              left: BaseTheme.padding,
              right: BaseTheme.padding,
              child: Container(
                decoration: BoxDecoration(
                  color: awqafColorScheme.inverseSurface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: awqafColorScheme.shadow,
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(
                  BaseTheme.padding,
                ),
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'إجمالي الحيازات (3)',
                            style: context.textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.help_outline,
                            color: awqafColorScheme.outline,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: BaseTheme.padding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '﷼',
                          style: GoogleFonts.cairo(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: awqafColorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(
                          width: BaseTheme.padding,
                        ),
                        Text(
                          '518.27',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: awqafColorScheme.onSurface,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: BaseTheme.padding,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Row(
                        children: [
                          Container(
                            width: media.width * 0.12,
                            height: media.height * 0.008,
                            color: awqafColorScheme.secondary,
                          ),
                          Expanded(
                            child: Container(
                              height: media.height * 0.008,
                              color: awqafColorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: BaseTheme.padding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BalanceColumn(
                          title: 'العوائد % 3.80',
                          amount: '19.02',
                          color: awqafColorScheme.tertiary,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: BalanceColumn(
                            title: 'إجمالي الاستثمار',
                            amount: '499.26',
                            color: awqafColorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
