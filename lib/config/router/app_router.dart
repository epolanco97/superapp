import 'package:go_router/go_router.dart';
import 'package:super_heroes/presentation/screens/character/character_screen.dart';
import 'package:super_heroes/presentation/screens/home/home_screen.dart';
import 'package:super_heroes/presentation/screens/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail',
      name: CharacterScreen.name,
      builder: (context, state) {
        final characterID = state.queryParams['id'];
        final imagePath = state.queryParams['image_path'];
        final characterName = state.queryParams['character_name'];
        return CharacterScreen(
          imagePath: imagePath!,
          characterName: characterName!,
          characterID: int.parse(characterID!),
        );
      },
    ),
  ],
);
