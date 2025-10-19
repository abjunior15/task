import 'package:flutter/material.dart';
import 'package:task/common/extensions/build_context.dart';
import 'package:task/common/theme/colors/color_scheme.dart';
import 'package:task/common/theme/theme_utils/basic_theme_elements.dart';

// 🔹 Helper Widgets

class BalanceColumn extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const BalanceColumn({
    super.key,
    required this.title,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '﷼',
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(width: BaseTheme.unit / 2),
            Text(
              amount,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              title,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(width: BaseTheme.unit / 2),
            Container(
              width: MediaQuery.of(context).size.width * 0.02,
              height: MediaQuery.of(context).size.width * 0.02,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 🔹 Wallets Section
class WalletsSection extends StatelessWidget {
  const WalletsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SectionHeader(
          title: 'محافظ الوقف',
        ),
        SizedBox(
          height: BaseTheme.padding,
        ),
        Row(
          children: [
            Expanded(
              child: WalletCard(
                icon: '💰',
                iconBgColor: Color(0xFFFFF9E6),
                title: 'محفظة الوقف أ',
                percentage: '+1.2%',
                amount: '45,000',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: WalletCard(
                icon: '🏠',
                iconBgColor: Color(0xFFFFE8E8),
                title: 'محفظة الوقف ب',
                percentage: '+0.5%',
                amount: '23,500',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 🔹 Recent Transactions
class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: 'المعاملات الأخيرة',
        ),
        const SizedBox(
          height: BaseTheme.padding,
        ),
        const TransactionTile(
          title: 'إضافة عبر التحويل البنكي',
          date: '8 سبتمبر 2025',
          amount: '+100.00',
          type: 'إضافة',
          color: Color(0xFF38A545),
          bgColor: Color(0xFFE8F5E9),
        ),
        const SizedBox(height: 12),
        TransactionTile(
          title: 'سحب إلى الحساب البنكي',
          date: '1 سبتمبر 2025',
          amount: '-20.00',
          type: 'سحب',
          color: awqafColorScheme.error,
          bgColor: const Color(0xFFFFEBEE),
        ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title, date, amount, type;
  final Color color, bgColor;

  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        BaseTheme.padding,
      ),
      decoration: BoxDecoration(
        color: awqafColorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(
          BaseTheme.padding,
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(
                BaseTheme.unit,
              ),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.refresh,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(
              width: BaseTheme.padding,
            ),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: awqafColorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        date,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF7E8084),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: BaseTheme.padding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                Text(
                  type,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back,
          size: BaseTheme.padding,
        ),
        Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(
              0xFF7E8084,
            ),
          ),
        ),
      ],
    );
  }
}

class WalletCard extends StatelessWidget {
  final String icon;
  final Color iconBgColor;
  final String title;
  final String percentage;
  final String amount;

  const WalletCard({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.percentage,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: BaseTheme.padding,
        horizontal: BaseTheme.padding,
      ),
      decoration: BoxDecoration(
        color: awqafColorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(
          BaseTheme.padding,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: awqafColorScheme.outline,
                size: BaseTheme.padding,
              ),
              Container(
                padding: const EdgeInsets.all(
                  BaseTheme.unit,
                ),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(
                    BaseTheme.unit,
                  ),
                ),
                child: Text(
                  icon,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: BaseTheme.padding / 1.5),
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: awqafColorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                percentage,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF38A545),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '﷼',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(width: BaseTheme.unit / 3),
                  Text(
                    amount,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFFA6A8AA),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
