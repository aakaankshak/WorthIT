class EvaluationResult {
  final String verdict;
  final double confidence;
  final List<String> reasons;
  final List<String> warnings;

  EvaluationResult({
    required this.verdict,
    required this.confidence,
    required this.reasons,
    required this.warnings,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      verdict: json['verdict'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      reasons: List<String>.from(json['reasons'] ?? []),
      warnings: List<String>.from(json['warnings'] ?? []),
    );
  }
}
