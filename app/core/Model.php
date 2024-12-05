<?php
    class Model
    {
        protected $db;

        public function __construct()
        {
            $this->db = new PDO('mysql:host=localhost;dbname=fruitshop','root','');
            $this->db-> exec("set names utf8mb4");
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        public function query($sql, $params=[])
        {
            $q = $this->db->prepare($sql);
            $q->execute($params);
            return $q;
        }

        public function fetchAll($sql, $params=[])
        {
            $q = $this->query($sql, $params);
            return $q->fetchAll(PDO::FETCH_ASSOC);
        }

        public function fetchOne($sql, $params=[])
        {
            $q = $this->query($sql, $params);
            return $q->fetch(PDO::FETCH_ASSOC);
        }
    }
?>