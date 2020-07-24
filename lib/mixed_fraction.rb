def mixed_fraction(fraction)
  numerator = fraction.split('/')[0].to_i
  denominator = fraction.split('/')[1].to_i
  if numerator % denominator == 0
    mixed_fraction = (numerator / denominator).to_s
  else 
    number = (numerator / denominator).floor
    numerator = (numerator - (number * denominator))
    fraction = Rational(numerator, denominator)
    mixed_fraction = "#{number.to_s} #{fraction.to_s}"
  end
  mixed_fraction
end
