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
  final String solution;
  final String prevention;
  final String riskLevel; // 'High', 'Medium', 'Low'
  final String cause; // 'Fungi', 'Pest', 'Virus', 'Nutrient'

  const Disease({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.symptomIds,
    required this.solution,
    required this.prevention,
    required this.riskLevel,
    required this.cause,
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
