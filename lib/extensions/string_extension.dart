extension Or on String? {
  /// Return cette string si elle n'est ni null ni vide. Sinon return `other`.
  String or(String other) => (this == null || this!.isEmpty) ? other : this!;
}
