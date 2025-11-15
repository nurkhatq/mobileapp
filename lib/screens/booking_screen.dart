import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/mock_data.dart';
import '../models/master.dart';
import '../models/salon.dart';
import '../utils/colors.dart';

enum BookingMode { byMaster, byService, byTime }

class BookingScreen extends StatefulWidget {
  final Salon salon;

  const BookingScreen({super.key, required this.salon});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Master? selectedMaster;
  Service? selectedService;
  TimeSlot? selectedTimeSlot;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запись на услугу'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryPurple,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primaryPurple,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'По мастеру'),
                Tab(text: 'По услуге'),
                Tab(text: 'По времени'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildByMasterTab(),
                _buildByServiceTab(),
                _buildByTimeTab(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildByMasterTab() {
    final masters = MockData.masters;
    final services = MockData.services;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Шаг 1: Выберите мастера',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ...masters.map((master) {
            final isSelected = selectedMaster?.id == master.id;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMaster = master;
                  selectedService = null;
                  selectedTimeSlot = null;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryPurple.withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryPurple
                        : Colors.grey.shade200,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_rounded,
                        color: AppColors.primaryPurple,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            master.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            master.specialization,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: AppColors.starColor,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${master.rating}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.primaryPurple,
                      ),
                  ],
                ),
              ),
            );
          }),
          if (selectedMaster != null) ...[
            const SizedBox(height: 24),
            const Text(
              'Шаг 2: Выберите время',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildTimeSlotSelector(),
            const SizedBox(height: 16),
          ],
          if (selectedMaster != null && selectedTimeSlot != null) ...[
            const SizedBox(height: 24),
            const Text(
              'Шаг 3: Выберите услугу',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ...services.map((service) {
              final isSelected = selectedService?.id == service.id;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedService = service;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryPurple.withOpacity(0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryPurple
                          : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${service.durationMinutes} мин',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${service.price} ₸',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.primaryPurple,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ],
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildByServiceTab() {
    final services = MockData.services;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Шаг 1: Выберите услугу',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ...services.map((service) {
            final isSelected = selectedService?.id == service.id;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedService = service;
                  selectedMaster = null;
                  selectedTimeSlot = null;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryPurple.withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryPurple
                        : Colors.grey.shade200,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.content_cut_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${service.durationMinutes} мин • ${service.price} ₸',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.primaryPurple,
                      ),
                  ],
                ),
              ),
            );
          }),
          if (selectedService != null) ...[
            const SizedBox(height: 24),
            const Text(
              'Шаг 2: Выберите мастера и время',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ...MockData.masters.map((master) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryPurple.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            color: AppColors.primaryPurple,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                master.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: AppColors.starColor,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${master.rating}',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Ближайшее время:',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: ['10:00', '14:30', '16:00'].map((time) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMaster = master;
                              selectedTimeSlot = TimeSlot(
                                dateTime: DateTime.now(),
                                isAvailable: true,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryPurple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              time,
                              style: const TextStyle(
                                color: AppColors.primaryPurple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            }),
          ],
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildByTimeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Шаг 1: Выберите дату и время',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildDateSelector(),
          const SizedBox(height: 16),
          _buildTimeSlotSelector(),
          if (selectedTimeSlot != null) ...[
            const SizedBox(height: 24),
            const Text(
              'Шаг 2: Выберите мастера и услугу',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ...MockData.masters.map((master) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_rounded,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            master.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            master.specialization,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMaster = master;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Выбрать'),
                    ),
                  ],
                ),
              );
            }),
          ],
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 14,
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index));
          final isSelected = DateFormat('yyyyMMdd').format(selectedDate) ==
              DateFormat('yyyyMMdd').format(date);

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date;
                selectedTimeSlot = null;
              });
            },
            child: Container(
              width: 60,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                gradient: isSelected ? AppColors.primaryGradient : null,
                color: isSelected ? null : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey.shade200,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE', 'ru').format(date).toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.white : AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('d').format(date),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimeSlotSelector() {
    final slots = MockData.generateTimeSlots(selectedDate);

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: slots.take(12).map((slot) {
        final timeStr = DateFormat('HH:mm').format(slot.dateTime);
        final isSelected = selectedTimeSlot?.dateTime == slot.dateTime;

        return GestureDetector(
          onTap: slot.isAvailable
              ? () {
                  setState(() {
                    selectedTimeSlot = slot;
                  });
                }
              : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: isSelected ? AppColors.primaryGradient : null,
              color: slot.isAvailable
                  ? (isSelected ? null : Colors.white)
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : (slot.isAvailable ? Colors.grey.shade300 : Colors.grey.shade200),
              ),
            ),
            child: Text(
              timeStr,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: slot.isAvailable
                    ? (isSelected ? Colors.white : AppColors.textPrimary)
                    : AppColors.textSecondary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomSheet() {
    final canBook = selectedMaster != null &&
        selectedService != null &&
        selectedTimeSlot != null;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: canBook ? _confirmBooking : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryPurple,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            child: Text(
              canBook ? 'Подтвердить запись' : 'Заполните все поля',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _confirmBooking() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Text('Запись подтверждена!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Салон: ${widget.salon.name}'),
            Text('Мастер: ${selectedMaster!.name}'),
            Text('Услуга: ${selectedService!.name}'),
            Text(
              'Время: ${DateFormat('d MMM, HH:mm', 'ru').format(selectedTimeSlot!.dateTime)}',
            ),
            Text('Стоимость: ${selectedService!.price} ₸'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('ОК'),
          ),
        ],
      ),
    );
  }
}
