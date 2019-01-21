Given /I am on facebook/ do 
  visit(Login) do |page|
    page.login(@username, @password)
  end

  on(Home).my_profile
end

Then /I delete everything/ do 
  on(Profile).delete_everything
end
