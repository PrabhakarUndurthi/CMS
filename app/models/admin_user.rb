class AdminUser < ActiveRecord::Base

	# when we change the name of the table in the migration
	# We have to explicitely tell to the rails convention
	# by providing the self.table_name = "new name"

	#sself.table_name = "admin_users"

	has_and_belongs_to_many  :pages
end
