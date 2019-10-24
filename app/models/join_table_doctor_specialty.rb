class JoinTableDoctorSpecialty < ApplicationRecord
  belongs_to :specialty
  belongs_to :doctor
end
