<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kayitEkle.aspx.cs" Inherits="FirstProject.kayitEkle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div style="padding:20px; border:2px solid #7da56c; width:500px;text-align:center; margin-left:30%; margin-top:30px;">
            <div class="form-group">
                <label for="exampleInputFullName">Ad Soyad</label>
                <input type="text" class="form-control" id="exampleInputFullName"  aria-describedby="emailHelp"/>
            </div>
             <div class="form-group">
                <label for="exampleInputPosition">Pozisyon</label>
                <input type="text" class="form-control" id="exampleInputPosition" aria-describedby="emailHelp"/>
            </div>
               <div class="form-group">
                <label for="exampleInputOffice">Ofis</label>
                <input type="text" class="form-control" id="exampleInputOffice" aria-describedby="emailHelp"/>
            </div>
             <div class="form-group">
                <label for="exampleInputSalary">Maaş</label>
                <input type="text" class="form-control" id="exampleInputSalary" aria-describedby="emailHelp"/>
            </div>


            <input type="submit" name="sbmt_Ekle" id="sbmt_Ekle" value="Ekle" class="btn btn-primary" />
           
        </div>
    </form>
    
</body>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="jquery-3.5.0.min.js" type="text/javascript" ></script>
<script >
    $(document).ready(function () {
        $("#sbmt_Ekle").click(function () {
            var name = document.getElementById("exampleInputFullName");
            var position = document.getElementById("exampleInputPosition");
            var office = document.getElementById("exampleInputOffice");
            var salary = document.getElementById("exampleInputSalary");
            if (name.value == "" || position.value == "" || office.value == "" || salary.value== "" ) {
                alert("Lütfen bilgileri eksiksiz doldurun!!! ");
                return false;
            }
            $.ajax({
                type:"POST",
                contentType: "application/json",
                url: "kayitEkle.aspx/SaveData",
                data: "{'name':'" + name.value + "','position':'" + position.value + "','office':'" + office.value + "','salary':'" + salary.value + "'}",
                datatype: "json",
                success: function (data) {
                    alert("Kayit Başarılı");
                }
             
            });
           
        });
    });
</script>
</html>
