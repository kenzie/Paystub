class Payroll < ActiveRecord::Base

  belongs_to :user

  mount_uploader :data, PayrollUploader

  validate :user_id, :presence => true

  def parse
    get_and_set_company_and_pay_day_from_data!
    get_and_build_stubs_from_data!
    # return false and add errors to data on parse errors
  end

  def stubs
    Stub.where(:payroll_id => id)
  end

private

  def xml
    @xml ||= Nokogiri::XML(File.open(data.path), nil, 'UTF-8')
  end

  def get_and_set_company_and_pay_day_from_data!
    logger.debug "[payroll] Reading payroll data file #{data.current_path}"
    self.pay_day = xml.xpath('/payroll/period_ending_date').first.content
    self.company = xml.xpath('/payroll/company/short_name').first.content
    logger.debug "[payroll] Saving payroll record for #{company}"
    self.save
  end

  def get_and_build_stubs_from_data!
    logger.debug "[payroll] Reading payroll data file #{data.current_path}"
    h = Hash.from_xml(File.open(data.current_path))
    h['payroll']['employee'].each do |employee|
      employee['payroll_id'] = id
      logger.debug "[payroll] Creating stub for #{pay_day}: #{employee['name']}"
      Stub.create(employee)
    end

    # xml.xpath('/payroll/employee').each do |employee|
    #   logger.debug Hash.from_xml(File.open(data.current_path))
    # end
  end

end