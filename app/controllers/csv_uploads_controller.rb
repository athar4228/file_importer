class CsvUploadsController < ApplicationController

  def new
    @csv_upload = CsvUpload.new
  end

  def create
    @csv_upload = CsvUpload.new(csv_upload_params)
    if @csv_upload.valid? && @csv_upload.process!
      redirect_to new_csv_upload_path
    else
      render :new
    end
  end

  private

  def csv_upload_params
    params.require(:csv_upload).permit(:file)
  end
end
