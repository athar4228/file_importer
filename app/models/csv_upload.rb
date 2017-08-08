require 'smarter_csv'

class CsvUpload

  include ActiveModel::Model

  attr_accessor :file

  validates :file, presence: true
  validate :file_format

  def process!
    #TODO move this logic to work asynchronously if file can be larger in size and update notice to customer
    begin
      invalid_people_data = []
      rows = SmarterCSV.process(self.file.path, parsing_options)

      rows.each do |row|
        person = Person.new(row)
        invalid_people_data << person.email_or_name unless person.save
        #TODO send the invalid_people_data to admin via email
      end
    rescue
      Rails.logger.error("[Parsing Failure] Unable to parse file")
      return false
    end
  end

  private

  def parsing_options
    options = {
      key_mapping: {
        name: :name,
        email_address: :email,
        telephone_number: :telephone_number,
        website: :website,
      }
    }
    options
  end

  def file_format
    errors[:file] << "is not a valid CSV" if self.file.try(:content_type) != 'text/csv'
  end
end
