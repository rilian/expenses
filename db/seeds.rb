models = %w(Expense Month MonthExpense)

models.each do |model|
  puts "Seeding #{model.underscore.pluralize}"
  query = File.read(File.open(File.join(Rails.root, "db", "seeds", "#{model.underscore.pluralize}.sql"), 'r'))
  puts query
  ActiveRecord::Base.connection.execute query
end

models.each do |model|
  puts "Total #{model.constantize.count} #{model.underscore.pluralize}"
end
