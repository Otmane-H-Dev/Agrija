<?php

// Read the contents of the file
$fileContents = file_get_contents('e-shop.sql');

// Split the contents into individual statements
$statements = preg_split('/;\s*\n/', $fileContents);

// Filter out the create table statements
$filteredStatements = array_filter($statements, function ($statement) {
    return strpos($statement, 'CREATE TABLE') === false;
});

// Join the filtered statements back into a single string
$newContents = implode(";\n", $filteredStatements);

// Write the modified contents back to the file
file_put_contents('e-shop.sql', $newContents);

echo "Create table statements have been removed from the file.";

?>
