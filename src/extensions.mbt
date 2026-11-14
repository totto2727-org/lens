///|
pub extend JsonBuildIssueCode with Eq::{not_equal, equal}

///|
pub extend JsonBuildIssueCode with Debug::{to_repr}

///|
pub extend JsonBuildIssue with Eq::{not_equal, equal}

///|
pub extend JsonBuildIssue with Debug::{to_repr}

///|
pub extend JsonBuildError with Eq::{not_equal, equal}

///|
pub extend JsonBuildError with Debug::{to_repr}

///|
pub extend JsonBuilder with ToJson::{to_json}

///|
pub extend Lens with LensTrait::{check}

///|
pub extend PresenceLens with LensTrait::{check}

///|
pub extend ObjectLens with LensTrait::{check}

///|
pub extend JsonKind with Eq::{not_equal, equal}

///|
pub extend JsonKind with Debug::{to_repr}

///|
pub extend IssueCode with Eq::{not_equal, equal}

///|
pub extend IssueCode with Debug::{to_repr}

///|
pub extend Issue with Eq::{not_equal, equal}

///|
pub extend Issue with Debug::{to_repr}

///|
pub extend LensError with Eq::{not_equal, equal}

///|
pub extend LensError with Debug::{to_repr}

///|
pub extend NullishEncodeMode with Eq::{not_equal, equal}

///|
pub extend NullishEncodeMode with Debug::{to_repr}

///|
pub extend Pointer with Eq::{not_equal, equal}

///|
pub extend Pointer with Debug::{to_repr}

///|
pub extend Validation with Eq::{not_equal, equal}

///|
pub extend Validation with Debug::{to_repr}
