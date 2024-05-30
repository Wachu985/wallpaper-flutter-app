part of 'app_bloc.dart';

class AppState extends Equatable {
  final int pageSelected;
  final bool darkMode;
  final int selectedColor;
  final int selectedLanguaje;
  const AppState({
    this.pageSelected = 0,
    this.darkMode = false,
    this.selectedColor = 0,
    this.selectedLanguaje = 0,
  });

  factory AppState.initialState() => const AppState();

  @override
  List<Object> get props =>
      [pageSelected, darkMode, selectedColor, selectedLanguaje];

  AppState copyWith({
    int? pageSelected,
    bool? darkMode,
    int? selectedColor,
    int? selectedLanguaje,
  }) {
    return AppState(
      pageSelected: pageSelected ?? this.pageSelected,
      darkMode: darkMode ?? this.darkMode,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedLanguaje: selectedLanguaje ?? this.selectedLanguaje,
    );
  }
}
