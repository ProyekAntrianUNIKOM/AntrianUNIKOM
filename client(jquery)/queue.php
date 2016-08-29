<?php
class ListNode
{
    public $data; 
    public $next;
    function __construct($data){
        $this->data = $data; 
        $this->next = NULL; 
    }
    
    function readNode(){
        return $this->data;
    }
}

class LinkList{
    private $awal; 
    private $akhir; 
    private $count; 
    
    //keadaan awal
    function __construct() {
        $this->awal = null;
        $this->akhir = null; 
        $this->count =0;
    }
    
    //tambah list 
    public function tambah($data)
    {
        $link = new ListNode($data); 
        $link->next = $this->awal; 
        $this->awal = &$link; 
        
        if($this->akhir == null);
    }
}