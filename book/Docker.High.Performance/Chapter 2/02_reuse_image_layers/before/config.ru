app =  proc do |env|
  [200, {}, %w(hello world)]
end
run app
