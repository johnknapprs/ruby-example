Gem::Specification.new do |s|
  s.name        = '${NAME}'
  s.version     = '0.0.1'
  s.date        = '2019-01-10'
  s.licenses    = ['Apache-2.0']
  s.summary     = "Example ruby pipeline for Gaia pipelines (https://gaia-pipeline.io)."
  s.authors     = ["Michel Vocks"]
  s.email       = 'michelvocks@gmail.com'
  s.homepage    = 'https://gaia-pipeline.io'
  s.files       = Dir["{lib}/**/*.rb", "bin/*"]
  s.add_runtime_dependency "rubysdk", ["~> 0.0.1"]
end
