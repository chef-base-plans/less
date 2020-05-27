less_test = input('less_test', value: '/bin/less --version')

describe bash(less_test) do
  its('stdout') { should match /less/ }
  its('stderr') { should eq ''}
  its('exit_status') { should eq 0 }
end
