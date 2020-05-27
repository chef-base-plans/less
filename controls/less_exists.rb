less_path = input('less_path', value: '/bin/less')

describe file(less_path) do
  it { should exist }
end
