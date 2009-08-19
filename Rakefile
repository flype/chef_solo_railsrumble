desc "Rake's default task."
task :default => :test

desc "Run chef-solo cookbook(s)."
task :solo do
  sh "chef-solo -l debug -c config/solo.rb -j config/dna.json"
end

desc "Test cookbook(s) syntax."
task :test do
  puts "** Testing your cookbooks for syntax errors"
  Dir[ File.join(File.dirname(__FILE__), "cookbooks", "**", "*.rb") ].each do |recipe|
    sh %{ruby -c #{recipe}} do |ok, res|
      if ! ok
        raise "Syntax error in #{recipe}"
      end
    end
  end
end
