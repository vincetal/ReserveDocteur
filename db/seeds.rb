# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Appointment.destroy_all
Patient.destroy_all
JoinTableDoctorSpecialty.destroy_all
Doctor.destroy_all
Specialty.destroy_all

require 'faker'

number_of_entries = 5

jobs = ["orthopedist", "dentist", "chirurgian", "pediatrist","therapist","health aid","nutritionist","ambulance"]

#Créer les villes
number_of_entries.times do
  City.create(name: Faker::Address.city)
end


#Créer les spécialités
number_of_entries.times do
  Specialty.create(name: jobs.sample)
end

#Créer des patients
number_of_entries.times do
  c = City.find(rand(City.first.id..City.last.id))
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: c.id)
end

#Créer les docteurs
number_of_entries.times do
  city = City.find(rand(City.first.id..City.last.id))
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: city.id)
end

#Les spécialités par docteurs (2 spécialités par docteur)
number_of_entries.times do

  d = Doctor.find(rand(Doctor.first.id..Doctor.last.id))
  s = Specialty.find(rand(Specialty.first.id..Specialty.last.id))
  JoinTableDoctorSpecialty.create(doctor_id: d.id, specialty_id: s.id)
end


#Créer les rendez-vous
number_of_entries.times do

  d = Doctor.find(rand(Doctor.first.id..Doctor.last.id))
  p = Patient.find(rand(Patient.first.id..Patient.last.id))
  c = City.find(rand(City.first.id..City.last.id))
  Appointment.create(doctor_id: d.id, patient_id: p.id, date: Faker::Date.in_date_period, city_id: c.id)
end
