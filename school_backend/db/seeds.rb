puts "🌱 Seeding spices..."

#Create Schools

s1 = School.create({school_name:'Wagner School', address:'4444 7th Manhattan NY 12345', phone: '123-456-7890'})
s2 = School.create({school_name:'Anderson School', address:'3526 2th Seattle WA 35355', phone: '111-444-6666'})
s3 = School.create({school_name:'Irvington School', address:'3224 123w Los Angeles CA 25233', phone: '435-134-6426'})

# Create Teachers
subject = ['math', 'social studies', 'science', 'english']
gender = ['male', 'female']
10.times {Teacher.create(teacher_name:Faker::Name.name, subject:subject.sample)}

# Create Students
30.times {
    Student.create(
        gender:gender.sample, 
        student_name:Faker::Name.first_name , 
        age:rand(1..18), 
        phone:Faker::PhoneNumber.cell_phone , 
        active:true, 
        school_id:School.all.sample.id
)}

# Create Appointments
150.times {
    Appointment.create(
        student_id:Student.all.sample.id, 
        teacher_id:Teacher.all.sample.id, 
        date:Faker::Date.between(from: 2.days.ago, to: Date.today)
)}



#Create Students

# st1 = Student.create({student_name:'Andy', age:14, gender:'male', phone:'333-555-7776', active:true, school_id: s1.id})
# st2 = Student.create({student_name:'John', age:16, gender:'male', phone:'425-446-7434', active:true, school_id: s2.id})
# st3 = Student.create({student_name:'Sasha', age:13, gender:'female', phone:'626-464-6626', active:true, school_id: s2.id})
# st4 = Student.create({student_name:'Ellie', age:17, gender:'female', phone:'335-744-7594', active:true, school_id: s1.id})
# st5 = Student.create({student_name:'Ted', age:17, gender:'male', phone:'454-343-6463', active:true, school_id: s3.id})

# # Create Teachers

# t1 = Teacher.create({teacher_name:'Dean', subject:'math'})
# t2 = Teacher.create({teacher_name:'Bob', subject:'biology'})
# t3 = Teacher.create({teacher_name:'Kristen', subject:'social studies'})
# t4 = Teacher.create({teacher_name:'Joe', subject:'english'})

# # Create Appointments

# Appointment.create(student_id:st1.id, teacher_id:t1.id, date:Date.new(2021,10,5))
# Appointment.create(student_id:st1.id, teacher_id:t1.id, date:Date.new(2020,9,21))
# Appointment.create(student_id:st1.id, teacher_id:t2.id, date:Date.new(2019,3,11))

# Appointment.create(student_id:st2.id, teacher_id:t3.id, date:Date.new(2021,11,5))
# Appointment.create(student_id:st2.id, teacher_id:t2.id, date:Date.new(2020,8,21))
# Appointment.create(student_id:st2.id, teacher_id:t2.id, date:Date.new(2019,2,11))

# Appointment.create(student_id:st3.id, teacher_id:t1.id, date:Date.new(2021,1,10))
# Appointment.create(student_id:st3.id, teacher_id:t2.id, date:Date.new(2020,8,20))
# Appointment.create(student_id:st3.id, teacher_id:t2.id, date:Date.new(2019,4,23))

# Appointment.create(student_id:st4.id, teacher_id:t3.id, date:Date.new(2021,3,5))
# Appointment.create(student_id:st4.id, teacher_id:t3.id, date:Date.new(2020,5,15))
# Appointment.create(student_id:st4.id, teacher_id:t4.id, date:Date.new(2019,8,9))

# Appointment.create(student_id:st5.id, teacher_id:t4.id, date:Date.new(2021,11,5))
# Appointment.create(student_id:st5.id, teacher_id:t4.id, date:Date.new(2020,12,5))
# Appointment.create(student_id:st5.id, teacher_id:t4.id, date:Date.new(2019,1,5))

puts "✅ Done seeding!"
