<?php

function dashesToCamelCase($string, $capitalizeFirstCharacter = false) 
{

    $str = str_replace('-', '', ucwords($string, '-'));

    if (!$capitalizeFirstCharacter) {
        $str = lcfirst($str);
    }

    return $str;
}

$content = "";
foreach(glob("*.svg") as $icon){
    $newIcon = substr(substr($icon, 0, -4), 3);
    $newIcon = dashesToCamelCase($newIcon);
    $content .= "static const String $newIcon = \"assets/svg/$icon\";\n";
}
file_put_contents("icons.txt", $content);