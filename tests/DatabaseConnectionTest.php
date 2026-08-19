<?php

namespace App\Tests;

use Doctrine\DBAL\Connection;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class DatabaseConnectionTest extends KernelTestCase
{
    public function testDatabaseConnection(): void
    {
        self::bootKernel();

        /** @var Connection $connection */
        $connection = self::getContainer()->get(Connection::class);

        $this->assertTrue($connection->connect());
        $this->assertTrue($connection->isConnected());
    }
}