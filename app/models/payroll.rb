class Payroll < ActiveRecord::Base

  has_attached_file :data, :url => '/system/:class/:attachment/:id.:extension'

  validates_attachment_presence :data
  validates_attachment_content_type :data, :content_type => [ 'text/xml', 'application/xml' ]
  validates_attachment_size :data, :less_than => 2.megabytes

  # TODO validate data format on upload

  after_save :set_pay_day

private

  # get period_ending_date from data file
  def set_pay_day
    File.open(data.path) do |file|
      line = ''
      line = file.gets until line.match(/<period_ending_date>(.*)<\/period_ending_date>/)
    end
    self.update_attribute(:pay_day, $~[1]) if self.pay_day != Date.parse($~[1])
  end

end