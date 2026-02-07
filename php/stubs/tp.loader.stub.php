
<?php

namespace think;

/**
 * thinkphp5 Loader stub
 */
class Loader
{
    /**
     * [STUB] thinkphp Controller 
     * @template T
     * @param class-string<T> $name
     * @return T
     */
    public static function controller($name, $layer = 'controller', $appendSuffix = false, $empty = '') {}


    /**
     * [STUB] thinkphp Model
     * @template T of \think\Model&\ArrayAccess&\JsonSerializable
     * @param class-string<T> $name
     * @return T
     */
    public static function model($name = '', $layer = 'model', $appendSuffix = false, $common = 'common') {}
}
