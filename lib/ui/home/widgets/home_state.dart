class HomeState {
  final bool isLoading;
  final bool darkModeOn;
  final bool active;

  HomeState({
    required this.isLoading,
    required this.darkModeOn,
    required this.active,
  });

  factory HomeState.initial() => HomeState(isLoading: true, darkModeOn: true, active: false);

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.darkModeOn == darkModeOn && other.active == active;
  }

  @override
  int get hashCode => isLoading.hashCode ^ darkModeOn.hashCode;

  @override
  String toString() => 'HomeState(isLoading: $isLoading, darkModeOn: $darkModeOn, active: $active)';

  HomeState copyWith({
    bool? isLoading,
    int? counter,
    bool? darkModeOn,
    bool? active,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      darkModeOn: darkModeOn ?? this.darkModeOn,
      active: active ?? this.active,
    );
  }
}
