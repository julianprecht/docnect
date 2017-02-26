# Some tree branches have had structure changed, placing user input at sub-branch leaves to improve tracing through the tree
# If terminal = true and question != '', branch leads to user input
q1 = Question.create!(parent_id: nil, question: 'Please select the option which best describes your symptoms:')

q2 = Question.create!(parent: q1, answer: 'Just a check up', terminal: true, diagnosis: 'The patient simply wants a check up.')

q3 = Question.create!(parent: q1, answer: 'Chest pain', question: 'Which of the following best describes the chest pain you are experiencing?')

q4 = Question.create!(parent: q1, answer: 'Cough', question: 'How long have you had this cough?')

q5 = Question.create!(parent: q1, answer: 'Coughing up blood or blood taste in the mouth (Hemoptysis)', question: 'How much blood are you coughing up/tasting?')

q6 = Question.create!(parent: q1, answer: 'Discomfort while breathing (Dyspnea)', question: 'Which of the following symptoms accompany your discomfort while breathing?')

q7 = Question.create!(parent: q1, answer: 'Weakness or tiredness (Fatigue)', question: 'Which of the following best describes your fatigue?')

q8 = Question.create!(parent: q1, answer: 'Fever', question: 'Have you taken any tranquilizers and/or agents that increase levels of serotonin?')# Structure of this branch changes - input fever temperature at end of tree.


q9 = Question.create!(parent: q1, answer: 'Headache', question: 'Have you recently experienced any physical injury or trauma?')

q10 = Question.create!(parent: q1, answer: 'Unpleasant awareness of the forceful, rapid or irregular beating of the heart (Palpitations)', question: 'Which of the following best describes the cause or further symptoms of your heart palpitations?')# Structure of this branch changed - input age and description at end of tree.


