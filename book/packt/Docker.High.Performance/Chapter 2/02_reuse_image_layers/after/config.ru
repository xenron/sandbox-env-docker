app =  proc do |env|
  [200, {}, %w(hello other world)]
end
run app
