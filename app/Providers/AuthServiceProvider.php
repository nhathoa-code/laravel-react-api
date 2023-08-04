<?php

namespace App\Providers;
use App\Models\Admin;
use App\Models\Post;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
       
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        Gate::before(function (Admin $admin) {
            if($admin->is_admin){
                return true;
            };
        });

        Gate::define('admin-action', function (Admin $admin) {
            return $admin->is_admin;
        });

        Gate::define('author-action', function (Admin $admin) {
            return $admin->is_author;
        });

        Gate::define('update-post', function (Admin $admin,Post $post){
            return $admin->id === $post->author_id;
        });

        Gate::define('delete-post', function (Admin $admin,Post $post){
            return $admin->id === $post->author_id;
        });

        Gate::define('manager-action', function (Admin $admin) {
            return $admin->is_manager;
        });
    }
}
