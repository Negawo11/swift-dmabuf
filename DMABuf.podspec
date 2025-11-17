Pod::Spec.new do |s|
  s.name             = 'SuuqeDMABuf'
  s.version          = '0.1.0'
  s.summary          = 'A simple DMABuf implementation.'
  s.description      = <<-DESC
A short description of DMABuf.
                       DESC
  s.homepage         = 'https://github.com/Negawo11/swift-dmabuf'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'USER' => 'USER@example.com' }
  s.source           = { :git => 'https://github.com/Negawo11/swift-dmabuf', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'DMABuf/Classes/**/*'
end
