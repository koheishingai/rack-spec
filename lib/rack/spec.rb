require "rack/builder"
require "rack/spec/exception_handler"
require "rack/spec/source"
require "rack/spec/validation"
require "rack/spec/validation_error"
require "rack/spec/validator_factory"
require "rack/spec/validators/base"
require "rack/spec/validators/integer_validator"
require "rack/spec/validators/minimum_validator"
require "rack/spec/validators/null_validator"
require "rack/spec/validators/query_parameters_validator"
require "rack/spec/version"

module Rack
  class Spec
    def initialize(app, options)
      @app = Rack::Builder.app do
        use Rack::Spec::ExceptionHandler
        use Rack::Spec::Validation, source: options[:source]
        run app
      end
    end

    def call(env)
      @app.call(env)
    end
  end
end
