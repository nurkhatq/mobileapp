import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 50,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Айжан Сапарова',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '+7 777 123 4567',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.event_available_rounded,
                    value: '12',
                    label: 'Записей',
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryPurple.withOpacity(0.8),
                        AppColors.primaryPink.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    icon: Icons.favorite_rounded,
                    value: '5',
                    label: 'Избранное',
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryPink.withOpacity(0.8),
                        AppColors.accentOrange.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Menu Items
            _MenuItem(
              icon: Icons.person_outline_rounded,
              title: 'Личная информация',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.notifications_outlined,
              title: 'Уведомления',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.favorite_border_rounded,
              title: 'Избранные салоны',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.payment_rounded,
              title: 'Способы оплаты',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.language_rounded,
              title: 'Язык',
              trailing: const Text(
                'Русский',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.dark_mode_outlined,
              title: 'Темная тема',
              trailing: Switch(
                value: false,
                onChanged: (value) {},
                activeColor: AppColors.primaryPurple,
              ),
              onTap: null,
            ),
            _MenuItem(
              icon: Icons.help_outline_rounded,
              title: 'Помощь и поддержка',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.info_outline_rounded,
              title: 'О приложении',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _MenuItem(
              icon: Icons.logout_rounded,
              title: 'Выйти',
              iconColor: AppColors.error,
              titleColor: AppColors.error,
              onTap: () {},
            ),
            const SizedBox(height: 32),
            Text(
              'Версия 1.0.0',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Gradient gradient;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback? onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.iconColor,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: (iconColor ?? AppColors.primaryPurple).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor ?? AppColors.primaryPurple,
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: titleColor ?? AppColors.textPrimary,
          ),
        ),
        trailing: trailing ??
            (onTap != null
                ? Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: AppColors.textSecondary,
                  )
                : null),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
