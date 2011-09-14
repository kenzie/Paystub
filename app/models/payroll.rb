class Payroll < ActiveRecord::Base

  belongs_to :user

  has_attached_file :data, :url => '/system/:class/:attachment/:id.:extension'

  validates_attachment_presence :data
  validates_attachment_content_type :data, :content_type => [ 'text/xml', 'application/xml' ]
  validates_attachment_size :data, :less_than => 2.megabytes

  validate :user_id, :presence => true

  # TODO validate data format on upload
  
  after_save :set_company_and_pay_day_from_data

private

  def set_company_and_pay_day_from_data
    logger.debug "[Payroll] Reading payroll XML file #{data.path}"
    doc = Nokogiri::XML(File.open(data.path), nil, 'UTF-8')
    attribs = {
      :pay_day => doc.xpath('/payroll/period_ending_date').first.content,
      :company => doc.xpath('/payroll/company/short_name').first.content
    }
    if self.pay_day != Date.parse(attribs[:pay_day]) || self.company != attribs[:company]
      logger.debug "[Payroll] Saving payroll record for #{attribs[:company]}"
      self.update_attributes(attribs)
    end
  end

end