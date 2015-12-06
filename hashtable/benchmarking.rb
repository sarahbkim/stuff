require 'benchmark'
require_relative 'hashtable'

include Benchmark

array = (1..5000).map { rand }
letters_arr = ('a'..'zz').map { rand } 

longer_strs = []
5000.times do
  longer_strs << (0...50).map { ('a'..'z').to_a[rand(26)] }.join
end


h = HashTable.new
h_1 = HashTable.new
h_2 = HashTable.new

ruby_hash = Hash.new
ruby_hash_2 = Hash.new 
ruby_hash_3 = Hash.new 

puts "Testing hashtable with integers"
Benchmark.benchmark(CAPTION, 7, FORMAT, ">totals:", ">avg:") do |x|
  insert = x.report("insert: ") { for i in array; h.insert(i, i); end }
  find = x.report("find: ") { for i in array; h.find(i); end }
  replace = x.report("replace: ") { for i in array; h.insert(i, i); end}
  delete = x.report("delete: ") { for i in array; h.delete(i); end}
  [insert+find+replace+delete, (insert+find+replace+delete)/4]
end
puts "hashtable should be empty: #{h.size}"

puts "Ruby's hashtable with integers"
Benchmark.benchmark(CAPTION, 7, FORMAT, ">totals:", ">avg:") do |x|
  insert = x.report("insert: ") { for i in array; ruby_hash[i] = i; end }
  find = x.report("find: ") { for i in array; ruby_hash[i]; end }
  replace = x.report("replace: ") { for i in array; ruby_hash[i] = i; end}
  delete = x.report("delete: ") { for i in array; ruby_hash.delete(i); end}
  [insert+find+replace+delete, (insert+find+replace+delete)/4]
end

puts "\n\n"
puts "Testing hashtable with letters"
Benchmark.benchmark(CAPTION, 7, FORMAT, ">totals:", ">avg:") do |x|
  insert = x.report("insert: ") { for i in letters_arr; h_1.insert(i, i); end }
  find = x.report("find: ") { for i in letters_arr; h_1.find(i); end }
  replace = x.report("replace: ") { for i in letters_arr; h_1.insert(i, i); end}
  delete = x.report("delete: ") { for i in letters_arr; h_1.delete(i); end}
  [insert+find+replace+delete, (insert+find+replace+delete)/4]
end
puts "hashtable should be empty: #{h_1.size}"

puts "Ruby's hahstable with letters"
Benchmark.benchmark(CAPTION, 7, FORMAT, ">totals:", ">avg:") do |x|
  insert = x.report("insert: ") { for i in letters_arr; ruby_hash_2[i] = i; end }
  find = x.report("find: ") { for i in letters_arr; ruby_hash_2[i]; end }
  replace = x.report("replace: ") { for i in letters_arr; ruby_hash_2[i]; end}
  delete = x.report("delete: ") { for i in letters_arr; ruby_hash_2.delete(i); end}
  [insert+find+replace+delete, (insert+find+replace+delete)/4]
end
puts "\n\n"

puts "Testing hashtable with longer strings"

Benchmark.benchmark(CAPTION, 7, FORMAT, ">totals:", ">avg:") do |x|
  insert = x.report("insert: ") { for i in longer_strs; h_2.insert(i, i); end }
  find = x.report("find: ") { for i in longer_strs; h_2.find(i); end }
  replace = x.report("replace: ") { for i in longer_strs; h_2.insert(i, i); end}
  delete = x.report("delete: ") { for i in longer_strs; h_2.delete(i); end}
  [insert+find+replace+delete, (insert+find+replace+delete)/4]
end
puts "hashtable should be empty: #{h_2.size}"

puts "Ruby's hashtable with longer strings"
Benchmark.benchmark(CAPTION, 7, FORMAT, ">totals:", ">avg:") do |x|
  insert = x.report("insert: ") { for i in longer_strs; ruby_hash_3[i] = i; end }
  find = x.report("find: ") { for i in longer_strs; ruby_hash_3[i]; end }
  replace = x.report("replace: ") { for i in longer_strs; ruby_hash_3[i]; end}
  delete = x.report("delete: ") { for i in longer_strs; ruby_hash_3.delete(i); end}
  [insert+find+replace+delete, (insert+find+replace+delete)/4]
end
puts "hashtable should be empty: #{ruby_hash_3.size}"




