# Blinkit Money UI Clone

FlickTv assignment — A pixel-perfect, highly animated Blinkit Money onboarding screen built natively with Flutter.

![Blinkit Money Screenshot](screenshot.png)

## Architecture

This project strictly adheres to a **Model-View-ViewModel (MVVM)** architectural pattern for clean separation of concerns:

- **Model**: Data structures (`FeatureCardModel`) and Repositories that simulate fetching localized strings and feature details from a backend.
- **ViewModel**: `BlinkitMoneyViewModel` extends `ChangeNotifier`. It acts as the single source of truth for the UI state, delegating user intents (taps) and managing business logic.
- **View**: A reactive UI layer. `BlinkitMoneyPage` uses `ListenableBuilder` to seamlessly rebuild only when the ViewModel notifies of changes, ensuring high performance.

## Project Structure

```
lib/
├── core/
│   ├── constants/       # Animation timings, duratons, intervals
│   ├── theme/           # Centralized AppColors and AppTextStyles
│   └── widgets/         # Reusable structural widgets (e.g., CommonAppGradient)
└── features/
    └── blinkit_money/
        ├── data/        # Data layer & mocked Repositories
        ├── domain/      # Domain Models
        └── presentation/
            ├── pages/   # Screen-level widgets 
            ├── viewmodels/ # MVVM State controllers
            └── widgets/ # Component-level widgets (Cards, Footers, Headers)
```

## UI & Visual Polish

- **Glassmorphism**: Advanced UI techniques are used on the header action buttons, combining `ClipOval`, `BackdropFilter`, and precise opacity tweaks to create a premium "frosted blur mirror" effect.
- **Seamless Scrolling**: The layout breaks away from standard `Expanded` constraints, natively embedding a `shrinkWrap` list inside a full-page `SingleChildScrollView` to create fluid, natural scrolling behavior.
- **Centralized Theming**: No hardcoded values. All text styles use a locally bundled **Inter** font family and pull exclusively from strongly-typed `AppColors` and `AppTextStyles` classes.

## Orchestrated Entrance Animation

The application features a heavily orchestrated, multi-stage entrance animation engineered using Flutter's native `AnimationController` and staggered `Interval` curves. 
The 3.2-second sequence creates a beautiful splash-screen-style reveal:
1. **The Focus**: The Wallet Hero Image and Brand titles gently fade into the exact center of the screen.
2. **The Shift**: The header smoothly glides upwards to its final position at the top of the screen.
3. **The Stagger**: As the header settles, the feature list cards cascade into view, sliding up and fading in sequentially based on their index.
4. **The Finale**: The footer CTA glides up from the bottom, while the top-corner Glassmorphism navigation buttons fade in simultaneously to complete the UI.
