# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: 'admin@docnect.com', user_group: 0, name: 'Julian (Super User)', password: 'password', password_confirmation: 'password', activated: true, activated_at: Time.zone.now)

# Some tree branches have had structure changed, placing user input at sub-branch leaves to improve tracing through the tree
# If terminal = true and question != '', branch leads to user input
q1 = Question.create!(parent_id: 0, question: 'Please select the option which best describes your symptoms')

q2 = Question.create!(parent: q1, answer: 'Just a check up', terminal: true, diagnosis: 'The patient simply wants a check up.')

q3 = Question.create!(parent: q1, answer: 'Chest pain', question: 'Which of the following best describes the chest pain you are experiencing?')

q4 = Question.create!(parent: q1, answer: 'Cough', question: 'How long have you had this cough?')

q5 = Question.create!(parent: q1, answer: 'Coughing up blood or blood taste in the mouth (Hemoptysis)', question: 'How much blood are you coughing up/tasting?')

q6 = Question.create!(parent: q1, answer: 'Discomfort while breathing (Dyspnea)', question: 'Which of the following best describes the discomfort you experience while breathing?')

q7 = Question.create!(parent: q1, answer: 'Weakness or tiredness (Fatigue)', question: 'Which of the following best describes your fatigue?')

q8 = Question.create!(parent: q1, answer: 'Fever', question: 'Have you taken any tranquilizers and/or agents that increase levels of serotonin?')
# Structure of this branch changes - input fever temperature at end of tree.

q9 = Question.create!(parent: q1, answer: 'Headache', question: 'Have you recently experienced any physical injury or trauma?')

q10 = Question.create!(parent: q1, answer: 'Unpleasant awareness of the forceful, rapid or irregular beating of the heart (Palpitations)', question: 'Which of the following best describes the cause or further symptoms of your heart palpitations?')
# Structure of this branch changed - input age and description at end of tree.

q11 = Question.create!(parent: q1, answer: 'Involuntary weight loss (when it exceeds 5% or more of your normal body weight over a period from 6 to 12 months)', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining solely to involuntary weight loss. Please consider conducting the following tests:
- Complete blood count;
- HIV testing;
- Thyroid-stimulating hormone testing;
- Urinalysis;
- Fecal occult blood test;
- Chest radiography;
- Upper gastrointestinal series.

Most common causes:
- CANCER (30%);
- GASTROINTESTINAL DISORDERS (15%);
- DEMENTIA/DEPRESSION (15%):
- ANOREXIA NERVOSA;
- HYPERTHYROIDISM;
- ALCOHOLISM;
- SOCIAL ISOLATION.")

q12 = Question.create!(parent: q1, answer: 'Swelling in your legs and/or feet (Lower extremity edema)', question: 'Which of the following best describes the swelling you are experiencing?')

q13 = Question.create!(parent: q1, answer: 'Painful urination (Dysuria)', question: 'Please select which of the following symptoms you may also be experiencing')
# Structure change - input urinary frequency at end of tree.

# Terminal with question != '' leads to user input
q14 = Question.create!(parent: q1, answer: 'None of these symptoms', question: 'Please describe your symptoms', terminal: true)

q15 = Question.create!(parent: q3, answer: 'Very mild or mild pain', terminal: true, diagnosis: 'The patient is experiencing mild chest pain.')

q16 = Question.create!(parent: q3, answer: 'Sharp pain and/or in quick irregular bursts (spasmodic)', question: 'Which of the following symptoms do you also experience with your sharp chest pain?')

q17 = Question.create!(parent: q3, answer: 'Like a pressure, tightness, squeezing and/or gas', question: 'Which of the following symptoms do you also experience with your chest pain?')

q18 = Question.create!(parent: q3, answer: 'None of these', terminal: true, diagnosis: 'The patient is experiencing chest pain which could not be described as:
- Mild;
- Sharp and/or in quick irregular bursts (spasmodic);
- A pressure, tightness, squeezing and/or gas.')

q19 = Question.create!(parent: q16, answer: 'Shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis)', terminal: true, diagnosis: 'The patient is experiencing spasmodic chest pain with shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis):
- POSSIBLE ACUTE MYOCARDIAL INFARCTION
- POSSIBLE HYPERTROPHY OF EITHER VENTRICLE OR AORTIC STENOSIS')

#q20 = Question.create!(parent: q16-, answer: 'Pain greater when lying face upwards (supine)')

q21 = Question.create!(parent: q16, answer: 'Unpleasant awareness of the forceful, rapid or irregular beating of the heart (Palpitations)', diagnosis: 'The patient is experiencing spasmodic chest pain and heart palpitations:
- POSSIBLE MUSKULOSKELETAL CAUSE')

q22 = Question.create!(parent: q16, answer: 'Difficulty breathing (Dyspnea)', diagnosis: 'The patient is experiencing spasmodic chest pain and difficulty breathing (Dyspnea):
- POSSIBLE PNEUMOTHORAX
- POSSIBLE VIRAL RESPIRATORY TRACT INFECTION
- POSSIBLE PULMONARY EMBOLISM')

q23 = Question.create!(parent: q16, answer: 'Sudden onset of the pain with the pain spreading to the back', diagnosis: 'The patient is experiencing spasmodic chest pain and which occurs suddenly and spreads to the back:
- POSSIBLE AORTIC DISSECTION')

q24 = Question.create!(parent: q16, answer: 'Previous medical procedures at the esophagus', diagnosis: 'The patient is experiencing spasmodic chest pain and has previously had medical procedures at the esophagus:
- POSSIBLE ESOPHAGEAL PERFORATION')

q25 = Question.create!(parent: q16, answer: 'None of these', terminal: true, diagnosis: 'The patient is experiencing sharp, spasmodic chest pain.')

q26 = Question.create!(parent: q17, answer: 'Shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis)', terminal: true, diagnosis: 'The patient is experiencing chest pain akin to a pressure, tightness, squeezing and/or gas, with shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis):
- POSSIBLE ACUTE MYOCARDIAL INFARCTION
- POSSIBLE HYPERTROPHY OF EITHER VENTRICLE OR AORTIC STENOSIS')

#q27 = Question.create!(parent: q17-, answer: 'Sense of anxiety or uneasiness')

q28 = Question.create!(parent: q17, answer: 'None of these', terminal: true, diagnosis: 'The patient is experiencing chest pain akin to a pressure, tightness, squeezing and/or gas.')