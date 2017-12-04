Pod::Spec.new do |s|
    s.name         = "TamAlertView"
    s.version      = "1.0.0"
    s.summary      = "A short description of TamAlertView."
    s.homepage      =  'https://github.com/thatha123/TamAlertView'
    s.license       =  'MIT'
    s.authors       = {'Tam' => '1558842407@qq.com'}
    s.platform      =  :ios,'8.0'
    s.source        = {:git => 'https://github.com/thatha123/TamAlertView.git',:tag => "v#{s.version}" }
    s.source_files  =  'TamAlertViewDemo/TamAlertView/*.{h,m}'
    s.requires_arc  =  true

end
