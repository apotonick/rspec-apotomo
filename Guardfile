# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :spec_paths => ['spec/rspec-apotomo'], :cli => "--color --format documentation" do
  watch(%r{^spec/rspec-apotomo/.+_spec\.rb$})
  watch(%r{^lib/(.+)/([^/]+)\.rb$}) { |m| "spec/rspec-apotomo/#{m[2]}_spec.rb"}
end

