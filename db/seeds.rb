# This is where i will create some seed data to work with and test assciations

# Create 2 Physicians

barclay = Physician.create(name: "Dr.Ariel Barclay", password: "FunnyBone")
frankenstien = Physician.create(name: "Dr.Frankenstien", password: "Monster")


#Create 4 Patients

sara = Patient.create(name:"Sara", address:"42 Bowman St. Hackensak NJ", insurance: "NeverPay Plans", age:"32")
jill= Patient.create(name:"Jill", address:"999 Side St. Phiadelphia PA", insurance: "TooMuch HMO", age:"52")
brian = Patient.create(name:"Brian", address:"127 Fork Dr. Washington D.C.", insurance:"NeverMind Health Co.", age:"22")
dashawn = Patient.create(name:"Dashawn", address:"567 Allen St. Woodbury NJ", insurance:"Wow Insurance", age:"12")

# Create 4 appointments
barclay.appointments.create(physician_id: barclay.id, patient_id: sara.id, appointment_date: DateTime.parse("09/01/2009 19:00"))
barclay.appointments.create(physician_id: barclay.id, patient_id: jill.id, appointment_date: DateTime.parse("09/01/2009 13:00"))
frankenstien.appointments.create(physician_id: frankenstien.id, patient_id: brian.id, appointment_date: DateTime.parse("09/01/2009 10:00"))
frankenstien.appointments.create(physician_id: frankenstien.id, patient_id: dashawn.id, appointment_date: DateTime.parse("09/01/2009 12:00"))

# Appointment.create(physician_id:, patient_id:, appointment_date:)