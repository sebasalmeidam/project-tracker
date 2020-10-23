class DbBackupMailer < ApplicationMailer
  def send_db_backup(file_path)
    begin  
      attachments['DB_Backup.tar'] = File.read(file_path)
      mail(to: %w{email@gmail.com email2@gmail.com},
           subject: 'prueba : DB Backup')
    rescue Exception => e
      p "error #{e}"
    end
  end
end
