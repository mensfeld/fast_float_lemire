# FastFloatLemire Changelog

## 0.1.1 (2025-12-18)
- [Enhancement] Use VERSION constant in gemspec instead of hardcoded value.
- [Change] Require Ruby >= 3.2.0.
- [Maintenance] Configure trusted publishing for RubyGems releases.

## 0.1.0 (2025-12-18)
- **[Feature]** Initial release with Eisel-Lemire algorithm implementation.
- [Feature] `FastFloatLemire.parse` method for single string-to-float conversion.
- [Feature] `FastFloatLemire.parse_array` method for bulk parsing.
- [Feature] Support for special values: infinity, NaN, scientific notation.
- [Feature] 128-bit multiplication with precomputed powers of 5 for high precision.
