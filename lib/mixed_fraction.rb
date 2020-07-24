def mixed_fraction(s)
  numerator = s.split('/')[0].to_i
  denominator = s.split('/')[1].to_i
  if numerator % denominator == 0
    mixed_s = (numerator / denominator).to_s
  else 
    number = (numerator / denominator).floor
    numerator = (numerator - (number * denominator))
    s = Rational(numerator, denominator)
    mixed_s = "#{number.to_s} #{s.to_s}"
  end
  mixed_s
end
