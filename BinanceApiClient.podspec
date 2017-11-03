
Pod::Spec.new do |s|
  s.name             = 'BinanceApiClient'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight client lib for Binance.com'


  s.description      = <<-DESC
BinanceApiClient is a lightweight client lib for Binance.com,
 which fullfill all the APIs provided by [Binance](https://www.binance.com/restapipub.html).
                       DESC

  s.homepage         = 'https://github.com/xilin/binance-objc-api'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XiLin' => 'linxi60@gmail.com' }
  s.source           = { :git => 'https://github.com/xilin/binance-objc-api.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BinanceApiClient/Classes/**/*'
  s.exclude_files = 'Example'

  # s.resource_bundles = {
  #   'BinanceApiClient' => ['BinanceApiClient/Assets/*.png']
  # }

  s.public_header_files = 'BinanceApiClient/Classes/**/*.h'
  s.frameworks = 'CoreFoundation'

  s.dependency 'JSONModel', '~> 1.7.0'
  s.dependency 'YTKNetwork', '~> 2.0.4'
  s.dependency 'CocoaLumberjack', '~> 2.3.0'
  s.dependency 'YYCategories', '~> 1.0.4'
  s.dependency 'BlocksKit', '~> 2.2.0'
  s.dependency 'SocketRocket', '~> 0.5.1'

  s.requires_arc = true
end
