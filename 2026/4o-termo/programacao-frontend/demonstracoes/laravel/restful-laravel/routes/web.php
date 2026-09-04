<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return "<h1>Hello World!!! </h1>";
});

Route::get("/ping", function() {
    return response()->json(["message" => "pong! Api Funcionando"], 200);
});