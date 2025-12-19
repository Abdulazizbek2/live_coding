# Stocks Feature

Полная feature-структура для отображения списка акций с использованием Clean Architecture.

## Структура

```text
lib/feature/stocks/
├── data/
│   ├── models/
│   │   ├── stock_model.dart           # Модель акции
│   │   ├── stock_price_model.dart     # Модель цены
│   │   └── stocks_response_model.dart # Модель ответа API
│   ├── data_source/
│   │   ├── stocks_remote_data_source.dart      # Интерфейс data source
│   │   └── stocks_remote_data_source_impl.dart # Реализация data source
│   └── repository/
│       └── stocks_repository_impl.dart # Реализация репозитория
├── domain/
│   ├── entities/
│   │   ├── stock_entity.dart       # Entity акции
│   │   └── stock_price_entity.dart # Entity цены
│   └── repository/
│       └── stocks_repository.dart  # Интерфейс репозитория
└── presentation/
    ├── bloc/
    │   ├── stocks_bloc.dart   # BLoC логика
    │   ├── stocks_event.dart  # События
    │   └── stocks_state.dart  # Состояния
    ├── pages/
    │   └── stocks_list_page.dart # Главная страница со списком
    └── widgets/
        └── stock_list_item.dart  # Виджет элемента списка
```

## API Endpoint

```http
GET https://dev.codeunion.kz/ailat/api/stocks/list
```

## Использование

```dart
import 'package:stock_investment_app/feature/stocks/presentation/pages/stocks_list_page.dart';

// В MaterialApp или Navigator
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const StocksListPage()),
);
```

## Особенности

- ✅ Clean Architecture (Data, Domain, Presentation)
- ✅ BLoC для управления состоянием
- ✅ Pull-to-refresh для обновления данных
- ✅ Кэширование изображений (cached_network_image)
- ✅ Отображение Halal-статуса акций
- ✅ Цветовая индикация роста/падения цены
- ✅ Обработка ошибок с возможностью retry
- ✅ Shimmer для состояния загрузки
- ✅ Equatable для сравнения состояний

## Зависимости

Все необходимые зависимости уже добавлены в `pubspec.yaml`:

- `http` - для HTTP запросов
- `flutter_bloc` - для управления состоянием
- `equatable` - для сравнения объектов
- `cached_network_image` - для кэширования изображений
