Pod::Spec.new do |s|
    s.name         = "GDDropZone"
    s.version      = "1.0.0"
    s.summary      = "Convenient drag and drop view."
    s.description  = "An NSView extension for convenient drag and drop operations."
    s.homepage     = "https://github.com/alicin/GDDropZone"
    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.author             = { "Ali Can Bardakci" => "alicanbardakci@gmail.com" }
    s.social_media_url   = "http://twitter.com/alican"

    s.platform     = :osx, "10.10"
    s.source       = { :git => "https://github.com/alicin/GDDropZone.git", :tag => "#{s.version}" }
    s.source_files  = "GDDropZone", "GDDropZone/**/*.{h,m,swift}"
    s.exclude_files = "GDDropZone/Exclude"
end
