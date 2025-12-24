import '../models/models.dart';
import '../data/data.dart';

class ExpertSystem {
  static DiagnosisResult diagnose(List<String> selectedSymptomIds) {
    if (selectedSymptomIds.isEmpty) {
      return DiagnosisResult(
        disease: diseases.firstWhere((d) => d.id == 'healthy'),
        confidence: 100.0,
        matchedSymptoms: [],
      );
    }

    Disease? bestMatch;
    double highestScore = 0.0;
    List<String> bestMatchedSymptoms = [];

    for (var disease in diseases) {
      if (disease.id == 'healthy') continue;

      int matchCount = 0;
      for (var symptomId in selectedSymptomIds) {
        if (disease.symptomIds.contains(symptomId)) {
          matchCount++;
        }
      }

      // Simple scoring: matches / total_disease_symptoms
      // We can also weigh specific symptoms if needed.
      double score = 0.0;
      if (disease.symptomIds.isNotEmpty) {
        score = matchCount / disease.symptomIds.length;
      }

      // Bonus for matching more symptoms overall
      if (matchCount > 0) {
        score += (matchCount * 0.05);
      }

      if (score > highestScore) {
        highestScore = score;
        bestMatch = disease;
        bestMatchedSymptoms = disease.symptomIds.where((id) => selectedSymptomIds.contains(id)).toList();
      }
    }

    // Normalize score to percentage (capped at 100)
    double confidence = (highestScore * 100).clamp(0.0, 99.9);

    if (bestMatch != null && confidence > 20) {
      return DiagnosisResult(
        disease: bestMatch,
        confidence: double.parse(confidence.toStringAsFixed(1)),
        matchedSymptoms: bestMatchedSymptoms,
      );
    } else {
       // Fallback if confidence is too low or no match
       // Could return "Unknown" or "Healthy" with advice to check again
       return DiagnosisResult(
        disease: diseases.firstWhere((d) => d.id == 'healthy'), // Or a generic "Unknown"
        confidence: 0.0,
        matchedSymptoms: [],
      );
    }
  }
}
