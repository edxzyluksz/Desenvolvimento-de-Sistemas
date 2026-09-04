<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    /**
     * GET
     */
    public function index()
    {
        return response()->json(Produto::all(), 200);
    }

    /**
     * POST
     */
    public function store(Request $request)
    {
        // valida os termos para a request 
        $request -> validate([
            "nome" => "required|string",
            "preco" => "required|numeric",
            "quantidade" => "required|integer",  
        ]);
        $produto = Produto::created($request->all());
        return response()->json($produto, 201);

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
