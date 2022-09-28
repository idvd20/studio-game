Gem::Specification.new do |s|
    s.name         = "prag_studio_game"
    s.version      = "1.0.0"
    s.author       = "Dave Divinagracia"
    s.email        = "idvdivinagracia@gmail.com"
    s.homepage     = "https://github.com/idvd20"
    s.summary      = "Plays a simple game"
    s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
    s.licenses     = ['MIT']
  
    s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
    s.test_files    = Dir["spec/**/*"]
    s.executables   = [ 'studio_game' ]
  
    s.required_ruby_version = '>=1.9'
    s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
  end
  