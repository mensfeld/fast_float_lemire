# frozen_string_literal: true

require "mkmf"

# Check for 128-bit integer support (for optimal performance)
have_type("__uint128_t")

create_makefile("fast_float_lemire/fast_float_lemire")
