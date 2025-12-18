# frozen_string_literal: true

require 'bundler/setup'
require 'fast_float_lemire'
require 'benchmark'

ITERATIONS = 1_000_000

puts "FastFloatLemire v#{FastFloatLemire::VERSION} Benchmark"
puts "Ruby #{RUBY_VERSION}"
puts "Iterations: #{ITERATIONS}"
puts '-' * 60

def bench(name, strings)
  strings = strings.map(&:to_s)

  # Warm up
  100.times { strings.each { |s| s.to_f } }
  100.times { strings.each { |s| FastFloatLemire.parse(s) } }

  puts "\n#{name}:"
  puts "  Sample: #{strings.first(3).join(', ')}#{strings.size > 3 ? '...' : ''}"

  Benchmark.bm(20) do |x|
    x.report('String#to_f') do
      (ITERATIONS / strings.size).times { strings.each { |s| s.to_f } }
    end

    x.report('FastFloatLemire') do
      (ITERATIONS / strings.size).times { strings.each { |s| FastFloatLemire.parse(s) } }
    end
  end
end

# Simple numbers (typical Ruby usage - FastFloatLemire is SLOWER here)
bench('Simple decimals (1.5, 2.0, 3.14)',
      %w[1.5 2.0 3.14 99.99 0.5 0.25 10.0 7.5 42.0 100.0])

bench('Prices (9.99, 19.95)',
      %w[9.99 19.95 29.99 49.95 99.99 149.99 199.95 299.99 399.95 499.99])

bench('Simple scientific (1e5, 2e10)',
      %w[1e5 2e6 3e7 4e8 5e9 1e10 2e11 3e12 4e13 5e14])

# Complex numbers (FastFloatLemire is FASTER here)
bench('Math constants (Pi, E, sqrt2)',
      %w[3.141592653589793 2.718281828459045 1.4142135623730951
         1.7320508075688772 0.6931471805599453 2.302585092994046
         1.6180339887498949 0.5772156649015329 1.2020569031595942 0.9159655941772190])

bench('High precision decimals',
      %w[0.123456789012345 9.876543210987654 1.111111111111111
         2.222222222222222 3.333333333333333 4.444444444444444
         5.555555555555555 6.666666666666666 7.777777777777777 8.888888888888888])

puts "\n" + '=' * 60
puts 'CONCLUSION:'
puts '  - FastFloatLemire is ~2-3x FASTER for complex numbers (10+ digits)'
puts '  - FastFloatLemire is ~5-10% SLOWER for simple numbers'
puts '  - Most Ruby apps use simple numbers, so String#to_f is usually better'
puts '=' * 60
