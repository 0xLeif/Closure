/// A Struct that defines a Closure with a given Input and a given Output
public struct Closure<Input, Output> {
  /// The Closure passed in during initialization
  public let method: (Input) -> Output
  
  /// Initialize a Closure without any scoped state
  public init(
    _ closure: @escaping (Input) -> Output
  ) {
    method = closure
  }
  
  /// Initialize a Closure with potential scoped state
  public init(
    _ closure: () -> ((Input) -> Output)
  ) {
    method = closure()
  }
}

public extension Closure {
  /// Return Void as the final Output
  var toVoid: Closure<Input, Void> {
    Closure<Input, Void> { input in
      _ = method(input)
      
      return ()
    }
  }
  
  /// Chain another Closure with a NewOutput
  func then<NewOutput>(
    _ closure: @escaping (Output) -> NewOutput
  ) -> Closure<Input, NewOutput> {
    Closure<Input, NewOutput> { input in
      closure(method(input))
    }
  }
  
  /// Run the Closure with Input and a Completion Handler
  func run(
    input: Input,
    onCompletion onCompletionHandler: () -> Void = {}
  ) -> Output {
    defer {
      onCompletionHandler()
    }
    return method(input)
  }
}
