class PatientDecorator < ApplicationDecorator
  delegate_all

  def last_chriopractice_exam_days
    last_dated_chriopractice_exam = patient.last_dated_chriopractice_exam
    unless last_dated_chriopractice_exam.nil? || last_dated_chriopractice_exam.completed_at.nil?
      (Date.current - last_dated_chriopractice_exam.completed_at.to_date).to_i
    end
  end


end