require 'yard'

YARD::Rake::YardocTask.new do |t|
end

desc "Generate yard documentation to release process"
task "release", [:remote] => ["yard"] do
end
      
require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList[ 'test/test_*.rb']
end

