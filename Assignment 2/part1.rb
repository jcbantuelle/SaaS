class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_name, *args)
    singular_currency = method_name.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    elsif method_name == :in
      self / @@currencies[args[0].to_s.gsub(/s$/,'')]
    else
      super
    end
  end
end

class String
  def palindrome?
    stripped_phrase = self.downcase.gsub(/[^a-z]/, '')
    stripped_phrase == stripped_phrase.reverse
  end
end

module Enumerable
  def palindrome?
    self.to_a == self.to_a.reverse
  end
end