import 'package:task/common/theme/colors/color_scheme.dart';
import 'package:task/features/investment/view/investment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/features/widgets%20/nav_bar_item.dart';
import '../../../blocs/landing/landing_bloc.dart';
import '../../home/view/home_view.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  void initState() {
    super.initState();
  }

  void onItemTapped(int index) {
    context.read<LandingBloc>().add(TabChangeRequested(
          tab: LandingScreenTab.values[index],
          tabIndex: index,
        ));
  }

  List<Widget> screens = [
    const AwqafHomeView(),
    const InvestmentPortfoliosScreen(),
    const AwqafHomeView(),
    const AwqafHomeView(),
    const AwqafHomeView(),
  ];

  List<KNavBarItemData> navBarItems(BuildContext context) => [
        const KNavBarItemData(
          assetName: RemixIcons.home_5_line,
          labelName: "الرئيسية",
        ),
        const KNavBarItemData(
          assetName: RemixIcons.bar_chart_line,
          labelName: "العمليات",
        ),
        const KNavBarItemData(
          assetName: RemixIcons.add_line,
          labelName: "",
        ),
        const KNavBarItemData(
          assetName: RemixIcons.wallet_3_line,
          labelName: "المحفظة",
        ),
        const KNavBarItemData(
          assetName: RemixIcons.settings_3_line,
          labelName: "الإعدادات",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingBloc, LandingState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: screens.elementAt(state.currentTabIndex),
            bottomNavigationBar: _CustomBottomNavBar(
              currentIndex: state.currentTabIndex,
              onTap: onItemTapped,
              navBarItems: navBarItems(context),
            ),
          ),
        );
      },
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<KNavBarItemData> navBarItems;

  const _CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.navBarItems,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // Bottom Navigation Bar Container
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: awqafColorScheme.surface, // Use color scheme
            boxShadow: [
              BoxShadow(
                color: awqafColorScheme.shadow, // Use color scheme
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(context, 0),
                _buildNavItem(context, 1),
                const SizedBox(width: 10),
                _buildNavItem(context, 3),
                _buildNavItem(context, 4),
              ],
            ),
          ),
        ),
        // Floating Action Button
        Positioned(
          bottom: 65,
          child: GestureDetector(
            onTap: () => onTap(2),
            child: Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                color: awqafColorScheme.surface, // Use color scheme
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        awqafColorScheme.primaryContainer,
                        awqafColorScheme.surfaceTint,
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: awqafColorScheme.surfaceTint.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add,
                    color: awqafColorScheme.onPrimary,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, int index) {
    final isActive = currentIndex == index;
    final item = navBarItems[index];

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.assetName,
              size: 24,
              color: isActive
                  ? awqafColorScheme.surfaceTint
                  : awqafColorScheme.outline,
            ),
            const SizedBox(height: 4),
            Text(
              item.labelName,
              style: GoogleFonts.cairo(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive
                    ? awqafColorScheme.surfaceTint
                    : awqafColorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
