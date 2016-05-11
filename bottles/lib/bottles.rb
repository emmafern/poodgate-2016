class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    container_number = ContainerNumber.for(number)

    "#{container_number} of beer on the wall, ".capitalize +
    "#{container_number} of beer.\n" +
    "#{container_number.action}, " +
    "#{container_number.successor} of beer on the wall.\n"
  end
end

class ContainerNumber
  attr_reader :number

  def self.for(number)    
    case number
    when 0
      ContainerNumber0
    when 1
      ContainerNumber1
    when 6
      ContainerNumber6
    else
      ContainerNumber
    end.new(number)
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{label} #{container}"
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def label
    number.to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    (number - 1).to_container_number
  end
end

class Integer
  def to_container_number
    ContainerNumber.for(self)
  end
end

def ContainerNumber(number)
  return number if number.is_a?(ContainerNumber)
  ContainerNumber.for(number)
end

class ContainerNumber0 < ContainerNumber
  def label
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    # 99.to_container_number
    ContainerNumber(99)
  end
end

class ContainerNumber1 < ContainerNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end

class ContainerNumber6 < ContainerNumber
  def label
    1
  end

  def container
    'six-pack'
  end
end
