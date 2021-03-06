module Rack
  class Spec
    class ValidatorFactory
      class << self
        def validator_classes
          @validator_classes ||= Hash.new(Validators::NullValidator)
        end

        def register(name, klass)
          validator_classes[name] = klass
        end

        def build(key, type, constraint)
          validator_classes[type].new(key, constraint)
        end
      end

      register "maximum", Validators::MaximumValidator
      register "minimum", Validators::MinimumValidator
      register "only", Validators::OnlyValidator
      register "type", Validators::TypeValidator
    end
  end
end
