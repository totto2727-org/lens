///|
/// A type-erased lens read used only for aggregate validation.
///
/// Implementations intentionally discard successful decoded values. Use the
/// original typed lenses to read values after `validate` returns `Valid`.
pub trait LensTrait {
  fn check(Self, Json) -> Unit raise LensError
}

///|
pub extend Lens with LensTrait::{check}

///|
/// Erases this lens's successful value while preserving its typed failure.
///
/// `validate` can therefore accept heterogeneous `Lens[T]` values through
/// `&LensTrait` without converting them to a common application type.
pub impl[T] LensTrait for Lens[T] with fn check(self, document) {
  self.get(document) |> ignore
}

///|
pub extend PresenceLens with LensTrait::{check}

///|
/// Erases this presence-aware lens's successful value while preserving its typed failure.
pub impl[T] LensTrait for PresenceLens[T] with fn check(self, document) {
  self.get(document) |> ignore
}

///|
pub extend ObjectLens with LensTrait::{check}

///|
/// Erases this object lens's successful value while preserving its failure.
pub impl LensTrait for ObjectLens with fn check(self, document) {
  self.get(document) |> ignore
}
