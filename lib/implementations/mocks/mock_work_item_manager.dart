import 'package:collection/collection.dart';
import 'package:domain/models/board.dart';
import 'package:domain/models/work_item.dart';
import 'package:domain/models/work_item_group.dart';
import 'package:domain/models/work_item_type.dart';
import 'package:infrastructure/interfaces/iworkitem_manager.dart';

class MockWorkItemManager implements IWorkItemManager {
  List<WorkItem> _workItems = [
    WorkItem(
      id: 1,
      internalId: 1,
      name: "Website",
      assignedTo: "KM",
      remaining: 150,
      workItemType: 1,
      projectId: 1,
      boardId: 1,
    ),
    WorkItem(
      id: 2,
      internalId: 2,
      name: "Blog",
      assignedTo: "KM",
      remaining: 150,
      workItemType: 2,
      relatedTo: 1,
      projectId: 1,
      boardId: 1,
    ),
    WorkItem(
      id: 3,
      internalId: 3,
      name: "Story 1",
      assignedTo: "",
      remaining: 0,
      workItemType: 3,
      projectId: 1,
      relatedTo: 2,
    ),
    WorkItem(
      id: 4,
      internalId: 4,
      name: "Story 2",
      assignedTo: "",
      remaining: 0,
      workItemType: 3,
      projectId: 1,
      relatedTo: 2,
    ),
    WorkItem(
      id: 5,
      internalId: 5,
      name: "Story 3",
      assignedTo: "",
      remaining: 0,
      workItemType: 3,
      projectId: 1,
      relatedTo: 2,
    ),
    WorkItem(
      id: 6,
      internalId: 4,
      name: "Story 4",
      assignedTo: "",
      remaining: 0,
      workItemType: 3,
      projectId: 1,
      relatedTo: 2,
    ),
    WorkItem(
      id: 7,
      internalId: 5,
      name: "Story 5",
      assignedTo: "",
      remaining: 0,
      workItemType: 3,
      projectId: 1,
      relatedTo: 2,
    ),
    WorkItem(
      id: 8,
      internalId: 5,
      name: "Story 6",
      assignedTo: "",
      remaining: 0,
      workItemType: 3,
      projectId: 1,
      relatedTo: 2,
    ),
  ];

  final List<WorkItemType> _worKItemTypes = [
    WorkItemType(name: "Epic", id: 1),
    WorkItemType(name: "Feature", id: 2),
    WorkItemType(name: "Story", id: 3),
    WorkItemType(name: "Task", id: 4),
    WorkItemType(name: "Issue", id: 5),
    WorkItemType(name: "Bug", id: 6),
  ];

  @override
  Future<bool> addWorkItem(WorkItem workItem, int projectId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _workItems.add(workItem);

    return true;
  }

  @override
  Future<bool> deleteWorkItem(int workItemId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      var canDelete = _workItems.any((element) =>
          element.id == workItemId &&
          !_workItems.any((element) => element.relatedTo == workItemId));
      if (canDelete) {
        _workItems.removeWhere((element) => element.id == workItemId);
        return true;
      }

      return false;
    } catch (exception) {
      return false;
    }
  }

  @override
  Future<List<WorkItem>> getProjectWorkItems(int projectId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _workItems
        .where((element) => element.projectId == projectId)
        .toList();
  }

  @override
  Future<WorkItem?> getWorkItem(int workItemId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _workItems.firstWhereOrNull((element) => element.id == workItemId);
  }

  @override
  Future<bool> updateWorkitem(WorkItem workItem) {
    // TODO: implement updateWorkitem
    throw UnimplementedError();
  }

  @override
  Future<List<WorkItemType>> getWorkItemTypes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _worKItemTypes;
  }

  @override
  Future<List<WorkItemGroup>> getSprintWorkItems(
      int projectId, int sprintId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<WorkItemGroup> groups = [];

    var stories = _workItems.where((element) => element.workItemType == 3);
    for (var currentWorkItem in stories) {
      var items = _workItems
          .where((workItem) => workItem.relatedTo == currentWorkItem.id)
          .toList();
      groups.add(
        WorkItemGroup(
            id: currentWorkItem.id,
            groupName: currentWorkItem.name,
            workItems: items,
            current: _workItems
                .firstWhere((element) => element.id == currentWorkItem.id)),
      );
    }

    return groups;
  }

  @override
  Future<List<Board>> getProjectBoards(int projectId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Board(
        icon: "new.svg",
        id: 1,
        name: "New",
        workItems: _workItems.where((element) => element.boardId == 1).toList(),
      ),
      Board(
        icon: "active.svg",
        id: 2,
        name: "Active",
        workItems: _workItems.where((element) => element.boardId == 2).toList(),
      ),
      Board(
        icon: "testing.svg",
        id: 3,
        name: "Testing",
        workItems: _workItems.where((element) => element.boardId == 3).toList(),
      ),
      Board(
        icon: "done.svg",
        id: 4,
        name: "Done",
        workItems: _workItems.where((element) => element.boardId == 4).toList(),
      ),
    ];
  }

  @override
  Future<List<WorkItemGroup>> getProjectBacklogStories(int projectId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<WorkItemGroup> groups = [];

    var stories = _workItems.where((element) => element.workItemType == 3);
    for (var currentWorkItem in stories) {
      groups.add(
        WorkItemGroup(
            id: currentWorkItem.id,
            groupName: currentWorkItem.name,
            workItems: [],
            current: currentWorkItem),
      );
    }

    return groups;
  }
}
