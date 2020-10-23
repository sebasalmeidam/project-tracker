class Attachment < ActiveRecord::Base
  belongs_to :task
  belongs_to :client

  mount_uploader :file, AttachmentUploader
end
