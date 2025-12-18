# frozen_string_literal: true

require "minitest/autorun"
require "fast_float_lemire"

class TestFastFloatLemire < Minitest::Test
  def test_version
    refute_nil FastFloatLemire::VERSION
  end

  def test_parse_simple_integer
    assert_equal 123.0, FastFloatLemire.parse("123")
  end

  def test_parse_simple_decimal
    assert_equal 1.5, FastFloatLemire.parse("1.5")
  end

  def test_parse_negative
    assert_equal(-3.14, FastFloatLemire.parse("-3.14"))
  end

  def test_parse_scientific_notation
    assert_equal 1e10, FastFloatLemire.parse("1e10")
  end

  def test_parse_negative_exponent
    assert_equal 1e-10, FastFloatLemire.parse("1e-10")
  end

  def test_parse_pi
    pi_str = "3.141592653589793"
    result = FastFloatLemire.parse(pi_str)
    assert_in_delta Math::PI, result, 1e-15
  end

  def test_parse_e
    e_str = "2.718281828459045"
    result = FastFloatLemire.parse(e_str)
    assert_in_delta Math::E, result, 1e-15
  end

  def test_parse_zero
    assert_equal 0.0, FastFloatLemire.parse("0")
    assert_equal 0.0, FastFloatLemire.parse("0.0")
  end

  def test_parse_infinity
    assert_equal Float::INFINITY, FastFloatLemire.parse("inf")
    assert_equal Float::INFINITY, FastFloatLemire.parse("Infinity")
    assert_equal(-Float::INFINITY, FastFloatLemire.parse("-inf"))
  end

  def test_parse_nan
    assert FastFloatLemire.parse("nan").nan?
    assert FastFloatLemire.parse("NaN").nan?
  end

  def test_parse_with_leading_whitespace
    assert_equal 1.5, FastFloatLemire.parse("  1.5")
  end

  def test_parse_with_plus_sign
    assert_equal 1.5, FastFloatLemire.parse("+1.5")
  end

  def test_parse_array
    result = FastFloatLemire.parse_array(["1.0", "2.0", "3.0"])
    assert_equal [1.0, 2.0, 3.0], result
  end

  def test_parse_array_empty
    assert_equal [], FastFloatLemire.parse_array([])
  end

  def test_parse_array_complex
    input = ["3.141592653589793", "2.718281828459045", "1.4142135623730951"]
    result = FastFloatLemire.parse_array(input)

    assert_in_delta Math::PI, result[0], 1e-15
    assert_in_delta Math::E, result[1], 1e-15
    assert_in_delta Math.sqrt(2), result[2], 1e-15
  end

  def test_roundtrip
    values = [0.1, 0.2, 0.3, 1.0 / 3, Math::PI, Math::E, 1e10, 1e14, 1e-10]
    values.each do |v|
      parsed = FastFloatLemire.parse(v.to_s)
      assert_equal v, parsed, "Roundtrip failed for #{v}"
    end
  end

  def test_type_error_on_non_string
    assert_raises(TypeError) { FastFloatLemire.parse(123) }
    assert_raises(TypeError) { FastFloatLemire.parse(nil) }
  end

  def test_type_error_on_non_array
    assert_raises(TypeError) { FastFloatLemire.parse_array("not an array") }
  end
end
