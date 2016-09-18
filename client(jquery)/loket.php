<!DOCTYPE html>
<html>
    <head>
        <title>Antrian Badan Administrasi Umum UNIKOM</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>
          $(document).ready(function(){
            var $id = <?php echo $_GET['id'];?>;
            $.ajax({
              url : 'http://localhost:8080/lumen/public/api/v1/loket/'+$id
            }).then(function(data){
              if(data.status == 200){
                $.each(data.result,function(index,value){
                  $("#button").append('<button class="btn btn-primary" id="tes" onclick="ambil_antrian('+$id+');">'+value.nama_loket+'</button> &nbsp;');
                });
              }
            });
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

    <div class="container">
        <h1>Keperluan Anda</h1>
        <div id="button">

        </div>

    </div>
        
    </body>
</html>
