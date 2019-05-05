# frozen_string_literal: true

FactoryBot.define do
  sequence(:title) { |n| "#{['Titel', 'Rubrik', 'En titel'].sample} #{n}" }
  sequence(:name) { |n| "#{%w[David Arthur Annika].sample} #{n}" }
  sequence(:phone) { |n| "#{%w[07011111 07022222].sample}#{n}" }
  sequence(:description) { |n| "A long description #{n}" }
  sequence(:address) { |n| "#{road} #{n}, #{zipcode}" }
  sequence(:email) { |n| "person#{n}@example.com" }
  sequence(:image_file) { |_| Rack::Test::UploadedFile.new(File.open('spec/support/image.jpg')) }
  sequence(:pdf_file) { |_| Rack::Test::UploadedFile.new(File.open('spec/support/file.pdf')) }

  def road
    %w[Briggvägen Brisvägen Brovägen].sample
  end

  def zipcode
    %w[26376 26377 26361].sample
  end
end
