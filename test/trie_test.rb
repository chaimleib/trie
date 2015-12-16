require_relative '../lib/trie'
require 'awesome_print'

t = Trie.new
p t.data

t.add_word 'hello'
t.add_word 'andy'
t.add_word 'world'
t.add_word 'worlds'
t.add_word 'hi'
t.add_word 'an'
p t.data

p t.find 'an'  # ['andy']
p t.find 'h'
p t.find 'wor'
