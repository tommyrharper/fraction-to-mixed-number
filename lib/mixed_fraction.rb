def mixed_fraction(s)
  numerator = s.split('/')[0].to_i
  puts 'numerator'
  puts numerator
  denom = s.split('/')[1].to_i
  puts 'denom'
  puts denom

  if numerator < 0
    return Rational(numerator, denom).to_s
  end

  num = (numerator / denom).floor
  num_s = num.zero? ? nil : num.to_s + ' '
  puts 'num'
  puts num
  puts 'num_s'
  puts num_s

  fraction = Rational(numerator - (num * denom), denom)
  puts 'fraction'
  puts fraction

  (numerator % denom).zero? ? num.to_s : "#{num_s}#{fraction}"
end
