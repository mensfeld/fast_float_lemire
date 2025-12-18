# frozen_string_literal: true

require_relative 'lib/fast_float_lemire/version'

Gem::Specification.new do |spec|
  spec.name          = 'fast_float_lemire'
  spec.version       = FastFloatLemire::VERSION
  spec.authors       = ['Maciej Mensfeld']
  spec.email         = ['maciej@mensfeld.pl']

  spec.summary       = 'Eisel-Lemire algorithm for fast string-to-float conversion'
  spec.description   = <<~DESC
    An educational Ruby C extension implementing the Eisel-Lemire algorithm
    for string-to-float conversion. This gem demonstrates why this optimization,
    despite being ~2.6x faster for complex numbers, was NOT submitted to Ruby core:
    it regresses performance by ~9% on simple numbers (the common case).

    Use this gem to learn about float parsing algorithms and their tradeoffs,
    or if you specifically work with high-precision scientific data.
  DESC
  spec.homepage      = 'https://github.com/mensfeld/fast_float_lemire'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 3.2.0'

  spec.files         = Dir['lib/**/*', 'ext/**/*', 'CHANGELOG.md', 'README.md', 'LICENSE.txt']
  spec.require_paths = ['lib']
  spec.extensions    = ['ext/fast_float_lemire/extconf.rb']

  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'changelog_uri' => "#{spec.homepage}/blob/master/CHANGELOG.md",
    'source_code_uri' => spec.homepage,
    'documentation_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true'
  }
end
