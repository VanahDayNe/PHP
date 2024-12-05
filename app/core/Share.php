<?php
class Share
{
    public static function getMenu()
    {
        require_once BASE_PATH . '/app/models/Menu.php';

        $menu = new Menu();

        $menu1 = $menu->getMenu1();

        $html = "";

        foreach ($menu1 as $i)
        {
            $menuChild = $menu->getMenuChild(['idCha' => $i['id']]);
            if (empty($menuChild)) {
                $html .= '<li><a href="/KT/index.php?con=ProductController&act=index&cat='.$i['idCat']. '">' . $i["ten"] . '</a></li>';
            } else {
                $html .= '<li><a href="/KT/index.php?con=ProductController&act=index&cat='.$i['idCat']. '">' . $i["ten"] . '</a>' 
                        . '<ul class="sub-menu">';
                            foreach ($menuChild as $ii)
                            {
                                $html .= '<li><a href="/KT/index.php?con=ProductController&act=index&cat='.$ii['idCat']. '">' . $ii["ten"] . '</a></li>';
                            }
                $html .= '</ul>';
                $html .= '</li>';
            }
        }
        return $html;
    }

    // public static function getSP()
    // {
    //     require_once BASE_PATH . '/app/models/SanPham.php';

    //     $sp = new SanPham();

    //     $sp1 = $sp->getSP();

    //     $html = "";

    //     foreach ($sp1 as $i) {
    //         if(isset($sp1))
    //         $html .= '<div class="row">'
    //             .'<div class="col-lg-4 col-md-6 text-center">'
    //             .'	<div class="single-product-item">'

    //                 . '<div class="product-image">'
    //                     . '<a href="http://php2.test/KT/index.php?con=ProductController&act=detail">'
    //                     . '<img src="' . $i["img"] .'" alt=""></a>'
    //                     . '</div> '
    //                     . '<h3>' . $i['ten'] . '</h3>'
    //                     . '<p class=""><span>' . $i["mota"] . '</span>' . $i["gia"] . '$' . ' </p>'
    //                     . '<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>'
    //                 . '</div>'
    //             .   '</div>'
    //             .'</div>';
    //     }
    //     return $html;
    // }
}
?>