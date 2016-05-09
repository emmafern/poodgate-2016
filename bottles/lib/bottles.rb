class Bottles

  def verse(num_bottles)
    next_num = (num_bottles - 1) % 100
    "#{generate_number_string(num_bottles).capitalize} of beer on the wall, " +
    "#{generate_number_string(num_bottles)} of beer.\n" +
    next_action(num_bottles) +
    "#{generate_number_string(next_num)} of beer on the wall.\n"
  end

  def verses(num_bottles, next_num)
    verse(num_bottles) +
    "\n" +
    verse(next_num)
  end

  def pluralize(num)
    if num == 1
      'bottle'
    elsif num > 1
      'bottles'
    end
  end

  def generate_number_string(num)
    if num > 0
      "#{num} #{pluralize(num)}"
    else
      'no more bottles'
    end
  end

  def one_or_it(num)
    num == 1 ? 'it' : 'one'
  end

  def next_action(num)
    if num == 0
      "Go to the store and buy some more, "
    else
      "Take #{one_or_it(num)} down and pass it around, "
    end
  end

end