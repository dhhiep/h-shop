namespace :generate do
  # bundle exec rake generate:products count=1
  task :products => :environment do
    count = ENV['count'].to_i

    option_size = OptionType.where(:name => 'size').first_or_create(:presentation => "Size")
    option_color = OptionType.where(:name => 'color').first_or_create(:presentation => "Color")
    option_type = OptionType.where(:name => 'type').first_or_create(:presentation => "Type")

    count.times do |i|
      puts "\e[32;49;1m #{ i + 1 } \e[0m"    
      product_name = FFaker::CheesyLingo.title + ' ' + FFaker::Product.product_name
      long_description = FFaker::HTMLIpsum.body
      short_description = FFaker::HipsterIpsum.paragraph + FFaker::HTMLIpsum.ul_short
      product = Product.create(
        :name => product_name,
        :short_description => short_description,
        :description => long_description,
        :slug => product_name.parameterize
      )

      rand(2..5).to_i.times do
        price = rand(10.0..300)
        variant = Variant.create(
          :sku => "#{product_name[0..3].upcase}-#{rand(10000..99999)}",
          :product => product,
          :price => price,
          :cost_price => price + rand(10.0..50),
          :count_on_hand => rand(0..50)
        )

        variant.option_values.create(:option_type => option_size, :value => %w(S SM M L XL XXL XXL).sample)
        variant.option_values.create(:option_type => option_color, :value => FFaker::Color.name)
        variant.option_values.create(:option_type => option_type, :value => FFaker::CheesyLingo.word)

        2.times do
          image_path = Rails.root.join('app', 'assets', 'images', "products", "product-#{rand(1..8)}.jpg")
          variant.images.create(:attachment => File.open(image_path), :alt => "#{product.name} - #{variant.sku} - #{variant.options_text}")
        end
      end
    end
  end
end