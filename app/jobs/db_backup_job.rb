class DbBackupJob
@queue = :auto_db_backup

  def self.perform
    system( "backup perform --trigger task" )
  end 
end