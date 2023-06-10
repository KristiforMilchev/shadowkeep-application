import 'package:domain/models/observer_call.dart';
import 'package:infrastructure/interfaces/iobserver.dart';

class Observer implements IObserver {
  late List<ObserverCall> _observers;

  Observer() {
    _observers = [];
  }

  @override
  subscribe<T>(String callbackLocation, Function fn, {T? data}) {
    _observers.add(ObserverCall(name: callbackLocation, fn: fn, data: data));
  }

  @override
  dispose(String callbackLocation) {
    var exits =
        _observers.firstWhere((element) => element.name == callbackLocation);
    
    _observers.remove(exits);
  }

  @override
  Function getObserver(String callbackName) {
    var exits =
        _observers.firstWhere((element) => element.name == callbackName);

    return exits.fn;
  }
}
