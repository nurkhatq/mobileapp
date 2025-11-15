import '../models/category.dart';
import '../models/salon.dart';
import '../models/master.dart';

class MockData {
  static final List<ServiceCategory> categories = [
    ServiceCategory(
      id: 'hair',
      name: 'Парикмахерские',
      icon: '💇',
      gradient1: '#FF6B9D',
      gradient2: '#C06C84',
    ),
    ServiceCategory(
      id: 'nails',
      name: 'Ногтевой сервис',
      icon: '💅',
      gradient1: '#FFA07A',
      gradient2: '#FF7F50',
    ),
    ServiceCategory(
      id: 'massage',
      name: 'Массаж и СПА',
      icon: '💆',
      gradient1: '#87CEEB',
      gradient2: '#4682B4',
    ),
    ServiceCategory(
      id: 'makeup',
      name: 'Макияж',
      icon: '💄',
      gradient1: '#DDA0DD',
      gradient2: '#BA55D3',
    ),
    ServiceCategory(
      id: 'epilation',
      name: 'Эпиляция',
      icon: '✨',
      gradient1: '#FFB6C1',
      gradient2: '#FF69B4',
    ),
    ServiceCategory(
      id: 'cosmetology',
      name: 'Косметология',
      icon: '🧴',
      gradient1: '#98FB98',
      gradient2: '#3CB371',
    ),
    ServiceCategory(
      id: 'tattoo',
      name: 'Тату и пирсинг',
      icon: '🎨',
      gradient1: '#696969',
      gradient2: '#2F4F4F',
    ),
    ServiceCategory(
      id: 'brows',
      name: 'Брови',
      icon: '👁️',
      gradient1: '#F0E68C',
      gradient2: '#DAA520',
    ),
    ServiceCategory(
      id: 'lashes',
      name: 'Ресницы',
      icon: '👀',
      gradient1: '#FFE4B5',
      gradient2: '#DEB887',
    ),
  ];

  static final List<Salon> salons = [
    Salon(
      id: '1',
      name: 'Элегант',
      categoryId: 'hair',
      address: 'ул. Абая 150',
      city: 'Алматы',
      rating: 4.8,
      reviewCount: 342,
      imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035',
      services: ['Стрижка', 'Окрашивание', 'Укладка'],
      description:
          'Премиум салон красоты с лучшими мастерами города. Современное оборудование и индивидуальный подход.',
      isPromoted: true,
      phoneNumber: '+7 777 123 4567',
      workingHours: {
        'Пн-Пт': '09:00 - 21:00',
        'Сб-Вс': '10:00 - 20:00',
      },
    ),
    Salon(
      id: '2',
      name: 'Барбершоп KING',
      categoryId: 'hair',
      address: 'пр. Достык 240',
      city: 'Алматы',
      rating: 4.9,
      reviewCount: 521,
      imageUrl: 'https://images.unsplash.com/photo-1503951914875-452162b0f3f1',
      services: ['Мужская стрижка', 'Бритье', 'Уход за бородой'],
      description:
          'Лучший барбершоп для настоящих мужчин. Классический стиль и современные техники.',
      isPromoted: true,
      phoneNumber: '+7 777 234 5678',
      workingHours: {
        'Пн-Вс': '10:00 - 22:00',
      },
    ),
    Salon(
      id: '3',
      name: 'Nail Art Studio',
      categoryId: 'nails',
      address: 'ул. Жандосова 98',
      city: 'Алматы',
      rating: 4.7,
      reviewCount: 289,
      imageUrl: 'https://images.unsplash.com/photo-1604654894610-df63bc536371',
      services: ['Маникюр', 'Педикюр', 'Nail Art'],
      description:
          'Студия ногтевого сервиса с авторскими дизайнами. Используем только профессиональную косметику.',
      phoneNumber: '+7 777 345 6789',
      workingHours: {
        'Пн-Сб': '09:00 - 20:00',
        'Вс': 'Выходной',
      },
    ),
    Salon(
      id: '4',
      name: 'Relax SPA',
      categoryId: 'massage',
      address: 'ул. Фурманова 273',
      city: 'Алматы',
      rating: 4.9,
      reviewCount: 412,
      imageUrl: 'https://images.unsplash.com/photo-1540555700478-4be289fbecef',
      services: ['Массаж', 'SPA-процедуры', 'Ароматерапия'],
      description:
          'Оазис спокойствия в центре города. Профессиональные массажисты и релаксирующая атмосфера.',
      isPromoted: true,
      phoneNumber: '+7 777 456 7890',
      workingHours: {
        'Пн-Вс': '08:00 - 23:00',
      },
    ),
    Salon(
      id: '5',
      name: 'Beauty Makeup',
      categoryId: 'makeup',
      address: 'ул. Сатпаева 90',
      city: 'Алматы',
      rating: 4.6,
      reviewCount: 178,
      imageUrl: 'https://images.unsplash.com/photo-1487412947147-5cebf100ffc2',
      services: ['Вечерний макияж', 'Свадебный макияж', 'Макияж для фотосессий'],
      description:
          'Профессиональные визажисты для любого события. Создадим идеальный образ!',
      phoneNumber: '+7 777 567 8901',
      workingHours: {
        'Пн-Вс': '10:00 - 21:00',
      },
    ),
  ];

