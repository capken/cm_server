Student.delete_all

student = Student.new do |s|
  s.name = "allen.zheng"
  s.email = "capken@gmail.com"
  s.password = "abc123"
  s.password_confirmation = "abc123"
end

student.save

Company.delete_all
Employee.delete_all

company = Company.new(:name => "SAP Labs")
company.save

employee = Employee.new do |e|
  e.name = "john.wang"
  e.email = "cap.ken@gmail.com"
  e.password = "abc123"
  e.password_confirmation = "abc123"
end
employee.company = company
employee.save

