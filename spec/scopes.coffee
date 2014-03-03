#jshint globalstrict: true
#global Scope: false

describe "$scope", ->
  Given -> @scope = new Scope()

  describe "is a plain old JavaScript object", ->
    When -> @scope.aProperty = 1
    Then -> @scope.aProperty == 1

  describe "$digest", ->
    describe "calls back on the $watch listener", ->
      Given -> @watchFn = -> "watch"
      Given -> @listenerFn = jasmine.createSpy()
      Given -> @scope.$watch(@watchFn, @listenerFn)

      When -> @scope.$digest()
      Then -> expect(@listenerFn).toHaveBeenCalled

    describe "passes $scope to the watchFn so it can check values on the $scope", ->
      Given -> @watchFn = jasmine.createSpy()
      Given -> @listenerFn = ->
      Given -> @scope.$watch(@watchFn, @listenerFn)

      When -> @scope.$digest()
      Then -> expect(@watchFn).toHaveBeenCalledWith @scope

    describe "calls the $watch listener back when the value changes", ->
      Given ->
        @scope.$watch(
          (scope) -> scope.someValue
          (newValue, oldValue, scope) -> scope.counter++
        )
      Given -> @scope.someValue = "a"
      Given ->  @scope.counter = 0

      When -> @scope.$digest()
      Then -> @scope.counter == 1

      And -> @scope.$digest()
      And -> @scope.counter == 1

      And -> @scope.someValue = 'b'
      And -> @scope.counter == 1

      And -> @scope.$digest()
      And -> @scope.counter == 2

    describe "calls the $watch listener back when the value is first undefined", ->
      Given ->
        @scope.$watch(
          (scope) -> scope.someValue
          (newValue, oldValue, scope) -> scope.counter++
        )
      Given -> @scope.counter = 0

      When -> @scope.$digest()
      Then -> @scope.counter == 1

    describe "does not require listenerFn to notify when the $scope is digested", ->
      Given -> @watchFn = jasmine.createSpy()
      Given -> @scope.$watch(@watchFn)

      When -> @scope.$digest()
      Then -> expect(@watchFn).toHaveBeenCalled
