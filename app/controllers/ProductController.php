<?php
    class ProductController extends Controller
    {
        public function index()
        {
            // $cat = $_GET['cat'];
            // if(empty($cat) || !is_int($cat))
            // {
            //     header(' http://php2.test/KT/index.php?con=HomeController&act=error');
            // }
            
            // $db = $this->model('SanPham');

            // $page = (int) isset($_GET['p'])?$_GET['p']:1 ;
            // $size = 2;
            // $sp = $db->getProduct($cat, $page, $size); 
            // $numPage = ceil(($db->getNumberPage($cat))/$size);
            
            $this->view('layouts/main', 'product/index',
            // [
            //     'sp' => $sp,
            //     'trang'=>$page, 
            //     'TongSoTrang'=>$numPage,
            //     'cat'=>$cat
            // ]
            );
        }

        public function getSP()
        {
            $cat = $_GET['cat'];
            $db = $this->model('SanPham');

            $page = (int) isset($_GET['p'])?$_GET['p']:1 ;
            $size = 1;
            $sp = $db->getProduct($cat, $page, $size); 
            echo json_encode($sp);
            
        }
        

        public function detail()
        {
             $id = $_GET['id'];
            if(empty($id) || !is_int($id))
            {
                header('http://php2.test/KT/index.php?con=HomeController&act=error');
            }
            
            $db = $this->model('SanPham');
            $sp = $db->layCTSP($id);
            
            $this->view('layouts/main','product/detail', ['sp'=>$sp]);
        }

        public function cart()
        {
            
            $this->view('layouts/main','product/cart');
        }
    }
?>