def mixed_fraction(s)
  numerator = s.split('/')[0].to_i
  denom = s.split('/')[1].to_i
  if ((numerator < 0) ^ (denom < 0 )) && (numerator.abs < denom.abs)
    puts "here"
    return Rational(numerator, denom).to_s
  elsif ((numerator < 0) ^ (denom < 0) )
    num = (numerator.to_f / denom.to_f).ceil
    num_s = num.zero? ? nil : num.to_s + ' '
    fraction = Rational((numerator - (num * denom)).abs, denom.abs)
  else
    num = (numerator / denom).floor
    num_s = num.zero? ? nil : num.to_s + ' '
    fraction = Rational(numerator - (num * denom), denom)
  end
  (numerator % denom).zero? ? num.to_s : "#{num_s}#{fraction}"
end
