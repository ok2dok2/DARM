FactoryBot.define do
  factory :topic do
    name {'Stayc' }
    introduce {'6人組ガールズグループ'}
    #image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'topic2.jpg'), 'image/jpeg') }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/topic2.jpg'))}
    #image { File.open(Rails.root.join('spec', 'fixtures', 'imagess', 'topic2.jpg'))}
    youtube { '3-ptVHZZdBg' }
    # after(:build) do |topic|
    #   file = topic.image.file
    #   uploader = file.send(:uploader)
    #   path = "topic_images/#{topic.id}/#{file.filename}"
    #   uploader.store!(file, path)
    # end
  end
end