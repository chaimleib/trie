class Trie
  attr_accessor :data

  def initialize
    @data = {}
  end

  def add_word(word)
    turtle = @data
    word.split('').each { |letter|
      turtle[letter] ||= {}
      turtle = turtle[letter]
    }
    turtle['isword'] = true
  end

  def find(prefix)
    rv = []  # return value
    
    # Step 1: find the folder
    turtle = @data
    prefix.split('').each { |letter|
      turtle = turtle[letter]
      return rv unless turtle
    }

    # Step 2: recursively list the words
    _find_helper(turtle, prefix.split(''), rv)
  end

  def _find_helper(folder, chars, rv)
    # Add a result if is word
    if folder['isword']
      rv << chars.join
    end

    # Descend deeper, recursively
    folder.each{ |key, value|
      next if key == 'isword'
      _find_helper(folder[key], chars + [key], rv)
    }
    rv
  end
end
