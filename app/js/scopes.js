/* jshint globalstrict: true */
'use strict';

function initialWatchValue() { }

function Scope() {
  this.$$watchers = [];
}

Scope.prototype.$watch = function(watchFn, listenerFn) {
  var watcher = {
    watchFn: watchFn,
    listenerFn: listenerFn || function() {},
    last: initialWatchValue
  };
  this.$$watchers.push(watcher);
};

Scope.prototype.$digest = function() {
  var that = this, newValue, oldValue;

  this.$$watchers.forEach(function(watcher) {
    newValue = watcher.watchFn(that);
    oldValue = watcher.last;
    if(newValue !== oldValue) {
      watcher.last = newValue;
      watcher.listenerFn(newValue, oldValue, that);
    }
  });
};

