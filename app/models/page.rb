class Page < ActiveRecord::Base

	belongs_to :subject

	acts_as_list :scope => :subject
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	before_validates :add_default_permalink
	after_save :touch_subject
	
	validates_presence_of :name 
	validates_length_of :name, :minimum => 4, :maximum => 50
	validates_presence_of :permalink 
	validates_length_of :permalink, :within => 3..255
	validates_uniqueness_of :permalink

	private

	  def add_default_permalink
	  	if permalink.blank?
	  		self.permalink = "#{id} - #{name.perameterise}"
	  	end
	  end
    end


    def touch_subject
    	#Every time when the page is updated, then the subject will be also updated.
    	subject.touch
    end



end
