# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => "--color --format documentation" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)/([^/]+)\.rb$}) { |m| "spec/rspec-apotomo/#{m[2]}_spec.rb"}
end

