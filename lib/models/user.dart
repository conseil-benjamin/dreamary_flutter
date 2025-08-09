import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  final String id;
  final String uid;
  final String email;
  final String username;
  final String fullName;
  final String bio;
  final String profilePictureUrl;
  final String tokenFcm;
  final Map<String, dynamic> metadata;
  final Map<String, dynamic> preferences;
  final Map<String, int> dreamStats;
  final Map<String, dynamic> progression;
  final Map<String, dynamic> social;

  UserModel({
    this.id = '',
    this.uid = '',
    this.email = '',
    this.username = '',
    this.fullName = '',
    this.bio = '',
    this.profilePictureUrl = '',
    this.tokenFcm = '',
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? preferences,
    Map<String, int>? dreamStats,
    Map<String, dynamic>? progression,
    Map<String, dynamic>? social,
  })  : metadata = metadata ?? {
    'accountStatus': '',
    'lastDreamDate': DateTime.now(),
    'isPremium': false,
    'lastLogin': DateTime.now(),
    'createdAt': DateTime.now(),
  },
        preferences = preferences ?? {
          'notifications': true,
          'theme': 'dark',
          'isPrivateProfile': false,
          'language': 'fr',
        },
        dreamStats = dreamStats ?? {
          'nightmares': 0,
          'totalDreams': 0,
          'lucidDreams': 0,
          'longestStreak': 0,
          'currentStreak': 0,
        },
        progression = progression ?? {
          'xpNeeded': 0,
          'level': 1,
          'xp': 0,
          'rank': '',
          'xpGained': 0,
        },
        social = social ?? {
          'groups': <String>[],
          'followers': 0,
          'following': 0,
        };

  UserModel copyWith({
    String? id,
    String? uid,
    String? email,
    String? username,
    String? fullName,
    String? bio,
    String? profilePictureUrl,
    String? tokenFcm,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? preferences,
    Map<String, int>? dreamStats,
    Map<String, dynamic>? progression,
    Map<String, dynamic>? social,
  }) {
    return UserModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      bio: bio ?? this.bio,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      tokenFcm: tokenFcm ?? this.tokenFcm,
      metadata: metadata ?? this.metadata,
      preferences: preferences ?? this.preferences,
      dreamStats: dreamStats ?? this.dreamStats,
      progression: progression ?? this.progression,
      social: social ?? this.social,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'email': email,
      'username': username,
      'fullName': fullName,
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
      'tokenFcm': tokenFcm,
      'metadata': metadata,
      'preferences': preferences,
      'dreamStats': dreamStats,
      'progression': progression,
      'social': social,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      fullName: map['fullName'] ?? '',
      bio: map['bio'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
      tokenFcm: map['tokenFcm'] ?? '',
      metadata: Map<String, dynamic>.from(map['metadata'] ?? {}),
      preferences: Map<String, dynamic>.from(map['preferences'] ?? {}),
      dreamStats: Map<String, int>.from(
        (map['dreamStats'] ?? {}).map((k, v) => MapEntry(k, v is int ? v : int.tryParse(v.toString()) ?? 0)),
      ),
      progression: Map<String, dynamic>.from(map['progression'] ?? {}),
      social: Map<String, dynamic>.from(map['social'] ?? {}),
    );
  }
}

class UserFormNotifier extends StateNotifier<UserModel> {
  UserFormNotifier() : super(UserModel());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void setBio(String bio) {
    state = state.copyWith(bio: bio);
  }

  void setProfilePictureUrl(String url) {
    state = state.copyWith(profilePictureUrl: url);
  }

  void setTokenFcm(String token) {
    state = state.copyWith(tokenFcm: token);
  }

  void updateMetadata(String key, dynamic value) {
    final metadata = Map<String, dynamic>.from(state.metadata);
    metadata[key] = value;
    state = state.copyWith(metadata: metadata);
  }

  void updatePreferences(String key, dynamic value) {
    final preferences = Map<String, dynamic>.from(state.preferences);
    preferences[key] = value;
    state = state.copyWith(preferences: preferences);
  }

  void updateDreamStats(String key, int value) {
    final dreamStats = Map<String, int>.from(state.dreamStats);
    dreamStats[key] = value;
    state = state.copyWith(dreamStats: dreamStats);
  }

  void updateProgression(String key, dynamic value) {
    final progression = Map<String, dynamic>.from(state.progression);
    progression[key] = value;
    state = state.copyWith(progression: progression);
  }

  void updateSocial(String key, dynamic value) {
    final social = Map<String, dynamic>.from(state.social);
    social[key] = value;
    state = state.copyWith(social: social);
  }

  void reset() {
    state = UserModel();
  }

  void logUser() {
    debugPrint('User Data:');
    debugPrint('ID: ${state.id}');
    debugPrint('UID: ${state.uid}');
    debugPrint('Email: ${state.email}');
    debugPrint('Username: ${state.username}');
    debugPrint('Full Name: ${state.fullName}');
    debugPrint('Bio: ${state.bio}');
    debugPrint('Profile Picture URL: ${state.profilePictureUrl}');
    debugPrint('FCM Token: ${state.tokenFcm}');
    debugPrint('Metadata: ${state.metadata}');
    debugPrint('Preferences: ${state.preferences}');
    debugPrint('Dream Stats: ${state.dreamStats}');
    debugPrint('Progression: ${state.progression}');
    debugPrint('Social: ${state.social}');
  }
}

// Provider à utiliser dans les widgets Flutter avec Riverpod
final userFormProvider = StateNotifierProvider<UserFormNotifier, UserModel>(
      (ref) => UserFormNotifier(),
);
