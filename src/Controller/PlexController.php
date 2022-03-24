<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PlexController
{
    #[Route('/plex')]
    public function available_movies(): Response
    {
        $available = ["12 Monkeys"];

        return new Response(
            '<html lang="en"><body>' . implode('<br>', $available)  . '</body></html>'
        );
    }
}
