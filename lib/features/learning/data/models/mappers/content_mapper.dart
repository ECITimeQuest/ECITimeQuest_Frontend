import '../historical_event.dart';
import '../historical_figure.dart';
import '../requests/ia_task_context.dart';
import '../responses/ia_task_data.dart';
import '../responses/topic_ia_context_response.dart';

extension TopicAIContextMapper on TopicAIContextResponse {
  ContentExpansionContext toContentExpansionContext() {
    return ContentExpansionContext(
      topicName: topicName,
      topicDescription: topicDescription,
      periodName: periodName,
      events: events.map((e) => e.toDomain()).toList(),
      figures: figures.map((f) => f.toDomain()).toList(),
    );
  }
}

extension HistoricalEventResponseMapper on HistoricalEventResponse {
  HistoricalEvent toDomain() {
    return HistoricalEvent(
      name: name,
      description: description,
      year: year,
      eraStartYear: eraStartYear,
      eraEndYear: eraEndYear,
      location: location,
    );
  }
}

extension HistoricalFigureResponseMapper on HistoricalFigureResponse {
  HistoricalFigure toDomain() {
    return HistoricalFigure(
      name: name,
      role: role,
      biography: biography,
      birthYear: birthYear,
      deathYear: deathYear,
    );
  }
}

extension ExpandedContentMapper on ExpandedContentResponse {
  QuizContext toQuizContext(String topicName) {
    return QuizContext(
      topicName: topicName,
      summary: summary,
      keyFacts: keyFacts,
      funFact: funFact,
    );
  }
}
