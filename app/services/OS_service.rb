require 'rbconfig'

module OS
  class OSService
    def self.name
      case RbConfig::CONFIG['host_os']

      when /linux/
        'Linux'
      when /darwin/
        'OS X'
      when /mswin|mingw32|windows/
        'Windows'
      when /solaris/
        'Solaris'
      when /bsd/
        'BSD'
      else
        RbConfig::CONFIG['host_os']
      end
    end
  end
end
