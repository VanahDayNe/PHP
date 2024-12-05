<?php

    class Controller
    {
        public function model($model)
        {
            require_once BASE_PATH . '/app/models/' . $model . '.php';
            return new $model();
        }

        public function view($layout, $view, $data = [])
        {
            foreach ($data as $key => $value)
            {
                $$key = $value;
            }

            $viewPath = BASE_PATH . '/app/views/' .$view . '.php';
            if($layout == '')
            {
                require_once BASE_PATH . '/app/views/layouts/index.php';
            }
            else
            {
                require_once BASE_PATH . '/app/views/' . $layout . '.php';
            }
        }
    }
?>