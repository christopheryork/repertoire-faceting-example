require 'pathname'

dir = Pathname(__FILE__).dirname.expand_path + 'repertoire-assets'

require dir + 'exceptions'
require dir + 'manifest'
require dir + 'provides'
require dir + 'processor'
require dir + 'version'

require dir + 'railtie' if defined?(Rails)