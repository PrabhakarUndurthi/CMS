class Section < ActiveRecord::Base

	has_many :section_edits

	after_save :touch_page

	acts_as_list :scope => :page
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"

	CONTENT_TYPES = ['text', 'HTML']
	validates_presence_of :name 
	validates_length_of :name , :minmum => 4, :maximum => 50
	validates_inclusion_of :content_type, :in => ['text', 'HTML'],
	:message => "must be one of: #{CONTENT_TYPES.join(', ')}"
	validates_presence_of :content
	validates_length_of :content, :minimum => 10, :maximum => 1000

	private 

	  def touch_page
	  	page.touch
	  end
    end
end
