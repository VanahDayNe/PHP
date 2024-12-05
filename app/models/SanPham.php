<?php
    class SanPham extends Model
    {
        public function getProducts($page = 1, $size = 20, $numPage = true)
        {
            if($numPage)
            {
                $offset = ($page - 1)*$size;
                $sql = "SELECT * FROM  vw_fruit ORDER BY thutu DESC LIMIT $size OFFSET $offset";
                return $this->fetchAll($sql, ['size' => $size, 'offset'=>$offset]);
            }
            else
            {
                $sql = "SELECT * FROM  vw_fruit ORDER BY thutu DESC";
                return $this->fetchAll($sql);
            }
        }

        public function getProduct($cat, $page = 1, $size = 20, $numPage = true)
        {
            if($numPage)
            {
                $offset = ($page - 1)*$size;
                $sql = "SELECT * FROM  vw_fruit WHERE idCat = :idCat ORDER BY thutu DESC LIMIT $size OFFSET $offset";
                return $this->fetchAll($sql,['idCat'=> $cat]);
            }
            else
            {
                $sql = "SELECT * FROM  vw_fruit WHERE idCat = :idCat ORDER BY thutu DESC";
                return $this->fetchAll($sql,['idCat'=> $cat]);
            }
        }

        public function getNumberPage($cat)
        {
            if($cat > 0)
            {
                $data = $this->getProduct($cat,1,20,false);
                return count($data);
            }
            else
            {
                $data = $this->getProducts(false);
                return count($data);
            }
            
        }

        public function layCTSP($id)
        {
            $sql = "SELECT * FROM vw_fruit WHERE id = :id";
            return $this->fetchOne($sql,['id'=>$id]);
        }
    }
?>