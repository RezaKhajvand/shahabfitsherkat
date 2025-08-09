import 'dart:convert';

class AiResponse {
  String id;
  String model;
  String object;
  int created;
  List<Choice> choices;
  Usage usage;

  AiResponse({
    required this.id,
    required this.model,
    required this.object,
    required this.created,
    required this.choices,
    required this.usage,
  });

  factory AiResponse.fromRawJson(String str) =>
      AiResponse.fromJson(json.decode(str));

  factory AiResponse.fromJson(Map<String, dynamic> json) => AiResponse(
        id: json["id"],
        model: json["model"],
        object: json["object"],
        created: json["created"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );
}

class Choice {
  dynamic logprobs;
  String finishReason;
  String nativeFinishReason;
  int index;
  Message message;

  Choice({
    required this.logprobs,
    required this.finishReason,
    required this.nativeFinishReason,
    required this.index,
    required this.message,
  });

  factory Choice.fromRawJson(String str) => Choice.fromJson(json.decode(str));

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
        nativeFinishReason: json["native_finish_reason"],
        index: json["index"],
        message: Message.fromJson(json["message"]),
      );
}

class Message {
  String role;
  String content;
  dynamic refusal;
  dynamic reasoning;

  Message({
    required this.role,
    required this.content,
    required this.refusal,
    required this.reasoning,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
        refusal: json["refusal"],
        reasoning: json["reasoning"],
      );
}

class Usage {
  int promptTokens;
  int completionTokens;
  int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromRawJson(String str) => Usage.fromJson(json.decode(str));

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );
}
