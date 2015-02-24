name             'ngrok'
maintainer       'Greg Albrecht'
maintainer_email 'gba@onbeep.com'
license          'Apache License, Version 2.0'
description      'Installs/Configures ngrok'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '1.0.0'

depends 'ark', ">0.8.2"
depends 'supervisor'
