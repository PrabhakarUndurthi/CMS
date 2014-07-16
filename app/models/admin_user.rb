class AdminUser < ActiveRecord::Base

	# when we change the name of the table in the migration
	# We have to explicitely tell to the rails convention
	# by providing the self.table_name = "new name"

	#sself.table_name = "admin_users"

	has_secure_password

	has_and_belongs_to_many  :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_USERNAMES = ['humptydumpty', 'marymary', 'littleboy']

	validates_presence_of :first_name
	validates_length_of :first_name, :minimum => 5, :maximum => 50
	validates_presence_of :last_name 
	validates_length_of :last_name, :minimum => 5, :maximum => 50
	validates_presence_of :username
	validates_length_of :username, :within => 8..25
	validates_uniqueness_of :username
	validates_presence_of :email
	validates_length_of :email, :maximum => 100
	validates_format_of :email, :with => EMAIL_REGEX 
	validates_confirmation_of :email 


	validate :username_is_allowed

	def username_is_allowed
		if FORBIDDEN_USERNAMES.include?(username)
			errors.add(:username, "restricted from use.")
		end
	end

end
