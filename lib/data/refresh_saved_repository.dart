import 'dart:async';

abstract class RefreshSavedRepository {
  Stream<void> get refreshSavedStream;

  void refreshSaved();
}

class RefreshSavedRepositoryImpl implements RefreshSavedRepository {
  final StreamController<void> _refreshSavedStreamController = StreamController.broadcast();

  @override
  Stream<void> get refreshSavedStream => _refreshSavedStreamController.stream;

  @override
  void refreshSaved() => _refreshSavedStreamController.add(null);
}
