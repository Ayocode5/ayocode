<?php

/**
 * parse json string
 * @return object
 */
function json_parse(string $json_string): object
{
    return (object) json_decode($json_string, true);
}