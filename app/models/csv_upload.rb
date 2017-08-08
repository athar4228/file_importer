class CsvUpload

  include ActiveModel::Model

  attr_accessor :file

  validates :file, presence: true
  validate :file_format

  def process!
  end

  private

  def file_format
    errors[:file] << "is not a valid CSV" if self.file.try(:content_type) != 'text/csv'
  end
end
