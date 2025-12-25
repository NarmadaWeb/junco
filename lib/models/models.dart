class Symptom {
  final String id;
  final String title;
  final String description;
  final String type; // 'leaf', 'fruit', 'stem'
  final String icon; // Material Icon name

  const Symptom({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.icon,
  });
}

class Disease {
  final String id;
  final String name;
  final String scientificName;
  final String description;
  final List<String> symptomIds; // List of symptom IDs associated with this disease
  final Map<String, double> symptomWeights; // Weight of each symptom (0.1 to 1.0)
  final String solution;
  final String prevention;
  final String riskLevel; // 'High', 'Medium', 'Low', 'Info', 'Aman'
  final String cause; // 'Fungi', 'Pest', 'Virus', 'Nutrient'
  final String category; // 'Glosarium', 'Budidaya', 'Obat-obatan'

  const Disease({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.symptomIds,
    required this.symptomWeights,
    required this.solution,
    required this.prevention,
    required this.riskLevel,
    required this.cause,
    this.category = 'Glosarium', // Default to Glosarium
  });
}

class DiagnosisResult {
  final Disease disease;
  final double confidence;
  final List<String> matchedSymptoms;

  DiagnosisResult({
    required this.disease,
    required this.confidence,
    required this.matchedSymptoms,
  });
}
