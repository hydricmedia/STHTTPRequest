Pod::Spec.new do |s|
  s.name          = "HMHTTPRequest"
  s.version       = "1.0.2.1"
  s.summary       = "A NSURLConnection wrapper for humans"
  s.homepage      = "https://github.com/hydricmedia/STHTTPRequest"
  s.license       = { :type => 'New BSD', :file => 'LICENSE.txt' }
  s.authors       = 'Nicolas Seriot', 'Alistair Galbraith', 'Cyril Chandelier', 'Doug Ayers', 'Matthias Schmidt', 'Oktawian Chojnacki', 'Stephan Burlot', 'Zach Boyd'
  s.source        = { :git => 'git@github.com:hydricmedia/STHTTPRequest.git', :branch => 'master' }
  s.source_files  = "HMHTTPRequest.{h,m}"
  s.requires_arc  = true
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
end
