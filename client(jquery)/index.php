<!DOCTYPE html>
<html>
    <head>
        <title>Antrian Badan Administrasi Umum UNIKOM</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>
          $(document).ready(function(){
            $("#ambil").hide();
            $("#loket").hide();
            var norfid="";
            var loket ="";
            $.ajax({
              url : 'http://localhost:8080/lumen/public/api/v1/pelayanan'
            }).then(function(data){
              if(data.status == 200){
                $.each(data.result,function(index,value){
                  $("#button").append('<a button onclick="lanjut('+value.id_pelayanan+')" class="btn btn-primary">'+value.nama_pelayanan+'</button> &nbsp;');
                });
              }
            });
            $("#cek").click(function(){
              norfid = $("#rfid").val();
              if(norfid ==0){
                alert('Harap isi no rfid');
              }else{
                  $.post("http://localhost:8080/lumen/public/api/v1/validasimhs",
                  {
                      no_rfid: norfid
                  },
                  function(data){
                      var result = $.parseJSON(JSON.stringify(data));
                      var status = result.status;
                      if(status==200){                        
                        $("#ambil").show();
                        $("#scan").hide();   
                      }else{
                        alert('NOMOR RFID TIDAK DIKENALI');
                      }
                  }); 
              }
            });
           
            var $id = <?php  if(isset($_GET['id'])){
             echo $_GET['id']; 
            }else{
              echo "''";
            }
            ?>;

            
          });

          function ambil_antrian($id){
            $.post("http://localhost:8080/lumen/public/api/v1/antrian",
            {
                no_rfid: "123",
                no_loket: $id
            },
            function(data){
                var result = $.parseJSON(JSON.stringify(data));
                var status = result.status;
                if(status==201){
                  alert('Nomor antrian anda adalah : '+result.result);
                }else{
                  alert('Gagal mengambil nomor antrian');
                }
                document.location.href="index.php";
            });
          }    
          
          function lanjut($id){
            loket=$id;
            $.ajax({
              url : 'http://localhost:8080/lumen/public/api/v1/loket/'+loket
            }).then(function(data){
              if(data.status == 200){
                $.each(data.result,function(index,value){
                  $("#ambil").hide();
                  $("#loket").show();
                  $("#button2").append('<button class="btn btn-primary" id="tes" onclick="ambil_antrian('+$id+');">'+value.nama_loket+'</button> &nbsp;');
                });
              }
            });
            
          }
        </script>
    </head>
    <body>
      <nav class="navbar navbar-default">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Brand</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Bantuan</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>

    <div class="container" id="scan">
    <center>
      <h1>Selamat Datang</h1>
      <h4>Silahkan scan kartu mahasiswa anda</h4>
      <div class="col-md-4"></div>
      <div class="row col-md-4">
      <div class="form-group vertical-center-row">
        <input type="text" name="rfid" id="rfid" class="form-control">
      </div>
      <div class="form-group">
        <button class="btn btn-primary" id="cek">Lanjutkan</button>
      </div>
      </div>
      </center>
    </div>

    <div class="container" id="ambil">
        <h1>Ambil Antrian</h1>
          <div id="button">
        </div>
    </div>

    <div class="container" id="loket">
        <h1>Keperluan Anda</h1>
        <div id="button2">

        </div>
    </div>
        
    </body>
</html>
