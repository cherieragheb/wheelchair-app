enum RequestState {
  pending,
  accepted,
  rejected,
}

// Convert to enum
RequestState getStateFromString(String value) => RequestState.values
    .firstWhere((e) => e.name.toLowerCase() == value.toLowerCase());
