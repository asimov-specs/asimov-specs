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

task publish: %w(publish:html publish:img)

namespace :publish do
  task html: SPECS.map { |spec| "#{spec}/index.html" } do |t|
    t.prerequisites.each do |path|
      output = `rsync -a #{path} ../asimov-specs.github.io/#{path}`
      warn output unless $?.success?
    end
  end

  task img: %w(program-patterns).map { |spec| "#{spec}/img" } do |t|
    t.prerequisites.each do |path|
      output = `rsync -a #{path}/ ../asimov-specs.github.io/#{path}/`
      warn output unless $?.success?
    end
  end
end

task export: SPECS.map { |spec| "#{spec}/index.bs" } do |t|
  t.prerequisites.each do |path|
    output = `cp -p #{path} export/#{File.dirname(path)}.bs`
    warn output unless $?.success?
  end
end