q11 = Question.create!(parent: q1, answer: 'Involuntary weight loss (when it exceeds 5% or more of your normal body weight over a period from 6 to 12 months)', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining solely to involuntary weight loss. Please consider conducting the following tests:

&#8227; Complete blood count;
&#8227; HIV testing;
&#8227; Thyroid-stimulating hormone testing;
&#8227; Urinalysis;
&#8227; Fecal occult blood test;
&#8227; Chest radiography;
&#8227; Upper gastrointestinal series.

Most common causes:

&#8227; CANCER (30%);
&#8227; GASTROINTESTINAL DISORDERS (15%);
&#8227; DEMENTIA/DEPRESSION (15%):
&#8227; ANOREXIA NERVOSA;
&#8227; HYPERTHYROIDISM;
&#8227; ALCOHOLISM;
&#8227; SOCIAL ISOLATION.")

q12 = Question.create!(parent: q1, answer: 'Swelling in your legs and/or feet (Lower extremity edema)', question: 'Which of the following best describes the swelling you are experiencing?')

q13 = Question.create!(parent: q1, answer: 'Painful urination (Dysuria)', question: 'Please select which of the following symptoms you may also be experiencing')# Structure change - input urinary frequency at end of tree.


# Terminal with question != '' leads to user input
q14 = Question.create!(parent: q1, answer: 'None of these symptoms', question: 'Please describe your symptoms:', terminal: true, diagnosis: "The patient's symptoms did not match any listed by Docnect:")

q15 = Question.create!(parent: q3, answer: 'Very mild or mild pain', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to mild chest pain. More tests are required.")

q16 = Question.create!(parent: q3, answer: 'Sharp pain and/or in quick irregular bursts (spasmodic)', question: 'Which of the following symptoms do you also experience with your sharp chest pain?')

q17 = Question.create!(parent: q3, answer: 'Like a pressure, tightness, squeezing and/or gas', question: 'Which of the following symptoms do you also experience with your chest pain?')

q18 = Question.create!(parent: q3, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to chest pain. More tests are required.")

q19 = Question.create!(parent: q16, answer: 'Shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis)', terminal: true, diagnosis: 'The patient is experiencing spasmodic chest pain with shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis):

&#8227; POSSIBLE ACUTE MYOCARDIAL INFARCTION;
&#8227; POSSIBLE HYPERTROPHY OF EITHER VENTRICLE OR AORTIC STENOSIS.')

q20 = Question.create!(parent: q16, answer: 'Pain greater when lying face upwards (supine) than when standing upright', question: 'Which of the following symptoms are also present?')

q20_1 = Question.create!(parent: q20, answer: 'Pain increases with respiration, coughing or swallowing', terminal: true, diagnosis: 'The patient is experiencing spasmodic chest pain which is greater when lying face upwards and increases with respiration, coughing or swallowing:

&#8227; POSSIBLE PERICARDITIS.')

q20_2 = Question.create!(parent: q20, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to chest pain which is greater when lying face upwards. More tests are required.")

q21 = Question.create!(parent: q16, answer: 'Unpleasant awareness of the forceful, rapid or irregular beating of the heart (Palpitations)', terminal: true, diagnosis: 'The patient is experiencing spasmodic chest pain and heart palpitations:

&#8227; POSSIBLE MUSKULOSKELETAL CAUSE.')

q22 = Question.create!(parent: q16, answer: 'Difficulty breathing (Dyspnea)', terminal: true, diagnosis: 'The patient is experiencing spasmodic chest pain and difficulty breathing (Dyspnea):

&#8227; POSSIBLE PNEUMOTHORAX;
&#8227; POSSIBLE VIRAL RESPIRATORY TRACT INFECTION;
&#8227; POSSIBLE PULMONARY EMBOLISM.')

q23 = Question.create!(parent: q16, answer: 'Sudden onset of the pain with the pain spreading to the back', terminal: true, diagnosis: 'The patient is experiencing spasmodic chest pain and which occurs suddenly and spreads to the back:

&#8227; POSSIBLE AORTIC DISSECTION.')

q24 = Question.create!(parent: q16, answer: 'Previous medical procedures at the esophagus', terminal: true, diagnosis: 'The patient is experiencing spasmodic chest pain and has previously had medical procedures at the esophagus:

&#8227; POSSIBLE ESOPHAGEAL PERFORATION.')

q25 = Question.create!(parent: q16, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to spasmodic chest pain. More tests are required.")

q26 = Question.create!(parent: q17, answer: 'Shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis)', terminal: true, diagnosis: 'The patient is experiencing chest pain akin to a pressure, tightness, squeezing and/or gas, with shortness of breath, dizziness, feeling of impending doom, nausea and/or sweating (diaphoresis):

&#8227; POSSIBLE ACUTE MYOCARDIAL INFARCTION;
&#8227; POSSIBLE HYPERTROPHY OF EITHER VENTRICLE OR AORTIC STENOSIS.')

q27 = Question.create!(parent: q17, answer: 'Sense of anxiety or uneasiness', question: 'Which of the following symptoms are also present?')

q27_1 = Question.create!(parent: q27, answer: 'Pain to the throat, lower jaw, inner shoulders, inner arms, upper abdomen and/or back', terminal: true, diagnosis: 'The patient is experiencing chest pain akin to a pressure, tightness, squeezing and/or gas, accompanied by anxiety and pain to the upper body:

&#8227; POSSIBLE MYOCARDIAL ISCHEMIA;
&#8227; POSSIBLE HYPERTROPHY OF EITHER VENTRICLE OR AORTIC STENOSIS.')

q27_2 = Question.create!(parent: q27, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a tightness in the chest, accompanied by anxiety. More tests are required.")

q28 = Question.create!(parent: q17, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a tightness in the chest. More tests are required.")

q29 = Question.create!(parent: q4, answer: 'Less than 3 weeks', question: 'Which of the following symptoms do you also note with your cough?')

q30 = Question.create!(parent: q29, answer: 'Coughing a lot during the night (prominent nocturnal cough)', terminal: true, diagnosis: 'The patient has been experiencing a prominent nocturnal cough for less than 3 weeks:

&#8227; COUGH VARIANT ASTHMA.')

q31 = Question.create!(parent: q29, answer: 'Difficult or laboured breathing (Dyspnea) with or without physical effort', terminal: true, diagnosis: "The patient's input was insufficient to give a successful diagnosis, pertaining to dyspnea with or without physical effort. Please consider conducting the following tests:

&#8227; Assessment of oxygenation;
&#8227; Assessment of airflow;
&#8227; Chest radiography.")

q32 = Question.create!(parent: q29, answer: 'Fever, stuffy nose (nasal congestion) and/or sore throat', terminal: true, diagnosis: 'The patient has been experiencing a cough with a fever, nasal congestion and/or sore throat for less than 3 weeks:

&#8227; VIRAL RESPIRATORY TRACT INFECTION.')

q33 = Question.create!(parent: q29, answer: 'Cough with phlegm (Mucus)', terminal: true, diagnosis: 'The patient has been experiencing a cough with mucus for less than 3 weeks:

&#8227; CHRONIC OBSTRUCTIVE PULMONARY DISEASE.')

q34 = Question.create!(parent: q29, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a cough, present for less than 3 weeks. More tests are required.")

q35 = Question.create!(parent: q4, answer: '3-8 weeks', question: 'Which of the following symptoms do you also note with your cough?')

q36 = Question.create!(parent: q35, answer: 'Excessive phlegm (mucus secretions)', question: 'Which of the following is most applicable to you?')

q37 = Question.create!(parent: q36, answer: 'I am a smoker', terminal: true, diagnosis: 'The patient is a smoker and has been experiencing a cough with mucus secretions for 3-8 weeks:

&#8227; CHRONIC OBSTRUCTIVE PULMONARY DISEASE.')

q38 = Question.create!(parent: q36, answer: 'I have a history of recurrent or complicated pneumonia', terminal: true, diagnosis: 'The patient has a history of pneumonia and has been experiencing a cough with mucus secretions for 3-8 weeks:

&#8227; BRONCHIECTASIS.')

q39 = Question.create!(parent: q36, answer: 'I am a non-smoker with no history of recurrent or complicated pneumonia.', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a cough with mucus secretions, present for 3-8 weeks. More tests are required.")

q40 = Question.create!(parent: q35, answer: 'Unexplained weight loss, fever and/or night sweats', terminal: true, diagnosis: 'The patient has been experiencing a cough for 3-8 weeks, as well as unexplained weight loss, a fever and/or night sweats:

&#8227; POSSIBLE BRONCHOGENIC CARCINOMA.')

q41 = Question.create!(parent: q35, answer: 'Difficult or laboured breathing (Dyspnea) with or without physical effort', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a cough with dyspnea, present for 3-8 weeks. More tests are required.")

q42 = Question.create!(parent: q35, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a cough, present for 3-8 weeks. More tests are required.")

q43 = Question.create!(parent: q4, answer: 'More than 8 weeks', question: 'Which of the following symptoms do you also note with your cough?')

q44 = Question.create!(parent: q43, answer: 'Excessive phlegm (mucus secretions)', question: 'Which of the following is most applicable to you?')

q45 = Question.create!(parent: q44, answer: 'I am a smoker', terminal: true, diagnosis: 'The patient is a smoker and has been experiencing a cough with mucus secretions for more than 8 weeks:

&#8227; CHRONIC OBSTRUCTIVE PULMONARY DISEASE.')

q46 = Question.create!(parent: q44, answer: 'I have a history of recurrent or complicated pneumonia', terminal: true, diagnosis: 'The patient has a history of pneumonia and has been experiencing a cough with mucus secretions for more than 8 weeks:

&#8227; BRONCHIECTASIS.')

q47 = Question.create!(parent: q44, answer: 'I am a non-smoker with no history of recurrent or complicated pneumonia.', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a cough with mucus secretions, present for more than 8 weeks. More tests are required.")

q48 = Question.create!(parent: q43, answer: 'Unexplained weight loss, fever and/or night sweats', terminal: true, diagnosis: 'The patient has been experiencing a cough for more than 8 weeks, as well as unexplained weight loss, a fever and/or night sweats:

&#8227; POSSIBLE BRONCHOGENIC CARCINOMA.')

q49 = Question.create!(parent: q43, answer: 'Difficult or laboured breathing (Dyspnea) with or without physical effort', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a cough with dyspnea, present for more than 8 weeks. More tests are required.")

q50 = Question.create!(parent: q43, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a cough, present for more than 8 weeks. More tests are required.")

q51 = Question.create!(parent: q5, answer: 'Massive (200-600 mL or 1-2 cups in 24 hours)', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to serious Hemoptysis. More tests are required.")

q52 = Question.create!(parent: q5, answer: 'Quite a bit (Mild)', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to mild Hemoptysis. More tests are required.")

q53 = Question.create!(parent: q5, answer: 'Very small (trivial)', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to trivial Hemoptysis. More tests are required.")

q54 = Question.create!(parent: q6, answer: 'Sudden, acute chest pain', terminal: true, diagnosis: 'The patient is experiencing dyspnea as well as sudden, acute chest pain:

&#8227; POSSIBLE PNEUMOTHORAX;
&#8227; POSSIBLE VIRAL RESPIRATORY TRACT INFECTION.')

q55 = Question.create!(parent: q6, answer: 'Periodic chest pain preceding the dyspnea (discomfort while breathing)', terminal: true, diagnosis: 'The patient is experiencing dyspnea preceded by periodic chest pain:

&#8227; POSSIBLE MYOCARDIAL ISCHEMIA;
&#8227; POSSIBLE PULMONARY EMBOLISM.')

q56 = Question.create!(parent: q6, answer: 'Wheezing', terminal: true, diagnosis: 'The patient is experiencing dyspnea and wheezing while breathing:

&#8227; POSSIBLE ACUTE BRONCHITIS;
&#8227; POSSIBLE ASTHMA ONSET;
&#8227; POSSIBLE FOREIGN BODY;
&#8227; POSSIBLE VOCAL CHORD DYSFUNCTION.')

q57 = Question.create!(parent: q6, answer: 'Cough and/or fever', terminal: true, diagnosis: 'The patient is experiencing dyspnea as well as a cough and/or fever:

&#8227; PULMONARY DISEASE.')

q58 = Question.create!(parent: q6, answer: 'Prolonged immobilization or estrogen therapy in the past 4 weeks.', terminal: true, diagnosis: 'The patient is experiencing dyspnea, as well as prolonged immobilization/has undertaken estrogen therapy in the past 4 weeks:

&#8227; POSSIBLE PULMONARY EMBOLISM.')

q59 = Question.create!(parent: q6, answer: 'History of thromboembolism, cancer, obesity and/or lower extremity trauma', question: 'Do you also also experience any of the following symptoms?')

q60 = Question.create!(parent: q59, answer: 'Prolonged immobilization or estrogen therapy in the past 4 weeks.', terminal: true, diagnosis: 'The patient is experiencing dyspnea, as well as prolonged immobilization/has undertaken estrogen therapy in the past 4 weeks. The patient also has a history of thromboembolism, cancer, obesity and/or lower extremity trauma:

&#8227; POSSIBLE PULMONARY EMBOLISM.')

q61 = Question.create!(parent: q59, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to dyspnea and a history of thromboembolism, cancer, obesity and/or lower extremity trauma. More tests are required.")

q62 = Question.create!(parent: q6, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to dyspnea. More tests are required.")

q63 = Question.create!(parent: q7, answer: 'Difficulty with concentration and memory (Mental fatigue)', question: 'Do you suffer from any of the following conditions?')

q64 = Question.create!(parent: q63, answer: 'Insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication', question: 'Have you noted any significant weight loss since you noticed your fatigue?')

q65 = Question.create!(parent: q64, answer: 'Yes, I have noted significant weight loss', question: 'Are you also suffering from a fever?')

q66 = Question.create!(parent: q65, answer: 'Yes, I have a fever', question: 'What is your body temperature and how much weight have you lost?', terminal: true, diagnosis: 'The patient is experiencing mental fatigue, as well as having a fever and noting significant weight loss. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q67 = Question.create!(parent: q65, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing mental fatigue and has noted significant weight loss. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q68 = Question.create!(parent: q64, answer: 'No, I have not noted any weight loss', question: 'Are you also suffering from a fever?')

q69 = Question.create!(parent: q68, answer: 'Yes, I have a fever', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing mental fatigue, as well as having a fever. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q70 = Question.create!(parent: q68, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing mental fatigue and also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q71 = Question.create!(parent: q63, answer: 'None of these', question: 'Have you noted any significant weight loss since you noticed your fatigue?')

q72 = Question.create!(parent: q71, answer: 'Yes, I have noted significant weight loss', question: 'Are you also suffering from a fever?')

q73 = Question.create!(parent: q72, answer: 'Yes, I have a fever', question: 'What is your body temperature and how much weight have you lost?', terminal: true, diagnosis: 'The patient is experiencing mental fatigue, as well as having a fever and noting significant weight loss:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q74 = Question.create!(parent: q72, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing mental fatigue and has noted significant weight loss:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q75 = Question.create!(parent: q71, answer: 'No, I have not noted any weight loss', question: 'Are you also suffering from a fever?')

q76 = Question.create!(parent: q75, answer: 'Yes, I have a fever', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing mental fatigue, as well as having a fever:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q77 = Question.create!(parent: q75, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing mental fatigue:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q78 = Question.create!(parent: q7, answer: 'Difficulty in completing activities (Easy fatigability)', question: 'Do you suffer from any of the following conditions?')

q79 = Question.create!(parent: q78, answer: 'Insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication', question: 'Have you noted any significant weight loss since you noticed your fatigue?')

q80 = Question.create!(parent: q79, answer: 'Yes, I have noted significant weight loss', question: 'Are you also suffering from a fever?')

q81 = Question.create!(parent: q80, answer: 'Yes, I have a fever', question: 'What is your body temperature and how much weight have you lost?', terminal: true, diagnosis: 'The patient is experiencing easy fatigability, as well as having a fever and noting significant weight loss. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q82 = Question.create!(parent: q80, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing easy fatigability and has noted significant weight loss. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q83 = Question.create!(parent: q79, answer: 'No, I have not noted any weight loss', question: 'Are you also suffering from a fever?')

q84 = Question.create!(parent: q83, answer: 'Yes, I have a fever', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing easy fatigability, as well as having a fever. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q85 = Question.create!(parent: q83, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing easy fatigability and also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q86 = Question.create!(parent: q78, answer: 'None of these', question: 'Have you noted any significant weight loss since you noticed your fatigue?')

q87 = Question.create!(parent: q86, answer: 'Yes, I have noted significant weight loss', question: 'Are you also suffering from a fever?')

q88 = Question.create!(parent: q87, answer: 'Yes, I have a fever', question: 'What is your body temperature and how much weight have you lost?', terminal: true, diagnosis: 'The patient is experiencing easy fatigability, as well as having a fever and noting significant weight loss:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q89 = Question.create!(parent: q87, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing easy fatigability and has noted significant weight loss:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q90 = Question.create!(parent: q86, answer: 'No, I have not noted any weight loss', question: 'Are you also suffering from a fever?')

q91 = Question.create!(parent: q90, answer: 'Yes, I have a fever', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing easy fatigability, as well as having a fever:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q92 = Question.create!(parent: q90, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing easy fatigability:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q93 = Question.create!(parent: q7, answer: 'Difficulty in initiating activities (Generalized weakness)', question: 'Do you suffer from any of the following conditions?')

q94 = Question.create!(parent: q93, answer: 'Insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication', question: 'Have you noted any significant weight loss since you noticed your fatigue?')

q95 = Question.create!(parent: q94, answer: 'Yes, I have noted significant weight loss', question: 'Are you also suffering from a fever?')

q96 = Question.create!(parent: q95, answer: 'Yes, I have a fever', question: 'What is your body temperature and how much weight have you lost?', terminal: true, diagnosis: 'The patient is experiencing generalized weakness, as well as having a fever and noting significant weight loss. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q97 = Question.create!(parent: q95, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing generalized weakness and has noted significant weight loss. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q98 = Question.create!(parent: q94, answer: 'No, I have not noted any weight loss', question: 'Are you also suffering from a fever?')

q99 = Question.create!(parent: q98, answer: 'Yes, I have a fever', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing generalized weakness, as well as having a fever. The patient also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q100 = Question.create!(parent: q98, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing generalized weakness and also suffers from insomnia, depression, panic attacks, anxiety, alcoholism, and/or use of drugs and/or medication:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q101 = Question.create!(parent: q93, answer: 'None of these', question: 'Have you noted any significant weight loss since you noticed your fatigue?')

q102 = Question.create!(parent: q101, answer: 'Yes, I have noted significant weight loss', question: 'Are you also suffering from a fever?')

q103 = Question.create!(parent: q102, answer: 'Yes, I have a fever', question: 'What is your body temperature and how much weight have you lost?', terminal: true, diagnosis: 'The patient is experiencing generalized weakness, as well as having a fever and noting significant weight loss:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q104 = Question.create!(parent: q102, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing generalized weakness and has noted significant weight loss:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q105 = Question.create!(parent: q101, answer: 'No, I have not noted any weight loss', question: 'Are you also suffering from a fever?')

q106 = Question.create!(parent: q105, answer: 'Yes, I have a fever', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing generalized weakness, as well as having a fever:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q107 = Question.create!(parent: q105, answer: 'No, I do not have a fever', terminal: true, diagnosis: 'The patient is experiencing generalized weakness:

&#8227; POSSIBLE PSYCHIATRIC ILLNESS (MOST LIKELY)
&#8227; POSSIBLE HYPERTHIROIDISM
&#8227; POSSIBLE HYPOTHIROIDISM
&#8227; POSSIBLE CONGESTIVE HEART FAILURE
&#8227; POSSIBLE INFECTIONS
&#8227; POSSIBLE CHRONIC OBSTRUCTIVE PULMONARY DISEASE
&#8227; POSSIBLE SLEEP APNEA
&#8227; POSSIBLE ANEMIA
&#8227; POSSIBLE AUTOIMMUNE DISORDER
&#8227; POSSIBLE IRRITABLE BOWEL SYNDROME
&#8227; POSSIBLE CANCER

Suggested tests:

&#8227; Complete blood count;
&#8227; Erythrocyte sedimentation rate;
&#8227; Serum chemistries;
&#8227; Antinuclear antibody;
&#8227; Urinalysis;
&#8227; Tuberculin skin test;
&#8227; Serum cortisol;
&#8227; Rheumatoid factor;
&#8227; Immunoglobulin levels;
&#8227; HIV antibody test;
&#8227; Epstein-Barr virus antibody test.')

q108 = Question.create!(parent: q7, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to fatigue. More tests are required.")

q109 = Question.create!(parent: q8, answer: 'Yes, I have taken one of these substances', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing a fever and has taken tranquilizers and/or agents that increase levels of serotonin:

&#8227; POSSIBLE ALLERGIC REACTION;
&#8227; POSSIBLE NEUROLEPTIC MALIGNANT SYNDROME;
&#8227; POSSIBLE SEROTONIN SYNDROME.')

q110 = Question.create!(parent: q8, answer: 'No, I have not taken any of these substances', question: 'What is your body temperature?', terminal: true, diagnosis: 'The patient is experiencing a fever:

&#8227; POSSIBLE INFECTION;
&#8227; POSSIBLE FUO (Fever of Undetermined Origin).')

q111 = Question.create!(parent: q9, answer: 'Yes, I have', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining solely to a headache caused by trauma. More tests are required.")

q112 = Question.create!(parent: q9, answer: 'No, I have not experienced any trauma', question: 'Which of the following best describes your headache?')

q113 = Question.create!(parent: q112, answer: 'The start of the headache was sudden and reached maximal and severe intensity within seconds or minutes', terminal: true, diagnosis: 'The patient is experiencing a headache, not caused by trauma, which began suddenly and reached peak intensity within seconds or minutes:

&#8227; POSSIBLE SUBARACHNOID HEMORRHAGE (43%).')

q114 = Question.create!(parent: q112, answer: 'Episodic headache with unpleasant awareness of the forceful, rapid or irregular beating of the heart (palpitations) and sweat', terminal: true, diagnosis: 'The patient is experiencing an episodic headache, not caused by trauma, accompanied by heart palpitations and sweating:

&#8227; POSSIBLE PHEOCHROMOCYTOMA.')

q115 = Question.create!(parent: q112, answer: 'The head hurts only one one particular side or spot (Unilateral headache), bright lights hurt your eyes (photophobia), nausea and/or vomiting', terminal: true, diagnosis: 'The patient is experiencing a unilateral headache, not caused by trauma, accompanied by photophobia, nausea and/or vomiting:

&#8227; POSSIBLE MIGRANE.')

q116 = Question.create!(parent: q112, answer: 'I am pregnant', terminal: true, diagnosis: 'The patient is pregnant and is experiencing a headache, not caused by trauma:

&#8227; POSSIBLE PREECLAMPSIA (if associated with hypertension).')

q117 = Question.create!(parent: q112, answer: 'I am over 50', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a headache, not caused by trauma. Please consider conducting the following tests:

&#8227; Neruoimaging.")

q118 = Question.create!(parent: q112, answer: 'I have a history of hypertension', terminal: true, diagnosis: 'The patient has a history of hypertension and is experiencing a headache, not caused by trauma:

&#8227; POSSIBLE MALIGNANT HYPERTENSION.')

q119 = Question.create!(parent: q112, answer: 'I have a history of HIV', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a headache, not caused by trauma. Please consider conducting the following tests:

&#8227; Neruoimaging.")

q120 = Question.create!(parent: q112, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to a headache, not caused by trauma. More tests are required.")

q121 = Question.create!(parent: q10, answer: 'Palpitations occur regularly during effort', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations regularly during effort:

&#8227; POSSIBLE RATE-DEPENDENT BYPASS TRACT;
&#8227; POSSIBLE HYPERTROPHIC CARDIOMYOPATHY.')

q122 = Question.create!(parent: q10, answer: 'Palpitations start and/or stop suddenly', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations which start and/or stop suddenly:

&#8227; POSSIBLE SUPRAVENTRICULAR OR VENTRICULAR TACHICARDIA.')

q123 = Question.create!(parent: q10, answer: 'Heart beats during palpitations could be described as "flip-flopping" or "stop and start"', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations which could be described as "flip-flopping" or "stop and start":

&#8227; POSSIBLE CAUSE BEING THE PREMATURE CONTRACTION OF THE ATRIUM OR VENTRICLE.')

q124 = Question.create!(parent: q10, answer: 'Heart beats during palpitations could be described as a "rapid fluttering in my chest"', question: 'How frequently do your heart beats appear to "flutter"?')

q125 = Question.create!(parent: q124, answer: 'Regular fluttering', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations which could be described as regularly-paced "fluttering" in their chest:

&#8227; POSSIBLE SUPRAVENTRICULAR OR VENTRICULAR ARRHYTHMIA.')

q126 = Question.create!(parent: q124, answer: 'Irregular fluttering', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations which could be described as irregularly-paced "fluttering" in their chest:

&#8227; POSSIBLE ATRIAL FIBRILLATION;
&#8227; POSSIBLE ATRIAL FLUTTER;
&#8227; POSSIBLE TACHYCARDIA WITH VARIABLE BLOCK.')

q127 = Question.create!(parent: q10, answer: 'Heart beats during palpitations could be described as "pounding in the neck"', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations which could be described as "pounding in the neck":

&#8227; POSSIBLE "CANNON" A WAVES IN THE JUGULAR VENOUS PULSATIONS THAT OCCUR WHEN THE RIGHT ATRIUM CONTRACTS AGAINST A CLOSED TRICUSPID VALVE.')

q128 = Question.create!(parent: q10, answer: 'Significant weight loss', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations as well as significant weight loss:

&#8227; POSSIBLE HYPERTHYROIDISM.')

q129 = Question.create!(parent: q10, answer: 'Vomiting and/or diarrhoea', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations as well as vomiting and/or diarrhoea:

&#8227; POSSIBLE ELECTROLYTE DISORDER;
&#8227; POSSIBLE HYPOVOLEMIA.')

q130 = Question.create!(parent: q10, answer: 'Chest pain', question: 'Is the pain relieved by leaning forward?')

q131 = Question.create!(parent: q130, answer: 'Yes, leaning forward relieves the pain', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations and chest pain, which is relieved by leaning forward:

&#8227; POSSIBLE PERICARDIAL DISEASE.')

q132 = Question.create!(parent: q130, answer: 'No, leaning forward does not alleviate the pain', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations and chest pain, which is not relieved by leaning forward:

&#8227; POSSIBLE ISCHEMIC HEART DISEASE.')

q133 = Question.create!(parent: q10, answer: 'Light-headedness, presyncope and/or syncope (temporary loss of consciousness)', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations, as well as light-headedness, presyncope and/or syncope:

&#8227; POSSIBLE HYPOTENSION;
&#8227; POSSIBLE CARDIAC ARRHYTHMIA.')

q134 = Question.create!(parent: q10, answer: 'Overbreathing (hyperventilation), hand-tingling and/or nervousness', question: 'What was your age at the first episode? Please also describe the rate, duration and degree of regularity of your heart beat during the palpitations as best as you can.', terminal: true, diagnosis: 'The patient is experiencing heart palpitations, as well as hyperventilation, hand-tingling and/or nervousness:

&#8227; POSSIBLE ANXIETY OR PANIC DISORDER.')

q135 = Question.create!(parent: q12, answer: 'Swelling in both legs', terminal: true, diagnosis: 'The patient is experiencing lower extremity edema in both legs:

&#8227; POSSIBLE NEPHROTIC SYNDROME;
&#8227; POSSIBLE VOLUME OVERLOAD CAUSED BY RENAL FAILURE.')

q136 = Question.create!(parent: q12, answer: 'The swelling is painful', terminal: true, diagnosis: 'The patient is experiencing painful lower extremity edema:

&#8227; POSSIBLE POSTPHLEBITIC SYNDROME;
&#8227; POSSIBLE RUPTURE OF POPLITEAL CYST;
&#8227; POSSIBLE TRAUMA;
&#8227; POSSIBLE CELLULITIS.')

q137 = Question.create!(parent: q12, answer: '"Heavy legs"', question: 'Are you experiencing an itching sensation in your legs?')

q138 = Question.create!(parent: q137, answer: 'Yes, my legs are itching', terminal: true, diagnosis: 'The patient is experiencing lower extremity edema, describing an itching and "heavy" sensation in their legs:

&#8227; POSSIBLE CHRONIC VENOUS INSUFFICIENCY.')

q139 = Question.create!(parent: q137, answer: 'No, I do not feel any itching', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to lower extremity edema and a \"heavy legs\" sensation. More tests are required.")

q140 = Question.create!(parent: q12, answer: 'Untreated malignancy (cancer), paralysis, recently bedridden for more than 3 days due to major surgery in the past 4 weeks, entire leg swelling and/or swelling of one calf', terminal: true, diagnosis: 'The patient is experiencing lower extremity edema, also noting an untreated malignancy (cancer), paralysis, recently bedridden for more than 3 days due to major surgery in the past 4 weeks, entire leg swelling and/or swelling of one calf:

&#8227; POSSIBLE DEEP VEIN THROMBOSIS.')

q141 = Question.create!(parent: q12, answer: 'None of these', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to lower extremity edema. More tests are required.")

q142 = Question.create!(parent: q13, answer: 'Presence of blood in the urine (colour becomes red-brown)', question: 'How many times per day do you need to go to the toilet (urinary frequency)?', terminal: true, diagnosis: 'The patient is experiencing painful urination, noting the presence of blood in their urine:

&#8227; POSSIBLE HEMORRAGIC CYSTITIS;
&#8227; POSSIBLE BLADDER CANCER;
&#8227; POSSIBLE UPPER TRACT DISEASE.')

q143 = Question.create!(parent: q13, answer: 'Back pain, nausea, vomiting, history of diabetes mellitus, recent urinary tract infection and/or incontinence', question: 'How many times per day do you need to go to the toilet (urinary frequency)?', terminal: true, diagnosis: 'The patient is experiencing painful urination, as well as suffering from back pain, nausea, vomiting, history of diabetes mellitus, recent urinary tract infection and/or incontinence:

&#8227; POSSIBLE PYELONEPHRITIS.')

q144 = Question.create!(parent: q13, answer: 'Risk of pregnancy, immunosuppression, diabetes and/or a history of recent bladder or urethral instrumentation', question: 'How many times per day do you need to go to the toilet (urinary frequency)?', terminal: true, diagnosis: 'The patient is experiencing painful urination, noting a risk of pregnancy, immunosuppression, diabetes and/or a history of recent bladder or urethral instrumentation:

&#8227; POSSIBLE CYSTITIS.')

q145 = Question.create!(parent: q13, answer: 'Sexually active and/or having a new partner', question: 'How many times per day do you need to go to the toilet (urinary frequency)?', terminal: true, diagnosis: 'The patient is experiencing painful urination, noting they are sexually active and/or have a new partner:

&#8227; POSSIBLE CHLAMIDIAL INFECTION.')

q146 = Question.create!(parent: q13, answer: 'Inability to develop or maintain an erection of the penis. (Erectile dysfunction)', question: 'How many times per day do you need to go to the toilet (urinary frequency)?', terminal: true, diagnosis: 'The patient is experiencing painful urination, and is also suffering from erectile dysfunction:

&#8227; POSSIBLE DEPRESSION.')

q147 = Question.create!(parent: q13, answer: 'If you are a WOMAN, any of these symptoms:

&#8227; Irritation of the genital area;
&#8227; Itching;
&#8227; Inflammation around the labia and/or perineal areas;
&#8227;  An increased, strong smelling liquid coming out of the vagina (vaginal discharge).', question: 'How many times per day do you need to go to the toilet (urinary frequency)?', terminal: true, diagnosis: 'The patient is female and is experiencing painful urination. She is also suffering from one or more of the following symptoms:

&#8227; Irritation of the genital area;
&#8227; Itching;
&#8227; Inflammation around the labia and/or perineal (space between the vagina and the anus) areas;
&#8227;  An increased, strong smelling liquid coming out of the vagina (vaginal discharge).

Expected causes:

&#8227; POSSIBLE VULVOVAGINITIS;
&#8227; POSSIBLE CYSTITIS.')

q148 = Question.create!(parent: q13, answer: 'None of these', question: 'How many times per day do you need to go to the toilet (urinary frequency)?', terminal: true, diagnosis: "The patient's input was insufficient to reach a successful diagnosis, pertaining to painful urination. More tests are required.")

# Defined users last
User.create!(email: 'admin@docnect.com', user_group: 0, name: 'Julian Precht', password: 'password', password_confirmation: 'password', activated: true, activated_at: Time.zone.now, last_online: Time.zone.now)
User.create!(email: 'doctor@docnect.com', user_group: 2, name: 'Doc Marten', password: 'password', password_confirmation: 'password', activated: true, activated_at: Time.zone.now, last_online: Time.zone.now, specialization: 'General Practitioner', phone: '+44 7575 998998', address: 'University Hospital, Coventry, Warwickshire')
User.create!(email: 'patient@docnect.com', user_group: 1, name: 'Alex Macpherson', password: 'password', password_confirmation: 'password', activated: true, activated_at: Time.zone.now, last_online: Time.zone.now, dob: 21.years.ago, nationality: 'English', marital_status: 'Single', occupation: 'Student', hobbies: 'Computer Science, building and testing Docnect!', languages: 'English', height: 185, weight: 70, allergies: 'None', smoke: 'No', alcohol: 'Yes #legend', tattoos: 'None', history: "Operation under general anaesthetic Spring '07", medication: 'None', drugs: false, illness: 'None')