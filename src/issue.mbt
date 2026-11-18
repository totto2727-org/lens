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
pub extend JsonKind with Eq::{not_equal, equal}

///|
pub extend JsonKind with Debug::{to_repr}

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
pub extend IssueCode with Eq::{not_equal, equal}

///|
pub extend IssueCode with Debug::{to_repr}

///|
/// A structured diagnostic containing the exact pointer and failure reason.
#derive(Eq, Debug)
pub struct Issue {
  pointer : Pointer
  code : IssueCode
  message : String?
}

///|
pub extend Issue with Eq::{not_equal, equal}

///|
pub extend Issue with Debug::{to_repr}

///|
/// The typed error raised when a lens cannot read its selected value.
#derive(Eq, Debug)
pub suberror LensError {
  LensError(Issue)
}

///|
pub extend LensError with Eq::{not_equal, equal}

///|
pub extend LensError with Debug::{to_repr}
