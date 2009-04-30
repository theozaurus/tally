class TallyGenerator < Rails::Generator::NamedBase
  attr_accessor :tallyables, :migration_name
 
  def initialize(args, options = {})
    super
    @tallyables = args
  end
 
  def manifest    
    file_name = generate_file_name
    @migration_name = file_name.camelize
    record do |m|
      m.migration_template "tally_migration.rb.erb",
                           File.join('db', 'migrate'),
                           :migration_file_name => file_name
    end
  end 
  
  private 
  
  def generate_file_name
    "add_tallyable_to_#{@tallyables.map{|t| t.underscore.pluralize}.join("_and_")}"
  end
 
end
