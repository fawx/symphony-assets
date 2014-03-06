<?php

    require_once('manifest/config.php');

    $user = $settings['database']['user'];
    $pass = $settings['database']['password'];
    $db = $settings['database']['db'];

    exec( 'mysqldump -u'. $user .' --password='. $pass .' '. $db .' > ' . $db .'.sql' )
?>
