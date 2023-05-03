class Employee < ApplicationRecord
  belongs_to :team
  belongs_to :job_title

  def full_name
    "#{first_name} #{last_name}"
  end
end
