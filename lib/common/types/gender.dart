enum Gender { male, female }

// Convert to enum
Gender getGenderFromString(String value) => Gender.values
    .firstWhere((e) => e.name.toLowerCase() == value.toLowerCase());
