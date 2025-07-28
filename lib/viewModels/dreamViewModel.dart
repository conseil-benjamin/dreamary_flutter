import '../../../models/dream.dart';
import '../../../services/dreamService.dart';

class DreamViewModel {
  final FirebaseService firebaseService = FirebaseService();

  Future<void> addDream(Dream dream) async {
    await firebaseService.addDream(dream);
  }

  Future<Dream?> getDream(String dreamId) async {
    return await firebaseService.getDream(dreamId);
  }

  Future<void> updateDream(Dream dream) async {
    await firebaseService.updateDream(dream);
  }

  Future<void> deleteDream(String dreamId) async {
    await firebaseService.deleteDream(dreamId);
  }

  Future<List<Dream>> getRecentDreams() async {
    return await firebaseService.getRecentDreams();
  }
}