<?php
    class App
    {
        protected $controller = "HomeController";

        protected $method = "index";

        public function __construct()
        {
            $url = $this->parseUrl();

            if($url != null)
            {
                if(file_exists(BASE_PATH . '/app/controllers/' .$url[0] . '.php'))
                {
                    $this->controller = $url[0];
                    unset($url[0]);
                }

                require_once BASE_PATH . '/app/controllers/' . $this->controller . '.php';

                if(isset($url[1]))
                {
                    if(method_exists($this->controller, $url[1]))
                    {
                        $this->method = $url[1];
                        unset($url[1]);
                    }
                }
            }

            require_once BASE_PATH . '/app/controllers/' . $this->controller . '.php';
            $this->controller = new $this->controller;
            call_user_func_array([$this->controller, $this->method],[]);
        }

        public function parseUrl()
        {
            if(isset($_GET['con']) || isset($_GET['act']))
            {
                return [$_GET['con'], $_GET['act']];
            }
        }
    }
?>