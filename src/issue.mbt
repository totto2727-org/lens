///|
/// The JSON value category used by structured lens diagnostics.
#derive(Eq, Debug)
pub enum JsonKind {
  Null
  Boolean
  Number
  String
  Array
  Object
}

///|
/// A machine-readable reason why a lens or validation check failed.
#derive(Eq, Debug)
pub enum IssueCode {
  MissingProperty
  TypeMismatch(expected~ : JsonKind, actual~ : JsonKind)
  IndexOutOfBounds(index~ : Int32, length~ : Int32)
  ConstraintViolation(code~ : String)
  ExternalDecode
}

///|
/// A structured diagnostic containing the exact pointer and failure reason.
#derive(Eq, Debug)
pub struct Issue {
  pointer : Pointer
  code : IssueCode
  message : String?
}

///|
/// The typed error raised when a lens cannot read its selected value.
#derive(Eq, Debug)
pub suberror LensError {
  LensError(Issue)
}
