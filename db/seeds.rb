# Create Users
User.create!(
  email: 'user1@example.com',
  password: 'password1',
  first_name: 'John',
  last_name: 'Doe',
  profile_image_url: 'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=2048x2048&w=is&k=20&c=Xk0eY3oIoNWDKG937WDH-CR66xRG5V0C-iQuvNcqO2U=',
  # Other user attributes
)

User.create!(
  email: 'user2@example.com',
  password: 'password2',
  first_name: 'Jane',
  last_name: 'Smith',
  # Other user attributes
)

# Create Medications
Medication.create!(
  name: 'Medication A',
  form: 'capsule',
  frequency: 'once',
  dosage_quantity: 1,
  dosage_units: 'mg',
  instructions: 'Take after meal',
  description: 'Description of Medication A',
  # Other medication attributes
)

Medication.create!(
  name: 'Medication B',
  form: 'tablet',
  frequency: 'twice',
  dosage_quantity: 2,
  dosage_units: 'pills',
  instructions: 'Take in the morning and evening',
  description: 'Description of Medication B',
  # Other medication attributes
)

# Create UserMedications
UserMedication.create!(
  user_id: User.first.id,
  medication_id: Medication.first.id,
  start_date: Date.today - 10.days,
  duration: 30,
  notes: 'Started medication last week',
  # Other user_medication attributes
)

UserMedication.create!(
  user_id: User.last.id,
  medication_id: Medication.last.id,
  start_date: Date.today - 5.days,
  duration: 20,
  notes: 'Started medication a few days ago',
  # Other user_medication attributes
)
