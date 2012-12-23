models = %w(Expense Month MonthExpense)

models.each do |model|
  puts "Seeding #{model.underscore.pluralize}"
  seed_file = File.join(Rails.root, "db", "seeds", "#{model.underscore.pluralize}.sql")
  ActiveRecord::Base.connection.execute File.read(File.open(seed_file), 'r') if File.exists? seed_file
end

models.each do |model|
  puts "Total #{model.constantize.count} #{model.underscore.pluralize}"
end
