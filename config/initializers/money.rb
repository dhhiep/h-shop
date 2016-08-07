vnd_teen = {
  :priority        => 1,
  :iso_code        => "VNDT",
  :iso_numeric     => "840",
  :name            => "Vietnam Dong (Teen)",
  :symbol          => "K",
  :subunit         => "K",
  :subunit_to_unit => 1,
  :separator       => ".",
  :delimiter       => ",",
  :symbol_after_without_space => true
}

Money::Currency.register(vnd_teen)