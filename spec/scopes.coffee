#jshint globalstrict: true
#global Scope: false

describe "$scope and $digest", ->
  describe "$scope is a plain old JavaScript object", ->
    Given -> @scope = new Scope()
    When -> @scope.aProperty = 1
    Then -> @scope.aProperty == 1

  describe "$digest calls back on the $watch listener ", ->
    Given ->
      @scope = new Scope()
      @watchFn = -> "watch"
      @listenerFn = jasmine.createSpy()
      @scope.$watch(@watchFn, @listenerFn)

    When -> @scope.$digest()
    Then -> expect(@listenerFn).toHaveBeenCalled()

  describe "watchFn can check values on the $scope", ->
    Given ->
      @scope = new Scope()
      @watchFn = jasmine.createSpy()
      @listenerFn = -> @scope.$watch(@watchFn, @listenerFn)
      @scope.$watch(@watchFn, @listenerFn)

    When -> @scope.$digest()
    Then -> expect(@watchFn).toHaveBeenCalledWith @scope

  describe "$digest calls back on the $watch listener when the watched " +
    "value changes", ->
    Given ->
      @scope = new Scope()
      @scope.someValue = "a"
      @scope.counter = 0
      @scope.$watch(
        (scope) -> (scope.someValue)
        (newValue, oldValue, scope) -> scope.counter++
      )

    Then -> @scope.counter == 0
    And -> @scope.$digest()
    And -> @scope.counter == 1

    And -> @scope.$digest()
    And -> @scope.counter == 1

    And -> @scope.someValue = 'b'
    And -> @scope.counter == 1
    And -> @scope.$digest()
    And -> @scope.counter == 2



