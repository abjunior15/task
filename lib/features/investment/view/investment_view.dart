import 'package:flutter/material.dart';
import 'package:task/common/extensions/build_context.dart';
import 'package:task/common/theme/colors/color_scheme.dart';
import 'package:task/common/theme/theme_utils/basic_theme_elements.dart';
import 'package:task/features/investment/widgets/widgets_used_in_invest_screen.dart';

class InvestmentPortfoliosScreen extends StatefulWidget {
  const InvestmentPortfoliosScreen({super.key});

  @override
  State<InvestmentPortfoliosScreen> createState() =>
      _InvestmentPortfoliosScreenState();
}

class _InvestmentPortfoliosScreenState
    extends State<InvestmentPortfoliosScreen> {
  int selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: awqafColorScheme.primary,
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                  BaseTheme.padding,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: media.width * 0.1,
                          height: media.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const Center(
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              Positioned(
                                top: -media.height * 0.0010,
                                right: -media.width * 0.005,
                                child: Container(
                                  width: media.width * 0.04,
                                  height: media.width * 0.04,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: context.textTheme.labelSmall
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'المحافظ الاستثمارية',
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: BaseTheme.padding,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildTabButton('مغلق', 0),
                          ),
                          const SizedBox(
                            width: BaseTheme.unit,
                          ),
                          Expanded(
                            child: _buildTabButton('نشط', 1),
                          ),
                          const SizedBox(
                            width: BaseTheme.unit,
                          ),
                          Expanded(
                            child: _buildTabButton('الكل', 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: BaseTheme.padding,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: awqafColorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            BaseTheme.padding * 1.5,
                          ),
                          topRight: Radius.circular(
                            BaseTheme.padding * 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(
                        BaseTheme.padding,
                        0,
                        BaseTheme.padding,
                        BaseTheme.padding * 6.25,
                      ),
                      children: const [
                        PortfolioCard(
                          title: 'صندوق الوقف أ',
                          riskLevel: 'محافظ عالية',
                          riskColor: Color(0xFFFFE5E5),
                          riskTextColor: Color(0xFFFF3B30),
                          balance: '12,345,678',
                          profitAmount: '+120.42 (1.05%)',
                          profitColor: Color(0xFF34C759),
                          investment: '5.250.00',
                          chartColor: Color(0xFF34C759),
                          chartData: [3, 4, 3.5, 5, 4, 5.5, 5],
                          isPositive: true,
                        ),
                        SizedBox(
                          height: BaseTheme.padding,
                        ),
                        PortfolioCard(
                          title: 'صندوق الوقف ب',
                          riskLevel: 'محافظ معتدلة',
                          riskColor: Color(0xFFFFF3E0),
                          riskTextColor: Color(0xFFFF9500),
                          balance: '945,678',
                          profitAmount: '+3.042 (1.2%)',
                          profitColor: Color(0xFF34C759),
                          investment: '5.250.00',
                          chartColor: Color(0xFF34C759),
                          chartData: [3, 4.5, 4, 5, 4.5, 5.2, 5.5],
                          isPositive: true,
                        ),
                        SizedBox(
                          height: BaseTheme.padding,
                        ),
                        PortfolioCard(
                          title: 'صندوق الوقف ج',
                          riskLevel: 'محافظ منخفضة',
                          riskColor: Color(0xFFE8F5E9),
                          riskTextColor: Color(0xFF34C759),
                          balance: '9,378',
                          profitAmount: '-042 (0.13%)',
                          profitColor: Color(0xFFFF3B30),
                          investment: '5.250.00',
                          chartColor: Color(0xFFFF3B30),
                          chartData: [5, 4.5, 4.8, 4, 4.5, 4.2, 3.8],
                          isPositive: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: BaseTheme.unit * 1.5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(BaseTheme.unit * 1.5),
        ),
        child: Center(
          child: Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
