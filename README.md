# Kurýr App - Flutter Project

Profesionální Flutter aplikace pro kurýrskou službu s čistou architekturou a oddělenou logikou od UI.

## 📁 Struktura projektu

```
lib/
├── constants/          # Konstanty aplikace
│   ├── app_colors.dart    # Barevné schéma
│   └── app_styles.dart    # Styly a témata
│
├── services/           # Business logika
│   ├── auth_service.dart  # Autentizace (login, register, reset)
│   └── url_service.dart   # Externí odkazy (tel, mailto, url)
│
├── widgets/            # Znovupoužitelné UI komponenty
│   ├── contact_card.dart         # Kontaktní karta
│   ├── custom_text_field.dart    # Vlastní input pole
│   ├── forgot_password_modal.dart # Modal zapomenutého hesla
│   ├── gradient_button.dart      # Tlačítko s gradientem
│   ├── gradient_header.dart      # Hlavička s gradientem
│   └── help_modal.dart           # Modal nápovědy
│
├── screens/            # Obrazovky aplikace
│   ├── login_screen.dart     # Přihlašovací obrazovka
│   └── register_screen.dart  # Registrační obrazovka
│
└── main.dart           # Entry point
```

## 🎨 Design System

### Barvy
- **Primary:** `#0094D9` (Cyan blue)
- **Secondary:** `#6A2CA0` (Purple)
- **Accent:** `#F28C13` (Orange)
- **Neutral:** White, Black, Grey odstíny

### Border Radius
- Small: 8px
- Medium: 12px
- Large: 16px
- XLarge: 24px

### Spacing
- XSmall: 4px
- Small: 8px
- Medium: 12px
- Large: 16px
- XLarge: 20px
- XXLarge: 24px

## 🔧 Služby

### AuthService
Singleton service pro autentizaci:
- `login()` - Přihlášení uživatele
- `register()` - Registrace nového uživatele
- `resetPassword()` - Obnovení hesla
- `logout()` - Odhlášení

**Použití:**
```dart
final authService = AuthService();
await authService.login(email: 'user@example.com', password: 'password');
```

### UrlService
Singleton service pro externí odkazy:
- `makePhoneCall()` - Otevře telefon s číslem
- `sendEmail()` - Otevře emailového klienta
- `openUrl()` - Otevře URL v prohlížeči

**Použití:**
```dart
final urlService = UrlService();
await urlService.makePhoneCall('+420123456789');
await urlService.sendEmail(email: 'support@kuryr.cz', subject: 'Podpora');
```

## 🧩 Widgety

### GradientHeader
Hlavička s gradientem a logem.

```dart
const GradientHeader(
  title: 'Přihlášení',
  height: 280,
  showLogo: true,
)
```

### GradientButton
Tlačítko s gradientem a loading stavem.

```dart
GradientButton(
  text: 'Přihlásit se',
  onPressed: _handleLogin,
  isLoading: _isLoading,
)
```

### CustomTextField
Vlastní input pole s validací.

```dart
CustomTextField(
  controller: _emailController,
  hintText: 'Email',
  prefixIcon: Icons.email,
  keyboardType: TextInputType.emailAddress,
  validator: (value) => value?.isEmpty == true ? 'Povinné pole' : null,
)
```

### ContactCard
Klikatelná kontaktní karta.

```dart
ContactCard(
  icon: Icons.phone,
  iconColor: AppColors.primary,
  title: 'Telefonní podpora',
  subtitle: '+420 123 456 789',
  onTap: () => urlService.makePhoneCall('+420123456789'),
)
```

### ForgotPasswordModal
Modal pro obnovení hesla.

```dart
showDialog(
  context: context,
  builder: (context) => const ForgotPasswordModal(),
);
```

### HelpModal
Modal s kontaktními možnostmi.

```dart
showDialog(
  context: context,
  builder: (context) => HelpModal(),
);
```

## 📦 Závislosti

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  url_launcher: ^6.2.0
```

## 🚀 Spuštění

```bash
# Instalace závislostí
flutter pub get

# Spuštění v debug režimu
flutter run

# Build pro Android
flutter build apk --release

# Build pro iOS
flutter build ios --release
```

## 🏗️ Architektura

Projekt následuje **čistou architekturu** s oddělenou logikou od UI:

1. **Constants** - Konstanty, barvy, styly (nemění se)
2. **Services** - Business logika (Singleton pattern)
3. **Widgets** - Znovupoužitelné UI komponenty (Stateless/Stateful)
4. **Screens** - Kompletní obrazovky skládající widgety

### Výhody této struktury:
✅ **Znovupoužitelnost** - Widgety lze použít kdekoli  
✅ **Testovatelnost** - Služby lze snadno mockovat  
✅ **Udržovatelnost** - Jasná separace zodpovědností  
✅ **Škálovatelnost** - Snadné přidávání nových features  
✅ **Čitelnost** - Intuitivní struktura projektu  

## 📝 TODOs

- [ ] Připojit k reálnému API
- [ ] Přidat state management (Provider/Riverpod/Bloc)
- [ ] Implementovat hlavní obrazovku po přihlášení
- [ ] Přidat multi-language support (i18n)
- [ ] Implementovat offline režim
- [ ] Přidat unit a widget testy
- [ ] Přidat custom SVG ikony
- [ ] Implementovat dark mode

## 👨‍💻 Pro vývojáře

### Přidání nové obrazovky:
1. Vytvořit soubor v `lib/screens/`
2. Použít existující widgety z `lib/widgets/`
3. Použít styly z `lib/constants/`
4. Připojit k service z `lib/services/`

### Přidání nového widgetu:
1. Vytvořit soubor v `lib/widgets/`
2. Použít konstanty z `AppColors` a `AppStyles`
3. Widget by měl být co nejvíce reusable

### Přidání nové služby:
1. Vytvořit soubor v `lib/services/`
2. Použít Singleton pattern
3. Všechny async operace musí mít error handling
