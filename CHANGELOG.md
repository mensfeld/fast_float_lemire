# FastFloatLemire Changelog

## 0.2.0 (2025-12-19)
- **[Feature]** Add ultra-fast path for small integers (0-999).
- **[Feature]** Add ultra-fast path for simple decimals (X.Y, X.YZ patterns).
- **[Feature]** Add exact power-of-10 fast path using precomputed 10^0 to 10^22.
- [Enhancement] Remove strlen() overhead by parsing until null terminator.
- [Enhancement] Eliminate duplicate whitespace skipping.
- [Enhancement] Performance improvements: simple decimals ~7% faster than Ruby, prices ~3% faster, complex numbers ~2.8x faster.

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
