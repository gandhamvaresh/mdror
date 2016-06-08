class UserMailer < ActionMailer::Base
  default from: "MDManage Rehab <rehabmail@mdmanage.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user

    mail :to => user.email, :subject => "MDManage - Password Reset Request"
  end
  
  def completed_examination_email(examination)
    @examination = examination
    @accident = @examination.accident
    @patient = @accident.patient
    mail :to => @patient.client.claim_recipient_email, :subject => "MDManage - new examination available for claim processing"
  end
  
  def completed_treatment_email(treatment)
    @treatment = treatment
    @examination = treatment.chiropractic_examination
    @accident = @examination.accident
    @patient = @accident.patient
    mail :to => @patient.client.claim_recipient_email, :subject => "MDManage - new treatment available for claim processing"
  end
end
