task :build do
  sh 'rm -rf _site'
  sh './scripts/create-thumbnails.sh'
  sh 'bundle exec jekyll serve'
end

task :default => :build
