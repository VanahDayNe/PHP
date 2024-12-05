<?php
    class HomeController extends Controller
    {
        public function index()
        {         
           
            $this->view('layouts/main', 'home/index');
        }

        public function error()
        {
            $this->view('layouts/main', 'home/404');
        }

       
    }
?>