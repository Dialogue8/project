<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\user;

class CreateUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            [
                'username' =>  'Admin',
                'level' =>  'kurikulum',
                'password'  =>  bcrypt('12345')
            ],
            [
                'username' =>  'Admin1',
                'level' =>  'siswa',
                'password'  =>  bcrypt('12345')
            ],
            [
                'username' =>  'Admin2',
                'level' =>  'walikelas',
                'password'  =>  bcrypt('12345')
            ],
            [
                'username' =>  'Admin3',
                'level' =>  'guru',
                'password'  =>  bcrypt('12345')
            ]
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
