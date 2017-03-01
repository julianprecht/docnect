class ReportPdf < Prawn::Document
  def initialize(user, age, diagnosis, doctors)
  super()
    @user = user
    @age = age
    @diagnosis = diagnosis
    @doctors = doctors
    header
    profile
    footer
  end

  def header
    text "Diagnosis Report for #{@user.name}", :size => 20, :align => :center, :style => :bold
    pad(10) { stroke_horizontal_rule }
  end

  def profile
    pad(10) {
      text 'Personal Information:', :size => 16, :align => :center, :style => :bold

      pad_top(5) { text 'Date of Birth:', :style => :bold }
      pad_bottom(5) { text "#{@user.dob.strftime('%d/%m/%Y')} (#{@age} years old)" }

      pad_top(5) { text 'Nationality/nationalities:', :style => :bold }
      pad_bottom(5) { text @user.nationality }

      pad_top(5) { text 'Spoken Languages:', :style => :bold }
      pad_bottom(5) { text @user.languages }

      pad_top(5) { text 'Marital Status:', :style => :bold }
      pad_bottom(5) { text @user.marital_status }

      pad_top(5) { text 'Occupation:', :style => :bold }
      pad_bottom(5) { text @user.occupation }

      pad_top(5) { text 'Hobbies:', :style => :bold }
      pad_bottom(5) { text @user.hobbies }
    }

    pad(10) {
      text 'Medical Information:', :size => 16, :align => :center, :style => :bold

      pad_top(5) { text 'Height:', :style => :bold }
      pad_bottom(5) { text "#{@user.height} cm" }

      pad_top(5) { text 'Weight:', :style => :bold }
      pad_bottom(5) { text "#{@user.weight} kg" }

      pad_top(5) { text 'Known Allergies:', :style => :bold }
      pad_bottom(5) { text @user.allergies }

      pad_top(5) { text 'Smoking History:', :style => :bold }
      pad_bottom(5) { text @user.smoke }

      pad_top(5) { text 'Alcohol History:', :style => :bold }
      pad_bottom(5) { text @user.alcohol }

      pad_top(5) { text 'Current Tattoos (if any):', :style => :bold }
      pad_bottom(5) { text @user.tattoos }

      pad_top(5) { text 'Medical History:', :style => :bold }
      pad_bottom(5) { text @user.history }

      pad_top(5) { text 'Current Medication:', :style => :bold }
      pad_bottom(5) { text @user.medication }

      pad_top(5) { text 'Illegal Drug Usage:', :style => :bold }
      pad_bottom(5) { text "#{@user.name} #{@user.drugs ? 'makes' : 'does not make'} use of illegal drugs and/or substances." }

      pad_top(5) { text 'Illnesses known to run in the family:', :style => :bold }
      pad_bottom(5) { text @user.illness }
    }

    pad_top(20) {
      text 'Docnect Diagnostic Test:', :size => 16, :align => :center, :style => :bold

      pad_top(5) { text 'Inferred Diagnosis:', :style => :bold }
      pad_bottom(5) { text @diagnosis.last.diagnosis.gsub(/&#8227;/, '>') }
      if @diagnosis.last.diagnosis == "The patient's symptoms did not match any listed by Docnect:"
        pad_bottom(5) { text "\"#{@diagnosis.last.answer}\"", :style => :italic }
      end
    }

    pad(10) {
      text 'Patient Answers:', :size => 16, :align => :center, :style => :bold
      @diagnosis.each do |diagnosis|
        unless diagnosis.answer.blank?
          pad_bottom(5) { text diagnosis.answer.gsub(/&#8227;/, '>') }
        end
        unless diagnosis.question.blank?
          pad_top(5) { text diagnosis.question.gsub(/&#8227;/, '>'), :style => :bold }
        end
      end
    }
  end

  def footer
    pad(10) { stroke_horizontal_rule }
    text "Diagnosis report generated on #{@user.last_test.strftime('%d/%m/%Y at %H:%M')}", :align => :center
  end
end