require 'rails_helper'

RSpec.describe PricingPolicy do
  describe '#fetch_text' do
    specify do
      html = %(
               <html>
                 <body>
                   <script>alert('javascript')</script>

                   <style>
                     .iblock {
                       display: inline-block;
                     }
                   </style>

                   <div class='header'>Business & Financial News</div>
                 </body>
               </html>
      )
      expect_any_instance_of(PricingPolicy).to receive(:open).and_return(html)
      text = PricingPolicy.new(10).fetch_text('')

      expect(text).not_to include('javascript')
      expect(text).not_to include('inline-block')
      expect(text).to include('Business & Financial News')
    end
  end
end

RSpec.describe Flexible do
  describe '#total_price' do
    specify do
      text = 'Business & Financial News, Breaking US & International News | Reuters'
      expect_any_instance_of(Flexible).to receive(:fetch_text).and_return(text)
      expect(Flexible.new(1000).total_price).to eq(50)
    end
  end
end

RSpec.describe Fixed do
  describe '#total_price' do
    specify do
      text = %(
               curl -i https://api.github.com/user
               status: 200 OK

               curl -i https://api.github.com/user
               status: 304 Not Modified
      )

      expect_any_instance_of(Fixed).to receive(:fetch_text).and_return(text)
      expect(Fixed.new(100).total_price).to eq(102)
    end
  end
end

RSpec.describe Prestige do
  describe '#total_price' do
    specify do
      xml = %(
              <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
                <item>
                  <title>Your Local Guardian | Rugby Union</title>
                  <pubDate>Sat, 09 Jul 2016 08:11:21 +0100</pubDate>
                </item>
                <item>
                  <title>Harlequins: Anniversary year not lost on Quins youth with top four the target</title>
                  <pubDate>Thu, 07 Jul 2016 04:00:00 +0100</pubDate>
                </item>
              </rss>
      )

      expect_any_instance_of(Prestige).to receive(:open).and_return(xml)
      expect(Prestige.new(10).total_price).to eq(12)
     end
  end
end
