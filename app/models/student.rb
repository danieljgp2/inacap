# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :integer
#

class Student < ApplicationRecord
  belongs_to :school
end
