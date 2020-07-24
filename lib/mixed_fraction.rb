def mixed_fraction(simple_fraction)

  numerator = simple_fraction.split('/')[0].to_i
  denominator = simple_fraction.split('/')[1].to_i
  remainder = numerator % denominator

  if remainder == 0
    mixed_fraction = (numerator / denominator).to_s
  else 
    first_number = (numerator / denominator).floor
    new_numerator = (numerator - (first_number * denominator)).to_s
    fraction = Rational(new_numerator, denominator).to_s
    mixed_fraction = "#{first_number.to_s} #{fraction}"
  end
  mixed_fraction
end