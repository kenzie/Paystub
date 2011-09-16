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

  def data_hash
    logger.debug "[payroll] Reading payroll data file #{data.current_path}"
    @data_hash ||= Hash.from_xml(File.open(data.current_path))
  end

  def get_and_set_company_and_pay_day_from_data!
    self.pay_day = data_hash['payroll']['pay_date']
    self.company = data_hash['payroll']['company']['short_name']
    logger.debug "[payroll] Saving payroll record for #{company}, #{pay_day}"
    self.save
  end

  def get_and_build_stubs_from_data!
    data_hash['payroll']['employee'].each do |employee|
      employee['payroll_id'] = id
      logger.debug "[payroll] Creating stub for #{company}, #{pay_day}: #{employee['name']}"
      Stub.create(employee)
    end
  end

end