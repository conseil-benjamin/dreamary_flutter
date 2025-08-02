import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dream {
  late String? userId;
  final String? id;
  final String title;
  final DateTime? date;
  final TimeOfDay? wakeUpTime;
  final String description;
  final int lucidity;
  final int clarity;
  final String? duration;
  final int sleepQuality;
  final Set<String> moods;
  final bool isNightmare;
  final bool isRecurring;
  final Set<String> themes;
  final List<String> imagePaths;   // chemins locaux ou URL Firebase
  final List<String> drawingPaths;
  final List<String> audioPaths;

  Dream({
    this.userId,
    this.id,
    this.title = '',
    this.date,
    this.wakeUpTime,
    this.description = '',
    this.lucidity = 0,
    this.clarity = 0,
    this.duration,
    this.sleepQuality = 0,
    Set<String>? moods,
    this.isNightmare = false,
    this.isRecurring = false,
    Set<String>? themes,
    List<String>? imagePaths,
    List<String>? drawingPaths,
    List<String>? audioPaths,
  })  : moods = moods ?? {},
        themes = themes ?? {},
        imagePaths = imagePaths ?? [],
        drawingPaths = drawingPaths ?? [],
        audioPaths = audioPaths ?? [];

  Dream copyWith({
    String? userId,
    String? title,
    DateTime? date,
    TimeOfDay? wakeUpTime,
    String? description,
    int? lucidity,
    int? clarity,
    String? duration,
    int? sleepQuality,
    Set<String>? moods,
    bool? isNightmare,
    bool? isRecurring,
    Set<String>? themes,
    List<String>? imagePaths,
    List<String>? drawingPaths,
    List<String>? audioPaths,
  }) {
    return Dream(
      userId: userId ?? this.userId,
      title: title ?? this.title,
      date: date ?? this.date,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      description: description ?? this.description,
      lucidity: lucidity ?? this.lucidity,
      clarity: clarity ?? this.clarity,
      duration: duration ?? this.duration,
      sleepQuality: sleepQuality ?? this.sleepQuality,
      moods: moods ?? this.moods,
      isNightmare: isNightmare ?? this.isNightmare,
      isRecurring: isRecurring ?? this.isRecurring,
      themes: themes ?? this.themes,
      imagePaths: imagePaths ?? this.imagePaths,
      drawingPaths: drawingPaths ?? this.drawingPaths,
      audioPaths: audioPaths ?? this.audioPaths,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'date': date?.toIso8601String(),
      'wakeUpTime': wakeUpTime != null ? '${wakeUpTime!.hour}:${wakeUpTime!.minute}' : null,
      'description': description,
      'lucidity': lucidity,
      'clarity': clarity,
      'duration': duration,
      'sleepQuality': sleepQuality,
      'moods': moods.toList(),
      'isNightmare': isNightmare,
      'isRecurring': isRecurring,
      'themes': themes.toList(),
      'imagePaths': imagePaths,
      'drawingPaths': drawingPaths,
      'audioPaths': audioPaths,
    };
  }

  factory Dream.fromMap(Map<String, dynamic> map, String id) {
    return Dream(
      userId: map['userId'],
      id: id,
      title: map['title'] ?? '',
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      wakeUpTime: map['wakeUpTime'] != null
          ? TimeOfDay(
        hour: int.parse(map['wakeUpTime'].split(':')[0]),
        minute: int.parse(map['wakeUpTime'].split(':')[1]),
      )
          : null,
      description: map['description'] ?? '',
      lucidity: map['lucidity'] ?? 0,
      clarity: map['clarity'] ?? 0,
      duration: map['duration'],
      sleepQuality: map['sleepQuality'] ?? 0,
      moods: Set<String>.from(map['moods'] ?? []),
      isNightmare: map['isNightmare'] ?? false,
      isRecurring: map['isRecurring'] ?? false,
      themes: Set<String>.from(map['themes'] ?? []),
      imagePaths: List<String>.from(map['imagePaths'] ?? []),
      drawingPaths: List<String>.from(map['drawingPaths'] ?? []),
      audioPaths: List<String>.from(map['audioPaths'] ?? []),
    );
  }
}


class DreamFormNotifier extends StateNotifier<Dream> {
  DreamFormNotifier() : super(Dream());

  void setUserId(String userId) {
    state = state.copyWith(userId: userId);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  void setWakeUpTime(TimeOfDay time) {
    state = state.copyWith(wakeUpTime: time);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void setLucidity(int value) {
    state = state.copyWith(lucidity: value);
  }

  void setClarity(int value) {
    state = state.copyWith(clarity: value);
  }

  void setDuration(String duration) {
    state = state.copyWith(duration: duration);
  }

  void setSleepQuality(int quality) {
    state = state.copyWith(sleepQuality: quality);
  }

  void toggleMood(String mood) {
    final newMoods = Set<String>.from(state.moods);
    if (newMoods.contains(mood)) {
      newMoods.remove(mood);
    } else {
      newMoods.add(mood);
    }
    state = state.copyWith(moods: newMoods);
  }

  void setIsNightmare(bool value) {
    state = state.copyWith(isNightmare: value);
  }

  void setIsRecurring(bool value) {
    state = state.copyWith(isRecurring: value);
  }

  void reset() {
    state = Dream();
  }

  void toggleTheme(String theme) {
    final newThemes = Set<String>.from(state.themes);
    if (newThemes.contains(theme)) {
      newThemes.remove(theme);
    } else {
      newThemes.add(theme);
    }
    state = state.copyWith(themes: newThemes);
  }

  void addImage(String path) {
    final updated = List<String>.from(state.imagePaths)..add(path);
    state = state.copyWith(imagePaths: updated);
  }

  void addDrawing(String path) {
    final updated = List<String>.from(state.drawingPaths)..add(path);
    state = state.copyWith(drawingPaths: updated);
  }

  void addAudio(String path) {
    final updated = List<String>.from(state.audioPaths)..add(path);
    state = state.copyWith(audioPaths: updated);
  }

  void logDream() {
    debugPrint('Données du rêve :');
    debugPrint('UserId: ${state.userId}');
    debugPrint('Title: ${state.title}');
    debugPrint('Date: ${state.date}');
    debugPrint('WakeUpTime: ${state.wakeUpTime}');
    debugPrint('Description: ${state.description}');
    debugPrint('Lucidity: ${state.lucidity}');
    debugPrint('Clarity: ${state.clarity}');
    debugPrint('Duration: ${state.duration}');
    debugPrint('SleepQuality: ${state.sleepQuality}');
    debugPrint('Moods: ${state.moods}');
    debugPrint('IsNightmare: ${state.isNightmare}');
    debugPrint('IsRecurring: ${state.isRecurring}');
    debugPrint('themes: ${state.themes}');
  }
}

// Provider à utiliser dans les widgets Flutter avec Riverpod
final dreamFormProvider =
StateNotifierProvider<DreamFormNotifier, Dream>(
      (ref) => DreamFormNotifier(),
);
