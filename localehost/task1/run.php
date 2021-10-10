<?php
#!/usr/bin/env php
// php run.php $start $end

if ($argc != 3) {
    die(PHP_EOL . 'Use: php run.php start end' . PHP_EOL);
}

$start = (int)$argv[1];
$end = (int)$argv[2];

function fooBar($start, $end)
{
    if ($start > $end) {
        print '<h1> Ошибочка!</h1>>';
        return;
    } else {
        for($i = $start; $i <= $end; $i++) {
            if ($i % 3 == 0 && $i % 5 == 0) print 'FooBar<br>';
            else if ($i % 3 == 0) print 'Foo<br>';
            else if ($i % 5 == 0) print 'Bar<br>';
        }
    }
}

fooBar($start, $end);

