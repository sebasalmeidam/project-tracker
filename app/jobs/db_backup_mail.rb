class DbBackupMail
  @queue = :db_backup_mail

  def self.perform
    begin
      latest_file = Dir.glob("task-_db_backup.tar").max_by {|f| File.mtime(f)}
      DbBackupMailer.send_db_backup(latest_file).deliver!
    rescue Exception => e
      p "Errors #{e}"
    end
end
end