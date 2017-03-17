# TODO(v2)[#562]: Remove this file.
# https://github.com/embulk/embulk/issues/562
module Embulk
  VERSION_INTERNAL = '0.8.18'

  DEPRECATED_MESSAGE = 'Embulk::VERSION in (J)Ruby is deprecated. Use org.embulk.EmbulkVersion::VERSION instead. If this message is from a plugin, please tell this to the author of the plugin!'
  def self.const_missing(name)
    if name == :VERSION
      if Embulk.method_defined?(:logger)
        Embulk.logger.warn(DEPRECATED_MESSAGE)
      else
        STDERR.puts(DEPRECATED_MESSAGE)
      end
      return VERSION_INTERNAL
    else
      super
    end
  end
end