  static final List<Master> masters = [
    Master(
      id: '1',
      name: 'Айгерим Нурланова',
      photoUrl: 'https://images.unsplash.com/photo-1580489944761-15a19d654956',
      rating: 4.9,
      reviewCount: 156,
      specialization: 'Топ-стилист',
      serviceIds: ['1', '2', '3'],
      experienceYears: 8,
      bio: 'Мастер международного класса, специализируюсь на сложном окрашивании и стрижках.',
    ),
    Master(
      id: '2',
      name: 'Дмитрий Ким',
      photoUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
      rating: 4.8,
      reviewCount: 234,
      specialization: 'Барбер',
      serviceIds: ['4', '5', '6'],
      experienceYears: 6,
      bio: 'Классические и современные мужские стрижки. Работаю с любым типом волос.',
    ),
    Master(
      id: '3',
      name: 'Мария Светлова',
      photoUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      rating: 5.0,
      reviewCount: 98,
      specialization: 'Nail-мастер',
      serviceIds: ['7', '8', '9'],
      experienceYears: 5,
      bio: 'Создаю уникальные дизайны. Специализируюсь на наращивании и nail-art.',
    ),
  ];

  static final List<Service> services = [
    Service(
      id: '1',
      name: 'Женская стрижка',
      durationMinutes: 60,
      price: 8000,
      description: 'Стрижка любой сложности с укладкой',
      categoryId: 'hair',
    ),
    Service(
      id: '2',
      name: 'Окрашивание',
      durationMinutes: 180,
      price: 25000,
      description: 'Полное окрашивание профессиональными красителями',
      categoryId: 'hair',
    ),
    Service(
      id: '3',
      name: 'Укладка',
      durationMinutes: 45,
      price: 5000,
      description: 'Профессиональная укладка на любое событие',
      categoryId: 'hair',
    ),
    Service(
      id: '4',
      name: 'Мужская стрижка',
      durationMinutes: 45,
      price: 5000,
      description: 'Классическая или современная мужская стрижка',
      categoryId: 'hair',
    ),
    Service(
      id: '5',
      name: 'Бритье опасной бритвой',
      durationMinutes: 30,
      price: 4000,
      description: 'Традиционное бритье с горячим полотенцем',
      categoryId: 'hair',
    ),
    Service(
      id: '6',
      name: 'Уход за бородой',
      durationMinutes: 40,
      price: 4500,
      description: 'Моделирование и уход за бородой',
      categoryId: 'hair',
    ),
    Service(
      id: '7',
      name: 'Маникюр с покрытием',
      durationMinutes: 90,
      price: 6000,
      description: 'Маникюр с покрытием гель-лаком',
      categoryId: 'nails',
    ),
    Service(
      id: '8',
      name: 'Педикюр',
      durationMinutes: 60,
      price: 7000,
      description: 'Аппаратный педикюр',
      categoryId: 'nails',
    ),
    Service(
      id: '9',
      name: 'Дизайн ногтей',
      durationMinutes: 30,
      price: 3000,
      description: 'Креативный дизайн по вашему желанию',
      categoryId: 'nails',
    ),
  ];

  static List<TimeSlot> generateTimeSlots(DateTime date) {
    final slots = <TimeSlot>[];
    final startHour = 9;
    final endHour = 20;

    for (int hour = startHour; hour < endHour; hour++) {
      for (int minute in [0, 30]) {
        final slotTime = DateTime(
          date.year,
          date.month,
          date.day,
          hour,
          minute,
        );
        // Randomly mark some slots as unavailable for demo
        final isAvailable = (hour + minute) % 3 != 0;
        slots.add(TimeSlot(dateTime: slotTime, isAvailable: isAvailable));
      }
    }

    return slots;
  }
}
