class Payroll < ActiveRecord::Base

  belongs_to :user
  has_many :stubs

  mount_uploader :data, PayrollUploader

  validate :user_id, :presence => true

  def parse
    get_and_set_company_and_pay_day_from_data!
    # create stubs from data
    # return false and add errors to data on parse errors
  end

private

  def get_and_set_company_and_pay_day_from_data!
    logger.debug "[payroll] Reading payroll data file #{data.current_path}"
    xml = Nokogiri::XML(File.open(data.path), nil, 'UTF-8')
    self.pay_day = xml.xpath('/payroll/period_ending_date').first.content
    self.company = xml.xpath('/payroll/company/short_name').first.content
    logger.debug "[payroll] Saving payroll record for #{company}"
    self.save
  end

end