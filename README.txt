## Configurar Permissões e Settings

chmod a+w $(pwd)/www/drupal-7.59/sites/default && \
cp config/settings.php $(pwd)/www/drupal-7.59/sites/default && \
chmod a+w $(pwd)/www/drupal-7.59/sites/default/settings.php

http://172.21.0.5/install.php

chmod go-w $(pwd)/www/drupal-7.59/sites/default/settings.php && \
chmod go-w $(pwd)/www/drupal-7.59/sites/default
