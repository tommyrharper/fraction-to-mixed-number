def mixed_fraction(s)
  numerator = s.split('/')[0].to_i
  denom = s.split('/')[1].to_i
  rat = Rational(numerator, denom)

  if numerator.negative? ^ denom.negative?
    return rat.zero? ? '0' : rat.to_s if numerator.abs < denom.abs

    num = (numerator.to_f / denom).ceil
    num_s = num.zero? ? nil : num.to_s + ' '
    fraction = Rational((numerator - (num * denom)).abs, denom.abs)
  else
    num = (numerator / denom).floor
    num_s = num.zero? ? nil : num.to_s + ' '
    fraction = Rational(numerator - (num * denom), denom)
  end

  (numerator % denom).zero? ? num.to_s : "#{num_s}#{fraction}"
end
