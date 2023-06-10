import 'package:collection/collection.dart';
import 'package:domain/models/sprint.dart';
import 'package:domain/models/work_item.dart';
import 'package:infrastructure/interfaces/isprint_manager.dart';

class MockSprintManager extends ISprintManager {
  List<Sprint> _sprints = [
    Sprint(
      id: 1,
      identifier: "Sprint 1",
      topic: "UI/UX",
      createdAt: DateTime.now(),
      dueData: DateTime.now().add(
        const Duration(days: 31),
      ),
    )
  ];

  @override
  Future<bool> addSprint(Sprint sprint) async {
    await Future.delayed(const Duration(microseconds: 500));

    _sprints.add(sprint);
    return true;
  }

  @override
  Future<bool> addWorkItem(WorkItem workItem, int sprint) async {
    await Future.delayed(const Duration(microseconds: 500));
    var exists = _sprints.firstWhereOrNull((element) => element.id == sprint);
    if (exists == null) {
      return false;
    }

    exists.stories?.add(workItem);

    return true;
  }

  @override
  Future<bool> deleteSprint(int sprintId) async {
    await Future.delayed(const Duration(microseconds: 500));

    var sprint = _sprints.firstWhereOrNull((element) => element.id == sprintId);
    if (sprint == null) return false;

    _sprints.remove(sprint);
    return true;
  }

  @override
  Future<List<Sprint>> getAllSprints(int projectId) async {
    await Future.delayed(const Duration(microseconds: 500));

    return _sprints;
  }

  @override
  Future<Sprint?> getSprint(int sprintId) async {
    await Future.delayed(const Duration(microseconds: 500));

    return _sprints.firstWhereOrNull((element) => element.id == sprintId);
  }

  @override
  Future<bool> removeWorkItem(WorkItem workItem, int sprint) async {
    await Future.delayed(const Duration(microseconds: 500));

    var current = _sprints.firstWhereOrNull((element) => element.id == sprint);
    if (current == null) return false;

    current.stories?.add(workItem);

    return true;
  }

  @override
  Future<bool> updateSprint(Sprint current) async {
    await Future.delayed(const Duration(microseconds: 500));

    var sprint =
        _sprints.firstWhereOrNull((element) => element.id == current.id);
    if (sprint == null) return false;

    _sprints.remove(sprint);
    _sprints.add(current);
    return true;
  }
}
