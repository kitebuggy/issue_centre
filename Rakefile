require 'yard'

YARD::Rake::YardocTask.new do |t|
  puts 'Refreshing YARD docs...'
end

# Update TAGS file
desc 'Refresh Emacs tags'
task 'ctags' do
  exclude = %w{
    .git
    app/views/
    coverage
    test/coverage
    db
    doc
    features
    log
    tmp
  }
  exclude_options = exclude.map{ |e| "--exclude=#{e}"}.join(' ')
  puts 'Refreshing TAGS...'
  system("/usr/local/bin/ctags -e -R --extra=+fq #{exclude_options} . $(rvm gemdir)/gems")
end

# Run ctags followed by yard docs prior to the release steps defined
# in gem_tasks below...
#
desc 'Generate TAGS and YARD docs prior to release'
task 'release', [:remote] => ['yard', 'ctags'] do
end

require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList[ 'test/test_*.rb']
end

