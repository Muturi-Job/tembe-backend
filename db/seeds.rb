medications_data = [
  {
    name: 'Medicine A',
    form: 'Tablet',
    frequency: 'Twice a day',
    dosage_quantity: 1,
    dosage_units: 'pill(s)',
    instructions: 'Take with water',
    description: 'Description of Medicine A'
  },
  {
    name: 'Medicine B',
    form: 'Capsule',
    frequency: 'Once a day',
    dosage_quantity: 2,
    dosage_units: 'capsule(s)',
    instructions: 'Take after meals',
    description: 'Description of Medicine B'
  },
]

medications_data.each do |med_data|
    Medication.create!(med_data)
  end
  
  puts 'Sample medications seeded successfully.'