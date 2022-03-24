<?php

namespace App\Controller;

use Symfony\Component\HttpClient\NativeHttpClient;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PlexController
{
    #[Route('/plex')]
    public function available_movies(): Response
    {
        $client = new NativeHttpClient();
        $response = $client->request("GET", "http://127.0.0.1:8080/movies");
        $content = $response->getContent();

        $response = new Response($content);
        $response->headers->set("Content-Type", "application/json");

        return $response;
    }
}
