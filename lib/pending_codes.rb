# Keep track of incoming access codes (codes generated on
# other nodes for shares we do not yet have)

require 'permahash'
require 'fileutils'

class PendingCodes
  path = Conf.data_dir "pending_codes.db"
  @db = Permahash.new path

  def self.add path, code
    FileUtils.mkdir_p path
    @db[code] = path
  end

  def self.delete code
    @db.delete code
  end
end
