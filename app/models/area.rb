class Area < ActiveRecord::Base
  has_and_belongs_to_many :instituicoes

	has_many :children, :class_name => "Area", :foreign_key => "father_id", :dependent => :destroy
	belongs_to :father, :class_name => "Area"

  validates_presence_of :nome

  def last?
    return self == Area.find_all_by_father_id(self.father_id, :order => 'nome').last
  end

end

