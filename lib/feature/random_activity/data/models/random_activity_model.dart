import '../../domain/entities/random_activity.dart';

class RandomActivityModel extends RandomActivity {
  RandomActivityModel(
      {required super.activity,
      required super.type,
      required super.link,
      required super.participants,
      required super.price,
      required super.accessibility});

  factory RandomActivityModel.fromJson(Map<String, dynamic> json) {
    return RandomActivityModel(
        activity: json['activity'],
        type: json['type'],
        link: json['link'],
        participants: json['participants'],
        price: (json['price'] as num).toDouble(),
        accessibility: (json['accessibility'] as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'type': type,
      'link': link,
      'participants': participants,
      'price': price,
      'accessibility': accessibility
    };
  }
}
