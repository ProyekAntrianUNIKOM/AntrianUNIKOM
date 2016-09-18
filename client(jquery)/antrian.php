<?php
class Antrian{
    private $administrasi,$akademik,$count;
    function getAdministrasi() {
        return $this->administrasi;
    }

    function getAkademik() {
        return $this->akademik;
    }

    function getCount() {
        return $this->count;
    }

    function setAdministrasi($administrasi) {
        $this->administrasi = $administrasi;
    }

    function setAkademik($akademik) {
        $this->akademik = $akademik;
    }

    function setCount($count) {
        $this->count = $count;
    }

    public function Antrian(){
        $count=0;
        $this->administrasi = array(); 
        $this->akademik = array(); 
    }
    
    public function tambah($jenis){
        if($jenis=="administrasi"){
            $this->count=$this->count+1;
            array_push($this->administrasi, $this->count);
        }else{
            $this->count++;
            array_push($this->akademik, $this->count);
        }
    }
    
    public function ambil(){
        return array_shift($this->administrasi);
    } 
}

?>