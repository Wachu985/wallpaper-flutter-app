import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/core/bloc/app_bloc.dart';

class SettingsScreen extends StatelessWidget {
  static const String screenName = "SettingsScreen";
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTraslate = S.of(context);
    const List<Color> colorList = [
      Colors.deepPurple,
      Colors.blue,
      Colors.teal,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.pink,
      Colors.orange,
      Colors.indigo,
      Colors.yellow,
      Colors.deepOrange
    ];
    const List<String> languajeList = ["Español-España", "English-USA"];
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(textTraslate.settingsAppbarTitle),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InfoWidget(
              title: "Pedro José Dominguez Bonilla",
              subtitle: textTraslate.settingsDeveloperName,
              icon: Icons.developer_mode_rounded,
              ontap: () async {
                await launchUrl(Uri.parse("https://wachu985.hopto.org/"));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 14, right: 14),
              child: Card(
                elevation: 2,
                child: SwitchListTile.adaptive(
                  thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Icon(Icons.dark_mode_rounded);
                    }

                    return const Icon(Icons.light_mode_rounded);
                  }),
                  value: context.select((AppBloc bloc) => bloc.state.darkMode),
                  title: Text(textTraslate.settingsDarkModeTitle),
                  subtitle: Text(textTraslate.settingsDarkModeSustitle),
                  onChanged: (value) {
                    context.read<AppBloc>().add(AppEvent.toogleDarkMode());
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 14, right: 14),
              child: Card(
                elevation: 2,
                child: ExpansionTile(
                  title: Text(textTraslate.settingsLanguageTitle),
                  subtitle: Text(textTraslate.settingsLanguageSubtitle),
                  children: [
                    ...languajeList.map(
                      (languaje) => RadioListTile(
                        title: Text(languaje),
                        value: languajeList.indexOf(languaje),
                        groupValue: context.select(
                            (AppBloc bloc) => bloc.state.selectedLanguaje),
                        onChanged: (value) => context.read<AppBloc>().add(
                              AppEvent.switchLanguaje(languaje: value ?? 0),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 14, right: 14),
              child: Card(
                elevation: 2,
                child: ExpansionTile(
                  title: Text(textTraslate.settingsColorTitle),
                  subtitle: Text(textTraslate.settingsColorSustitle),
                  children: [
                    ...colorList.map(
                      (color) => RadioListTile(
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                            ),
                          ),
                        ),
                        value: colorList.indexOf(color),
                        groupValue: context
                            .select((AppBloc bloc) => bloc.state.selectedColor),
                        onChanged: (value) => context.read<AppBloc>().add(
                              AppEvent.switchColor(color: value ?? 0),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InfoWidget(
              title: textTraslate.settingsAboutTitle,
              subtitle: textTraslate.settingsAboutSustitle,
              icon: Icons.question_mark_sharp,
              ontap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/play_store_512.png",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    applicationName: "WallpaperGo",
                    applicationVersion: "1.0",
                    children: [
                      Text(
                        textTraslate.settingsAboutText1,
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        "Pedro José Domínguez Bonilla",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        textTraslate.settingsAboutText2,
                        style: textTheme.bodyLarge,
                      ),
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? ontap;
  const InfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(icon),
          onTap: ontap,
        ),
      ),
    );
  }
}
