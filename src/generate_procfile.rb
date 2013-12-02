basedir = File.expand_path("..", File.dirname(__FILE__)) + '/'
entries = []
Dir[File.expand_path("fetchers", File.dirname(__FILE__)) + "/*"].each do |file|
  entries << "#{File.basename(file, ".*")}: ruby #{file.sub(basedir, '')}"
end
File.open(basedir + 'Procfile', 'w') {|f| f.write entries.join("\n") }