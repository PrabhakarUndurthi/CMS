class Subject < ActiveRecord::Base

	has_many :pages
	#validates_presence_of :name
	validates_presence_of :name 
	validates_length_of :name, :minimum => 4, :maximum => 50

	scope :visible , lambda {where(:visible => true) }
	scope :invisible, lambda {where(:visible => false )}
	scope :sorted, lambda { order("subject.position ASC" ) }
	scope :newest_first, lambda { order("created_at DESC")}
	scope :search, lambda {|query|
	    where(["name LIKE?", "%#{query}"])
	}
end
