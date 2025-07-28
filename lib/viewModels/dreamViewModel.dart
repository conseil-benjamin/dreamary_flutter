import '../../../models/dream.dart';
import '../../../services/dreamService.dart';

class DreamViewModel {
  final Dreamservice firebaseService = Dreamservice();

  Future<void> addDream(Dream dream) async {
    try {
      await firebaseService.addDream(dream);
    } catch (error) {
      throw Exception("Erreur lors de l'ajout du rêve : $error");
    }
  }

  Future<Dream?> getDream(String dreamId) async {
    return await firebaseService.getDream(dreamId);
  }

  Future<List<Dream>> getDreams() async {
    return await firebaseService.getDreams();
  }

  Future<void> updateDream(Dream dream) async {
    await firebaseService.updateDream(dream);
  }

  Future<void> deleteDream(String dreamId) async {
    await firebaseService.deleteDream(dreamId);
  }

  Future<List<Dream>> getRecentDreams(String userId) async {
    return await firebaseService.getRecentDreams(userId);
  }
}