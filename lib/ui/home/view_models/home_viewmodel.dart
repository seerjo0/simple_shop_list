class HomeState {
  bool isLoading;
  final int counter;
  final bool apptheme;
  final bool active;

  HomeState({
    required this.isLoading,
    required this.counter,
    required this.apptheme,
    required this.active,
  });

  factory HomeState.initial() => HomeState(isLoading: true, counter: 0, apptheme: true, active: false);

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.counter == counter && other.apptheme == apptheme && other.active == active;
  }

  @override
  int get hashCode => isLoading.hashCode ^ counter.hashCode ^ apptheme.hashCode;

  @override
  String toString() => 'HomeState(isLoading: $isLoading, counter: $counter, apptheme: $apptheme, active: $active)';

  HomeState copyWith({
    bool? isLoading,
    int? counter,
    bool? apptheme,
    bool? active,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      counter: counter ?? this.counter,
      apptheme: apptheme ?? this.apptheme,
      active: active ?? this.active,
    );
  }
}
