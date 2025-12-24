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
    double highestConfidence = 0.0;
    List<String> bestMatchedSymptoms = [];

    for (var disease in diseases) {
      if (disease.id == 'healthy') continue;

      double totalWeight = 0.0;
      double matchedWeight = 0.0;
      List<String> currentMatchedSymptoms = [];

      // Calculate total possible weight for this disease based on its defined symptoms
      // Use defined weights or default to 0.5 if not specified (though they should be)
      for (var symptomId in disease.symptomIds) {
        double weight = disease.symptomWeights[symptomId] ?? 0.5;
        totalWeight += weight;
      }

      // Calculate weight of matched symptoms
      for (var symptomId in selectedSymptomIds) {
        if (disease.symptomIds.contains(symptomId)) {
          double weight = disease.symptomWeights[symptomId] ?? 0.5;
          matchedWeight += weight;
          currentMatchedSymptoms.add(symptomId);
        }
      }

      // Calculate confidence
      double confidence = 0.0;
      if (totalWeight > 0) {
        confidence = (matchedWeight / totalWeight) * 100;
      }

      // Bonus Logic:
      // If a "high impact" symptom (weight > 0.8) is present, boost confidence
      bool hasHighImpactSymptom = currentMatchedSymptoms.any((id) => (disease.symptomWeights[id] ?? 0) >= 0.8);
      if (hasHighImpactSymptom) {
        confidence += 10.0;
      }
      
      // Penalty: If too many symptoms are missing, reduce confidence slightly
      // (Implicit in the weight calculation, but we can clamp or curve it)

      confidence = confidence.clamp(0.0, 99.9);

      if (confidence > highestConfidence) {
        highestConfidence = confidence;
        bestMatch = disease;
        bestMatchedSymptoms = currentMatchedSymptoms;
      }
    }

    if (bestMatch != null && highestConfidence > 25) {
      return DiagnosisResult(
        disease: bestMatch,
        confidence: double.parse(highestConfidence.toStringAsFixed(1)),
        matchedSymptoms: bestMatchedSymptoms,
      );
    } else {
       // If confidence is low, return "Unknown" or the Healthy state with low confidence
       // For better UX, we might want a specific "Unknown" disease type.
       // For now, defaulting to Healthy but with 0 confidence implies "Unsure".
       return DiagnosisResult(
        disease: diseases.firstWhere((d) => d.id == 'healthy'),
        confidence: 0.0,
        matchedSymptoms: [],
      );
    }
  }
}
