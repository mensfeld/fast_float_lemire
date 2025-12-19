# FastFloatLemire

[![Build Status](https://github.com/mensfeld/fast_float_lemire/actions/workflows/ci.yml/badge.svg)](https://github.com/mensfeld/fast_float_lemire/actions/workflows/ci.yml)
[![Gem Version](https://badge.fury.io/rb/fast_float_lemire.svg)](https://rubygems.org/gems/fast_float_lemire)

Eisel-Lemire algorithm for string-to-float conversion in Ruby.

## About

This gem implements the Eisel-Lemire algorithm with additional fast paths for common number formats.

| Number Type | vs String#to_f |
|-------------|----------------|
| Simple decimals (`"1.5"`, `"3.14"`) | **~7% faster** |
| Prices (`"9.99"`, `"19.95"`) | **~3% faster** |
| Scientific (`"1e5"`) | ~6% slower |
| Complex (`"3.141592653589793"`) | **~2.8x faster** |

### Optimizations

The implementation includes several fast paths that bypass the full Eisel-Lemire algorithm:

1. **Small integer fast path** - handles `"5"`, `"42"`, `"-123"` (up to 3 digits)
2. **Simple decimal fast path** - handles `"1.5"`, `"9.99"`, `"199.95"` (up to 3+3 digits)
3. **Exact power-of-10 fast path** - uses precomputed exact powers of 10 (10^0 to 10^22)
4. **Removed overhead** - no `strlen()`, single whitespace skip

These optimizations are based on insights from [Nigel Tao's Eisel-Lemire blog post](https://nigeltao.github.io/blog/2020/eisel-lemire.html).

## Installation

```bash
gem install fast_float_lemire
```

Or add to your Gemfile:

```ruby
gem 'fast_float_lemire'
```

## Usage

```ruby
require 'fast_float_lemire'

FastFloatLemire.parse("3.141592653589793")  #=> 3.141592653589793
FastFloatLemire.parse("1.5")                #=> 1.5
FastFloatLemire.parse("1e10")               #=> 10000000000.0

# Bulk parsing
FastFloatLemire.parse_array(["1.0", "2.0", "3.14"])  #=> [1.0, 2.0, 3.14]
```

## Benchmarks

Run benchmarks with:

```bash
bundle exec ruby benchmarks/comparison.rb
```

## References

- [Eisel-Lemire paper](https://arxiv.org/abs/2101.11408) - "Number Parsing at a Gigabyte per Second"
- [fast_float C++ library](https://github.com/fastfloat/fast_float)
- [Go implementation](https://github.com/golang/go/blob/master/src/strconv/eisel_lemire.go)

## License

MIT
