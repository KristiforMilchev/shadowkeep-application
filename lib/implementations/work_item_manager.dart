import 'package:domain/models/board.dart';
import 'package:domain/models/work_item.dart';
import 'package:domain/models/work_item_group.dart';
import 'package:domain/models/work_item_type.dart';
import 'package:infrastructure/interfaces/iworkitem_manager.dart';

class WorkItemManager implements IWorkItemManager {
  @override
  Future<bool> addWorkItem(WorkItem workItem, int projectId) {
    // TODO: implement addWorkItem
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteWorkItem(int workItemId) {
    // TODO: implement deleteWorkItem
    throw UnimplementedError();
  }

  @override
  Future<List<WorkItem>> getProjectWorkItems(int projectId) {
    // TODO: implement getProjectWorkItems
    throw UnimplementedError();
  }

  @override
  Future<WorkItem> getWorkItem(int workItemId) {
    // TODO: implement getWorkItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateWorkitem(WorkItem workItem) {
    // TODO: implement updateWorkitem
    throw UnimplementedError();
  }

  @override
  Future<List<WorkItemType>> getWorkItemTypes() {
    // TODO: implement getWorkItemTypes
    throw UnimplementedError();
  }

  @override
  Future<List<WorkItemGroup>> getSprintWorkItems(int projectId, int sprintId) {
    // TODO: implement getSprintWorkItems
    throw UnimplementedError();
  }

  @override
  Future<List<Board>> getProjectBoards(int projectId) {
    // TODO: implement getProjectBoards
    throw UnimplementedError();
  }

  @override
  Future<List<WorkItemGroup>> getProjectBacklogStories(int projectId) {
    // TODO: implement getProjectBacklogStories
    throw UnimplementedError();
  }
}
