require 'optics/version'

module Optics
  class Lens
    def initialize(getter, setter)
      @getter = getter
      @setter = setter
    end

    def set(subject, value)
      @setter.(subject, value)
    end

    def get(subject)
      @getter.(subject)
    end

    def combine(other)
      Lens.new(
        -> (subject) { other.get(get(subject)) },
        -> (subject, value) {
          set(subject, other.set(get(subject), value))
        }
      )
    end
  end

  class HashLens < Lens
    def initialize(key)
      super(
        -> (subject) { subject[key] },
        -> (subject, value) { subject.merge(key => value) }
      )
    end
  end

  class IxLens < Lens
    def initialize(index)
      super(
        -> (subject) { subject[index] },
        -> (subject, new_value) {
          subject.each_with_index.map { |old_value, value_index|
            value_index == index ? new_value : old_value
          }
        }
      )
    end
  end
end
