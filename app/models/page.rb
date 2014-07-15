class Page < ActiveRecord::Base

	belongs_to :subject
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	
	validates_presence_of :name 
	validates_length_of :name, :minimum => 4, :maximum => 50
	validates_presence_of :permalink 
	validates_length_of :permalink, :within => 3..255
	validates_uniqueness_of :permalink
end
