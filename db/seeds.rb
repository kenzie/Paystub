User.destroy_all
u = User.create(:name => 'Kenzie Campbell', :email => 'kenzie@route19.com', :password => 'secret')

Payroll.destroy_all
p = u.payrolls.create(:data => File.open('test/fixtures/payroll_example.xml'))