<?php

    require_once('manifest/config.php');

    exec( 'mysqldump -u'.$settings['database']['user'].' --password='.$settings['database']['password'].' '.$settings['database']['db'].' > '.$settings['database']['db'].'.sql' )
?>
