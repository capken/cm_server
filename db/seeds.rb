Student.delete_all
student = Student.new do |s|
  s.name = "李磊"
  s.email = "capken@gmail.com"
  s.tel = "13912345678"
  s.gender = "M"
  s.password = "abc123"
  s.password_confirmation = "abc123"
end
student.save

Resume.delete_all
resume = Resume.new do |r|
  r.body = "目前就读于上海交通大学工商管理专业。"
end
resume.student = student
resume.save

Company.delete_all
company = Company.new do |c|
  c.name = "大众点评"
  c.desc = "大众点评是中国领先的本地生活信息及交易平台，也是全球最早建立的独立第三方消费点评网站。大众点评不仅为网友提供商户信息、消费点评及消费优惠等信息服务，同时亦提供团购、电子会员卡及餐厅预订等O2O（Online To Offline）交易服务。大众点评是国内最早开发本地生活移动应用的企业，目前已经成长为一家移动互联网公司，大众点评移动客户端已成为本地生活必备工具。"
  c.website = "www.dianping.com"
  c.address = "上海"
  c.tel = "021-88888888"
  c.email = "hr@dianping.com"
end
company.save

Employee.delete_all
employee = Employee.new do |e|
  e.name = "韩梅梅"
  e.email = "cap.ken@gmail.com"
  e.password = "abc123"
  e.password_confirmation = "abc123"
end
employee.company = company
employee.save

