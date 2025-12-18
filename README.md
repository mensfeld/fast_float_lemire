# FastFloatLemire

[![Build Status](https://github.com/mensfeld/fast_float_lemire/actions/workflows/ci.yml/badge.svg)](https://github.com/mensfeld/fast_float_lemire/actions/workflows/ci.yml)
[![Gem Version](https://badge.fury.io/rb/fast_float_lemire.svg)](https://rubygems.org/gems/fast_float_lemire)

Eisel-Lemire algorithm for string-to-float conversion in Ruby.

## About

This is an **educational gem** demonstrating why the Eisel-Lemire algorithm was NOT submitted to Ruby core.

| Number Type | vs String#to_f |
|-------------|----------------|
| Simple (`"1.5"`, `"99.99"`) | **~9% slower** |
| Complex (`"3.141592653589793"`) | **~2.6x faster** |

Most Ruby apps deal with simple numbers, making this a net negative for typical usage.

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
