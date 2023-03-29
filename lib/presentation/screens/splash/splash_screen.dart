import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/config/constants/envrionments.dart';
import 'package:super_heroes/presentation/providers/providers.dart';
import 'package:super_heroes/presentation/widgets/splash/initial_screen.dart';
import 'package:super_heroes/presentation/widgets/splash/warning_message.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const name = 'splash-screen';
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (Environments.privateKey != 'no-key' && Environments.publicKey != 'no-key') {
      ref.read(getCharactersProvider.notifier).loadCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    final charactersList = ref.watch(getCharactersProvider);
    return Scaffold(
        body: (Environments.privateKey == 'no-key' && Environments.publicKey == 'no-key') 
        ? const WarningMessage()
        : InitialScreen(
      charactersListIsEmpty: charactersList.isEmpty,
    ));
  }
}
