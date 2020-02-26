str = gets
nr = str.split(" ").map(&:to_i)
n = nr[0]
r = nr[1]
if n >= 10
  x = r
else
  x = r+(100*(10-n))
end

puts x