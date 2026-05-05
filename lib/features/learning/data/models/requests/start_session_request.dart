class StartSessionRequest {
  final String tipicId;

  const StartSessionRequest({required this.tipicId});

  Map<String, dynamic> toJson() {
    return {'topic_id': tipicId};
  }
}
