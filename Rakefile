BIKESHED = ENV['BIKESHED'] || 'bikeshed'

SPECS = %w[
  module-concepts
  module-manifest
  module-packaging
  module-resolution
  program-patterns
  state-directory
]

task default: :build

task build: SPECS.map { |spec| "#{spec}/index.html" }

SPECS.each do |spec|
  file "#{spec}/index.html" => "#{spec}/index.bs" do |t|
    output = `#{BIKESHED} spec #{t.prerequisites.first} #{t.name}`
    warn output unless $?.success?
  end
end

task publish: SPECS.map { |spec| "#{spec}/index.html" } do |t|
  t.prerequisites.each do |path|
    output = `cp -p #{path} ../asimov-specs.github.io/#{path}`
    warn output unless $?.success?
  end
end
