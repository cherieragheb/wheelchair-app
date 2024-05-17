enum UserType { wheelchair, provider, volunteer }

// Convert to enum
UserType getUserTypeFromString(String value) => UserType.values
    .firstWhere((e) => e.name.toLowerCase() == value.toLowerCase());
