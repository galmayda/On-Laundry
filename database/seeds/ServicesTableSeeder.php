<?php

use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ServicesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('services')->insert([
            'name' => 'Regular',
            'price' => 20000
        ]);

        DB::table('services')->insert([
            'name' => 'Premium',
            'price' => 30000
        ]);
    }
}
