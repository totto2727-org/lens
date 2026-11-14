///|
#derive(Eq, Debug)
priv enum PointerSegment {
  Key(String)
  Index(Int32)
}

///|
/// An immutable JSON Pointer identifying a location in a JSON document.
#derive(Eq, Debug)
pub struct Pointer {
  priv segments : Array[PointerSegment]
}

///|
fn Pointer::root() -> Pointer {
  Pointer::{ segments: [], }
}

///|
fn Pointer::key(self : Pointer, key : String) -> Pointer {
  Pointer::{ segments: [..self.segments, Key(key)], }
}

///|
fn Pointer::index(self : Pointer, index : Int32) -> Pointer {
  Pointer::{ segments: [..self.segments, Index(index)], }
}

///|
fn Pointer::append(self : Pointer, suffix : Pointer) -> Pointer {
  Pointer::{ segments: [..self.segments, ..suffix.segments], }
}

///|
fn Pointer::prefix(self : Pointer, length : Int32) -> Pointer {
  Pointer::{ segments: self.segments[:length].to_owned(), }
}

///|
fn Pointer::length(self : Pointer) -> Int32 {
  self.segments.length()
}

///|
fn Pointer::prepend_index(self : Pointer, index : Int32) -> Pointer {
  Pointer::root().index(index).append(self)
}

///|
fn Pointer::add_to_json_path(
  self : Pointer,
  path : @json.JsonPath,
) -> @json.JsonPath {
  let mut result = path
  for segment in self.segments {
    result = match segment {
      Key(key) => result.add_key(key)
      Index(index) => result.add_index(index)
    }
  }
  result
}

///|
fn Pointer::json_decode_error(
  self : Pointer,
  path : @json.JsonPath,
  message : String,
) -> @json.JsonDecodeError {
  @json.JsonDecodeError::JsonDecodeError((self.add_to_json_path(path), message))
}

///|
fn escape_pointer_key(key : String) -> String {
  key.replace_all(old="~", new="~0").replace_all(old="/", new="~1")
}

///|
/// Returns the RFC 6901 string representation of this pointer.
pub fn Pointer::to_string(self : Pointer) -> String {
  let output = StringBuilder()
  for segment in self.segments {
    output.write_char('/')
    match segment {
      Key(key) => output.write_string(escape_pointer_key(key))
      Index(index) => output.write_object(index)
    }
  }
  output.to_string()
}
