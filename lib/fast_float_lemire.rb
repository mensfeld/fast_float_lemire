# frozen_string_literal: true

require_relative "fast_float_lemire/version"
require_relative "fast_float_lemire/fast_float_lemire"

# Eisel-Lemire algorithm for fast string-to-float conversion.
#
# This gem provides an alternative float parsing implementation that is
# significantly faster for numbers with many significant digits (like Pi),
# but slightly slower for simple numbers (like "1.5").
#
# @note This is an EDUCATIONAL gem demonstrating why this algorithm was
#   NOT submitted to Ruby core - it regresses performance on simple numbers
#   which are the common case in typical Ruby applications.
#
# @example Basic usage
#   FastFloatLemire.parse("3.141592653589793")  #=> 3.141592653589793
#
# @example Bulk parsing
#   FastFloatLemire.parse_array(["1.5", "3.14159", "2.71828"])
#
# @see https://arxiv.org/abs/2101.11408 Eisel-Lemire paper
module FastFloatLemire
  class Error < StandardError; end

  # Methods parse() and parse_array() are defined in the C extension
end
