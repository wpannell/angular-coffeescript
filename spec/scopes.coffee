describe "Scope", ->
  Given -> @scope = new Scope()
  Given -> @scope.aProperty = 1
  Then -> @scope.aProperty == 1